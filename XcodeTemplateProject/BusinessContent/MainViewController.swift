//
//  ViewController.swift
//  XcodeTemplateProject
//
//  Created by Mikhail Zhigulin in 7531.
//
//  Copyright © 7531 Mikhail Zhigulin of Novosibirsk.
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

    class func storyboardInstance() -> MainViewController
    {
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

    }
}
