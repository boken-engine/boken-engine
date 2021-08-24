/* Copyright 2021 The Boken Authors
 *
 * This Source Code Form is subject to the terms of the Mozilla Public
 * License, v. 2.0. If a copy of the MPL was not distributed with this
 * file, You can obtain one at https://mozilla.org/MPL/2.0/. */

import Foundation
import PathKit

enum StoryParserError: Error {
    case resourceNotFound
    case decodingError
    case readError
}

extension StoryParserError: LocalizedError {
    public var errorDescription: String? {
        switch self {
        case .resourceNotFound:
            return NSLocalizedString("The story description resource could not be found.",
                                     comment: "storyParserErrorResourceNotFound")
        case .decodingError:
            return NSLocalizedString("A decoding error ocurred when decoding the story description.",
                                     comment: "storyParserErrorDecodingError")
        case .readError:
            return NSLocalizedString("Could not access mocked Story Description file.",
                                     comment: "storyParserErrorReadingMockedStoryDescription")
        }
    }
}

class StoryParser {

    private func readLocalFileFromBundle(resourceName: String) throws -> String {
        let bundle = Bundle.main
        if let filepath = bundle.path(forResource: resourceName, ofType: "json") {
            let contents = try String(contentsOfFile: filepath)
            return contents
        } else {
            throw StoryParserError.resourceNotFound
        }
    }
    
    private func readLocalFile(resourceName: String) throws -> String {
        let filepath = Path(#file) + Path("../../../../Tests/BokenEngineTests/Resources/" + resourceName + ".json")
        let path = filepath.normalize();
        if path.exists {
            let contents:String = try path.read()
            return contents
        } else {
            throw StoryParserError.resourceNotFound
        }
    }

    private func decodeContents(contents: String) throws -> AppDescription? {
        let jsonData = contents.data(using: .utf8)!
        do {
            return try JSONDecoder().decode(AppDescription.self, from: jsonData)
        } catch DecodingError.dataCorrupted(let context) {
            print(context.underlyingError ?? "Data corrupted error")
            throw StoryParserError.decodingError
        } catch {
            throw StoryParserError.decodingError
        }
    }

    func decodeJSON(contents: String) throws -> AppDescription? {
        return try decodeContents(contents: contents)
    }

    func decodeJSON(resourceName: String) throws -> AppDescription? {
        let contents = isRunningTest() ?
                        try readLocalFile(resourceName: resourceName) :
                        try readLocalFileFromBundle(resourceName: resourceName)
        return try decodeContents(contents: contents)
    }

    func decodeJSON() throws -> AppDescription? {
        let descriptionResource = isRunningTest() ? "MockedStoryDescription" : "StoryDescription"
        return try decodeJSON(resourceName: descriptionResource)
    }

}
