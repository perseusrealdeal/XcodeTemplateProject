//
//  ViewController.swift
//  XcodeTemplateProject
//
//  Created by Mikhail Zhigulin in 7531.
//
//  Copyright © 7531 Mikhail Zhigulin of Novosibirsk.
//
//  Licensed under the special license. See LICENSE file.
//  All rights reserved.
//

import Cocoa

class ViewController: NSViewController {

    deinit {
        #if DEBUG
        print("\(type(of: self)).deinit")
        #endif
    }

    @IBOutlet private(set) weak var greetingsLabel: NSTextField!

    @IBOutlet weak var lightRadioButton: NSButton!
    @IBOutlet weak var darkRadioButton: NSButton!
    @IBOutlet weak var autoRadioButton: NSButton!

    @IBAction func redioDarkModeGroupChanged(_ sender: NSButton) {
        if lightRadioButton.state == .on {
            changeDarkModeManually(.off)
        } else if darkRadioButton.state == .on {
            changeDarkModeManually(.on)
        } else if autoRadioButton.state == .on {
            changeDarkModeManually(.auto)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        view.wantsLayer = true

        AppearanceService.register(stakeholder: self, selector: #selector(makeUp))
        updateDarkModeUserChoiceRadioGroup()
        localizeContent()
    }

    @objc private func makeUp() {
        #if DEBUG
        print(">> [\(type(of: self))]." + #function + " DarkMode: \(DarkMode.style)")
        #endif

        switch DarkMode.style {
        case .light:
            lightRadioButton.attributedTitle = NSAttributedString(string: "Light", attributes:
                    [ NSAttributedString.Key.foregroundColor: NSColor.blue ])
            darkRadioButton.attributedTitle = NSAttributedString(string: "Dark", attributes:
                [ NSAttributedString.Key.foregroundColor: NSColor.blue ])
            autoRadioButton.attributedTitle = NSAttributedString(string: "Auto", attributes:
                [ NSAttributedString.Key.foregroundColor: NSColor.blue ])

            greetingsLabel.textColor = .blue
            view.layer?.backgroundColor = NSColor.yellow.cgColor
        case .dark:
            lightRadioButton.attributedTitle = NSAttributedString(string: "Light", attributes:
                [ NSAttributedString.Key.foregroundColor: NSColor.yellow ])
            darkRadioButton.attributedTitle = NSAttributedString(string: "Dark", attributes:
                [ NSAttributedString.Key.foregroundColor: NSColor.yellow ])
            autoRadioButton.attributedTitle = NSAttributedString(string: "Auto", attributes:
                [ NSAttributedString.Key.foregroundColor: NSColor.yellow ])

            greetingsLabel.textColor = .yellow
            view.layer?.backgroundColor = NSColor.blue.cgColor
        }
    }

    private func localizeContent() {
        // NSLocale.currentLocaleDidChangeNotification
        greetingsLabel.cell?.title = "greetings".localizedValue
    }

    private func updateDarkModeUserChoiceRadioGroup() {
        switch AppearanceService.DarkModeUserChoice {
        case .auto:
            autoRadioButton.state = .on
        case .on:
            darkRadioButton.state = .on
        case .off:
            lightRadioButton.state = .on
        }
    }
}
