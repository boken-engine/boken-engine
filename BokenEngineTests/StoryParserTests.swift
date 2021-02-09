//
//  StoryParserTests.swift
//  Story Parser Tests
//
//  Created by Yeray on 21/10/2020.
//  Copyright © 2020 Hyve. All rights reserved.
//

import XCTest
@testable import BokenEngine

class StoryParserTests: XCTestCase {

    let goodContents = """
        {"appTitle": "prototype",
        "scenes": [{"sceneId": "TitleScene", "elements": { "elementsArray": [] }, "navigation": "next"},
                   {"sceneId": "TitleScene", "elements": { "elementsArray": [] }, "navigation": "back"}]}
        """

    let badContents = """
        {"scenes": [{"sceneId": "TitleScene", "elements": { "elementsArray": [] }}]}
        """

    var storyParser: StoryParser?

    override func setUp() {
        storyParser = StoryParser()
    }

    override func tearDown() {
    }

    func testSucessfulContentsParse() {
        do {
            let appDescription = try storyParser?.decodeJSON(contents: goodContents)!
            XCTAssert(appDescription!.scenes.count == 2)
        } catch {
            XCTFail("Parsing of good contents throwed an error")
        }
    }

    func testSucessfulResourceFileParse() {
        do {
            let appDescription = try storyParser?.decodeJSON(resourceName: "MockedStoryDescription")
            XCTAssertNotNil(appDescription)
            XCTAssert(appDescription!.scenes.count == 3)
        } catch {
            print(error.localizedDescription)
            XCTFail("Parsing of good resource file throwed an error")
        }
    }

    func testSucessfulDefaultFileParse() {
        do {
            let appDescription = try storyParser?.decodeJSON()
            XCTAssertNotNil(appDescription)
            XCTAssert(appDescription!.scenes.count == 3)
        } catch {
            print(error.localizedDescription)
            XCTFail("Parsing of good default file throwed an error")
        }
    }

    func testFailingResourceFileParse() {
        var thrownError: Error?

        XCTAssertThrowsError(try storyParser?.decodeJSON(resourceName: "InexistentStoryDescription")) {
            thrownError = $0
        }

        XCTAssertTrue(thrownError is StoryParserError)

        XCTAssertEqual(thrownError as? StoryParserError, .resourceNotFound)
    }

    func testFailingContentsParse() {
        var thrownError: Error?

        XCTAssertThrowsError(try storyParser?.decodeJSON(contents: badContents)) {
            thrownError = $0
        }

        XCTAssertTrue(thrownError is StoryParserError)

        XCTAssertEqual(thrownError as? StoryParserError, .decodingError)
    }
}
