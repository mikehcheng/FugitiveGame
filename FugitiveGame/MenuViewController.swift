//
//  MenuViewController.swift
//  FugitiveGame
//
//  Created by Michael Cheng on 10/10/15.
//  Copyright (c) 2015 Michael Cheng. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.view.backgroundColor = UIColor.whiteColor()
        
        let createGameButton = UIButton(frame: CGRectMake(100, 100, 100, 50))
        createGameButton.setTitle("Create", forState: UIControlState.Normal)
        createGameButton.addTarget(self, action: "createGame", forControlEvents: UIControlEvents.TouchUpInside)
        createGameButton.backgroundColor = UIColor.grayColor()
        self.view.addSubview(createGameButton)
    }
    
    func createGame() {
        let nextController = CreateGameViewController()
        
        self.presentViewController(nextController, animated: true, completion: nil);
    }
}
