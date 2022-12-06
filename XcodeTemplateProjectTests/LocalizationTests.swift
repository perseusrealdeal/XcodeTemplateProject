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

    // MARK: - Dark Mode Titles in Settings bundle

    func test_Dark_Mode_group_title_should_be_localized() {

        let expected = "Dark Mode".localizedFromSettings
        let requirement = "Dark Mode".localizedFromRequirements

        let tell_not_equal =
        "\"Dark Mode\" group title is not correct with the expected value."

        XCTAssertEqual(requirement, expected, tell_not_equal)
    }

    func test_Dark_Mode_AUTO_title_should_be_localized() {

        let expected = "Dark Mode AUTO".localizedFromSettings
        let requirement = "Dark Mode AUTO".localizedFromRequirements

        let tell_not_equal = "\"Dark Mode AUTO\" title is not correct with the expected value."

        XCTAssertEqual(requirement, expected, tell_not_equal)
    }

    func test_Dark_Mode_ON_title_should_be_localized() {

        let expected = "Dark Mode ON".localizedFromSettings
        let requirement = "Dark Mode ON".localizedFromRequirements

        let tell_not_equal = "\"Dark Mode ON\" title is not correct with the expected value."

        XCTAssertEqual(requirement, expected, tell_not_equal)
    }

    func test_Dark_Mode_OFF_title_should_be_localized() {

        let expected = "Dark Mode OFF".localizedFromSettings
        let requirement = "Dark Mode OFF".localizedFromRequirements

        let tell_not_equal = "\"Dark Mode OFF\" title is not correct with the expected value."

        XCTAssertEqual(requirement, expected, tell_not_equal)
    }

    // MARK: - Version and Build Titles in Settings bundle

    func test_release_app_number_group_title_should_be_localized() {

        let expected = "release".localizedFromSettings
        let requirement = "release".localizedFromRequirements

        let tell_not_equal = "\"release\" group title is not correct with the expected value."

        XCTAssertEqual(requirement, expected, tell_not_equal)
    }

    func test_version_title_should_be_localized() {

        let expected = "version".localizedFromSettings
        let requirement = "version".localizedFromRequirements

        let tell_not_equal = "\"version\" title is not correct with the expected value."

        XCTAssertEqual(requirement, expected, tell_not_equal)
    }

    func test_build_title_should_be_localized() {

        let expected = "build".localizedFromSettings
        let requirement = "build".localizedFromRequirements

        let tell_not_equal = "\"build\" title hasn't is not correct with the expected value."

        XCTAssertEqual(requirement, expected, tell_not_equal)
    }

    // MARK: - UI tests

    func test_greetings_should_meet_requirement() {

        let expected = "greetings".localizedFromRequirements
        let actual = "greetings".localizedValue

        let tell_not_equal = "Greetings doesn't meet requirement!"

        XCTAssertEqual(expected, actual, tell_not_equal)
    }

    func test_MainViewController_greetings() {

        let sut = MainViewController.storyboardInstance()

        sut.loadViewIfNeeded()

        let expected = "greetings".localizedValue
        let actual = sut.greetingsLabel.text

        let tell_not_equal = "Something went wrong with localized greetings!"

        XCTAssertEqual(expected, actual, tell_not_equal)
    }
}
