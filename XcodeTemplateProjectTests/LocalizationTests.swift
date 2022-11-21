//
//  LocalizationTests.swift
//  XcodeTemplateProjectTests
//
//  Created by Mikhail Zhigulin in 7531.
//
//  Copyright © 7531 Mikhail Zhigulin of Novosibirsk.
//
//  Licensed under the special license. See LICENSE file.
//  All rights reserved.
//
//  Before start unit tests, make sure that previous app's installation is removed.
//
///  swiftlint:disable file_length
///  swiftlint:disable type_body_length
//

import XCTest
@testable import XcodeTemplateProject

class LocalizationTests: XCTestCase {

    private let defaults = Settings.ud

    override class func setUp() {
        super.setUp()

        print(">> [\(type(of: self))]." + #function)

        UserPreferences.setVersionNumber()
        UserPreferences.setBuildNumber()

        UserPreferences.registerSettingsBundle(with: Settings.bundleParams)
    }

    // func test_zero() { XCTFail("Tests not yet implemented in \(type(of: self)).") }
    // func test_the_first_success() { XCTAssertTrue(true, "It's done!") }

    // MARK: - Version and Build Titles

    func test_release_app_number_group_title_should_be_localized() {

        let expected = "release".localizedFromSettings
        let requirement = "release".localizedFromRequirements

        XCTAssertEqual(requirement, expected,
                       "\"release\" group title is not correct with the expected value.")
    }

    func test_version_title_should_be_localized() {

        let expected = "version".localizedFromSettings
        let requirement = "version".localizedFromRequirements

        XCTAssertEqual(requirement, expected,
                       "\"version\" title is not correct with the expected value.")
    }

    func test_build_title_should_be_localized() {

        let expected = "build".localizedFromSettings
        let requirement = "build".localizedFromRequirements

        XCTAssertEqual(requirement, expected,
                       "\"build\" title hasn't is not correct with the expected value.")
    }

    // MARK: - UI tests

    func test_greetings_should_meet_requirement() {

        let greetings_expected = "greetings".localizedFromRequirements
        let greetings_actual = "greetings".localizedValue

        let message_not_equal = "Greetings doesn't meet requirement!"

        XCTAssertEqual(greetings_expected, greetings_actual, message_not_equal)
    }

    func test_MainViewController_greetings() {

        let sut = MainViewController.storyboardInstance()

        sut.loadViewIfNeeded()

        let greetings_expected = "greetings".localizedValue
        let greetings_actual = sut.greetingsLabel.text

        let message_not_equal = "Something went wrong with localized greetings!"

        XCTAssertEqual(greetings_expected, greetings_actual, message_not_equal)
    }
}
