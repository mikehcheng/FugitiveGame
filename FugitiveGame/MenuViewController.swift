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
        
        let button = UIButton(frame: CGRectMake(100, 100, 100, 50))
        button.setTitle("Create", forState: UIControlState.Normal)
        button.addTarget(self, action: "createGame", forControlEvents: UIControlEvents.TouchUpInside)
        button.backgroundColor = UIColor.grayColor()
        
        self.view.addSubview(button)
    }
    
    func createGame() {
        let nextController = CreateGameViewController()
        
        self.presentViewController(nextController, animated: true, completion: nil);
    }
}
