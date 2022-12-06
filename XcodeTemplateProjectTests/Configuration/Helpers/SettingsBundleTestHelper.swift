//
//  SettingsBundleTestHelper.swift
//  XcodeTemplateProjectTests
//
//  Created by Mikhail Zhigulin in 7531.
//
//  Copyright © 7531 Mikhail Zhigulin of Novosibirsk.
//
//  Licensed under the special license. See LICENSE file.
//  All rights reserved.
//

import Foundation
@testable import XcodeTemplateProject

extension String {

    var defaultValueFromSettings: String? {

        let bundle_PreferenceKey           = Settings.bundleParams["PreferenceKey"]!
        let bundle_PreferenceDefaultValue  = Settings.bundleParams["PreferenceDefaultValue"]!

        guard
            let settingsPreferences = getPreferencesFromSettingsBundle(),
            let preference = settingsPreferences.first(
                where: { preference in
                    guard
                        let value = preference[bundle_PreferenceKey] as? String, value == self
                    else { return false }

                    return true
            })
        else { return nil}

        return preference[bundle_PreferenceDefaultValue] as? String
    }

    var valuesFromSettings: [String]? {

        let bundle_PreferenceKey           = Settings.bundleParams["PreferenceKey"]!
        let bundle_PreferenceValues        = Settings.bundleParams["PreferenceValues"]!

        guard
            let settingsPreferences = getPreferencesFromSettingsBundle(),
            let preference = settingsPreferences.first(
                where: { preference in
                    guard
                        let value = preference[bundle_PreferenceKey] as? String, value == self
                        else { return false }
                    return true
            })
        else { return nil }

        return preference[bundle_PreferenceValues] as? [String]
    }
}

private func getPreferencesFromSettingsBundle() -> [[String: Any]]? {

    let bundle_name                    = Settings.bundleParams["Name"]
    let bundle_extension               = Settings.bundleParams["Extension"]
    let bundle_RootPlist               = Settings.bundleParams["RootPlist"]!
    let bundle_PreferencesItems        = Settings.bundleParams["PreferencesItems"]!

    guard
        let settingsBundleURL =
        Bundle.main.url(forResource: bundle_name, withExtension: bundle_extension),

        let settingsData =
        try? Data(contentsOf: settingsBundleURL.appendingPathComponent(bundle_RootPlist)),

        let settingsPlist = try? PropertyListSerialization.propertyList(
            from: settingsData,
            options: [],
            format: nil) as? [String: Any],
        let settingsPreferences = settingsPlist?[bundle_PreferencesItems] as? [[String: Any]]
    else { return nil}

    return settingsPreferences
}
