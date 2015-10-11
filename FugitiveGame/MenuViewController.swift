//
//  MenuViewController.swift
//  FugitiveGame
//
//  Created by Michael Cheng on 10/10/15.
//  Copyright (c) 2015 Michael Cheng. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController, UIAlertViewDelegate {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        let createGameButton = UIButton(frame: CGRectMake(142, 100, 100, 50))
        createGameButton.setTitle("Create", forState: UIControlState.Normal)
        createGameButton.addTarget(self, action: "createGame", forControlEvents: UIControlEvents.TouchUpInside)
        createGameButton.backgroundColor = UIColor.grayColor()
        self.view.addSubview(createGameButton)
        
        setUsernameIfNeeded()
    }
    
    func createGame() {
        let nextController = CreateGameViewController()
        
        self.presentViewController(nextController, animated: true, completion: nil);
    }
    
    func setUsernameIfNeeded() {
        let userDefaults : NSUserDefaults = NSUserDefaults.standardUserDefaults()
        if (userDefaults.objectForKey(kUserKey) == nil) {
            let namePrompt = UIAlertView(title: "Welcome to FugitiveGame!", message: "Enter your preferred in game username", delegate: self, cancelButtonTitle: "Let's go!")
            namePrompt.alertViewStyle = .PlainTextInput
            namePrompt.show()
        }
    }
    
    func alertView(alertView: UIAlertView, clickedButtonAtIndex buttonIndex: Int) {
        NSUserDefaults.standardUserDefaults().setObject(alertView.textFieldAtIndex(0)!.text!, forKey: kUserKey)
    }
}
