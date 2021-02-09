//
//  StoryParser.swift
//  Boken Engine
//
//  Created by Yeray on 30/10/2020.
//  Copyright © 2020 Hyve. All rights reserved.
//

import Foundation

enum StoryParserError: Error {
    case resourceNotFound
    case decodingError
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
        }
    }
}

class StoryParser {

    private func readLocalFile(resourceName: String) throws -> String {
        let bundle = isRunningTest() ? Bundle(for: type(of: self)) : Bundle.main
        if let filepath = bundle.path(forResource: resourceName, ofType: "json") {
            let contents = try String(contentsOfFile: filepath)
            return contents
        } else {
            throw StoryParserError.resourceNotFound
        }
    }

    private func decodeContents(contents: String) throws -> AppDescription? {
        let jsonData = contents.data(using: .utf8)!
        do {
            return try JSONDecoder().decode(AppDescription.self, from: jsonData)
        } catch {
            throw StoryParserError.decodingError
        }
    }

    func decodeJSON(contents: String) throws -> AppDescription? {
        return try decodeContents(contents: contents)
    }

    func decodeJSON(resourceName: String) throws -> AppDescription? {
        let contents = try readLocalFile(resourceName: resourceName)
        return try decodeContents(contents: contents)
    }

    func decodeJSON() throws -> AppDescription? {
        let descriptionResource = isRunningTest() ? "MockedStoryDescription" : "StoryDescription"
        return try decodeJSON(resourceName: descriptionResource)
    }
}
