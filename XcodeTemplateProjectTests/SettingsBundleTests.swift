//
//  SettingsBundleTests.swift
//  XcodeTemplateProjectTests
//
//  Created by Mikhail Zhigulin in 7531.
//
//  Copyright © 7531 Mikhail Zhigulin of Novosibirsk.
//  Licensed under the special license. See LICENSE file.
//  All rights reserved.
//
//  Before start unit tests, make sure that previous app's installation is removed.

import XCTest
@testable import XcodeTemplateProject

class SettingsBundleTests: XCTestCase {

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

    func test_build_number_meets_app_build_number() {

        let build_number_expected = Bundle.main.object(forInfoDictionaryKey: "CFBundleVersion") as? String
        let build_number_actual = defaults.string(forKey: Settings.BuildPreferenceKey)

        let message_not_equal = "Build number doesn't meet requirement!"

        XCTAssertEqual(build_number_expected, build_number_actual, message_not_equal)
    }

    func test_build_number_default_value() {

        let build_number_default_expected = "~"
        let build_number_default_actual = Settings.BuildPreferenceKey.defaultValueFromSettings

        let message_not_equal = "Build number default value doesn't meet requirement!"

        XCTAssertEqual(build_number_default_expected, build_number_default_actual, message_not_equal)
    }

    func test_version_value_meets_app_version() {

        let version_expected = Bundle.main.object(forInfoDictionaryKey: "CFBundleShortVersionString") as? String
        let veriosn_actual = defaults.string(forKey: Settings.VersionPreferenceKey)

        let message_not_equal = "Version value doesn't meet requirement!"

        XCTAssertEqual(version_expected, veriosn_actual, message_not_equal)
    }

    func test_version_default_value() {

        let version_default_expected = "~"
        let veriosn_default_actual = Settings.VersionPreferenceKey.defaultValueFromSettings

        let message_not_equal = "Version default value doesn't meet requirement!"

        XCTAssertEqual(version_default_expected, veriosn_default_actual, message_not_equal)
    }
}
