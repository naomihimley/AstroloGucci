//
//  main.swift
//  AstroloGucci
//
//  Created by Naomi Himley on 2/4/16.
//  Copyright © 2016 Naomi Himley. All rights reserved.
//

import Foundation
import UIKit

//Figure out what app delegate to spin up.
let isRunningNonUITests = NSProcessInfo.processInfo().environment["NON_UI_TESTS"]

if isRunningNonUITests != nil {
    UIApplicationMain(Process.argc, Process.unsafeArgv, nil, NSStringFromClass(TestingAppDelegate))
} else {
    UIApplicationMain(Process.argc, Process.unsafeArgv, nil, NSStringFromClass(AppDelegate))
}
