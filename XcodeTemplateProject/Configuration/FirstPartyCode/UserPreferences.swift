//
//  UserPreferences.swift
//  XcodeTemplateProject
//
//  Created by Mikhail Zhigulin in 7531.
//
//  Copyright © 7531 Mikhail Zhigulin of Novosibirsk.
//
//  Licensed under the special license. See LICENSE file.
//  All rights reserved.
//

import Foundation

extension Settings {
    public static let VersionPreferenceKey = "version_preference"
    public static let BuildPreferenceKey = "build_preference"
}

public struct Settings {

    static let bundleParams: [String: String] =
    [
        "Name": "Settings",
        "Extension": "bundle",
        "RootPlist": "Root.plist",
        "PreferencesItems": "PreferenceSpecifiers",
        "PreferenceKey": "Key",
        "PreferenceValues": "Values",
        "PreferenceDefaultValue": "DefaultValue"
    ]

    static let ud = UserDefaults.standard
    static let nc = NotificationCenter.default
}

public class UserPreferences {

    static func registerSettingsBundle(with attributes: [String: String]) {

        let bundle_name                    = attributes["Name"]
        let bundle_extension               = attributes["Extension"]
        let bundle_RootPlist               = attributes["RootPlist"]!
        let bundle_PreferencesItems        = attributes["PreferencesItems"]!
        let bundle_PreferenceKey           = attributes["PreferenceKey"]!
        let bundle_PreferenceDefaultValue  = attributes["PreferenceDefaultValue"]!

        guard let settingsBundleURL = Bundle.main.url(forResource: bundle_name,
                                                      withExtension: bundle_extension)
        else { return }

        guard let settingsData = try? Data(contentsOf:
            settingsBundleURL.appendingPathComponent(bundle_RootPlist))
        else { return }

        guard let settingsPlist = try? PropertyListSerialization.propertyList(
            from: settingsData, options: [], format: nil) as? [String: Any],
            let settingsPreferences =
                settingsPlist?[bundle_PreferencesItems] as? [[String: Any]]
        else { return }

        var defaultsToRegister = [String: Any]()

        settingsPreferences.forEach { preference in
            if let key = preference[bundle_PreferenceKey] as? String {
                defaultsToRegister[key] = preference[bundle_PreferenceDefaultValue]
            }
        }

        Settings.ud.register(defaults: defaultsToRegister)
    }

    static func setVersionNumber() {
        if let version = Bundle.main.object(forInfoDictionaryKey:
            "CFBundleShortVersionString") as? String {
            Settings.ud.setValue(version, forKey: Settings.VersionPreferenceKey)
        }
    }

    static func setBuildNumber() {
        if let build = Bundle.main.object(forInfoDictionaryKey:
            "CFBundleVersion") as? String {
            Settings.ud.setValue(build, forKey: Settings.BuildPreferenceKey)
        }
    }
}
