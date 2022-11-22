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

import UIKit

class MainViewController: UIViewController {

    deinit {
        #if DEBUG
        print("\(type(of: self)).deinit")
        #endif
    }

    @IBOutlet private(set) weak var greetingsLabel: UILabel!
    @IBOutlet private weak var actualDarkModeValueLabel: UILabel!

    class func storyboardInstance() -> MainViewController {

        let storyboard = UIStoryboard(name: String(describing: self), bundle: nil)
        let screen = storyboard.instantiateInitialViewController() as? MainViewController

        // Do default setup; don't set any parameter causing loadView up, breaks unit tests
        screen?.modalTransitionStyle = UIModalTransitionStyle.partialCurl
        // screen?.view.backgroundColor = UIColor.yellow
        return screen ?? MainViewController()
    }

    override func viewDidLoad() {
        super.viewDidLoad()

        guard value(forKey: "storyboardIdentifier") != nil else { return }

        AppearanceService.register(stakeholder: self, selector: #selector(makeUp))
        localizeContent()
    }

    override func traitCollectionDidChange(_ previousTraitCollection: UITraitCollection?) {
        super.traitCollectionDidChange(previousTraitCollection)

        if #available(iOS 13.0, *) {
            AppearanceService.processTraitCollectionDidChange(previousTraitCollection)
        }
    }

    @objc private func makeUp() {
        #if DEBUG
        print(">> [\(type(of: self))]." + #function)
        #endif

        actualDarkModeValueLabel.text = "^_^ \(AppearanceService.DarkModeUserChoice)"

        switch DarkMode.style {
        case .light:
            self.view.backgroundColor = .yellow
        case .dark:
            self.view.backgroundColor = .gray
        }
    }

    private func localizeContent() {
        // NSLocale.currentLocaleDidChangeNotification
        greetingsLabel.text = "greetings".localizedValue
    }
}
