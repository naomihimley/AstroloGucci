//
//  TestingAppDelegate.swift
//  AstroloGucci
//
//  Created by Naomi Himley on 2/4/16.
//  Copyright © 2016 Naomi Himley. All rights reserved.
//

import UIKit

/**
An application delegate which should be used for non-UI tests
to prevent the application from spinning up state before the
tests can attach.

More details on this approach: http://qualitycoding.org/app-delegate-for-tests/
And the swift aspect: http://qualitycoding.org/app-delegate-for-tests/#comment-61735
*/

class TestingAppDelegate: UIResponder, UIApplicationDelegate {

    var window: UIWindow?
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        let testViewController = UIViewController()
        testViewController.view.backgroundColor = UIColor.redColor()
            .colorWithAlphaComponent(0.5)
        
        //Add a label to it so it's obvious what you're doing.
        let testLabel = UILabel()
        testLabel.translatesAutoresizingMaskIntoConstraints = false
        
        //Note: This string doesn't need to be localized since users never see it.
        testLabel.text = "TESTING AstroloGucci WITHOUT UI!"
        testLabel.textColor = .whiteColor()
        testViewController.view.addSubview(testLabel)
        
        //Pin it to the middle of the view.
        testViewController.view.addConstraint(
            NSLayoutConstraint(item: testLabel,
                attribute: .CenterX,
                relatedBy: .Equal,
                toItem: testViewController.view,
                attribute: .CenterX,
                multiplier: 1,
                constant: 0))
        
        testViewController.view.addConstraint(
            NSLayoutConstraint(item: testLabel,
                attribute: .CenterY,
                relatedBy: .Equal,
                toItem: testViewController.view,
                attribute: .CenterY,
                multiplier: 1,
                constant: 0))
        
        //Fire up the window.
        self.window = UIWindow()
        self.window?.rootViewController = testViewController
        self.window?.makeKeyAndVisible()
        
        return true
    }
}
