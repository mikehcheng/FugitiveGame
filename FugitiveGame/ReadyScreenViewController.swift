//
//  ReadyScreenViewController.swift
//  FugitiveGame
//
//  Created by Michael Cheng on 10/10/15.
//  Copyright (c) 2015 Michael Cheng. All rights reserved.
//

import UIKit

class ReadyScreenViewController: UIViewController {
    var roomName : String
    var teamSelected : Int = -1
    
    init(roomName: String) {
        self.roomName = roomName
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder aDecoder: NSCoder) {
        self.roomName = ""
        super.init(coder: aDecoder)
    }
    
    override func viewDidLoad() {
        let userName = NSUserDefaults.standardUserDefaults().objectForKey(kUserKey)
        
        SocketSingleton.sharedInstance.singleSocket?.emit("join_room", self.roomName, userName!)
        self.setupListeners()
        
        let copsButton = UIButton(frame: CGRectMake(64, 100, 100, 50))
        copsButton.setTitle("Cops", forState: UIControlState.Normal)
        copsButton.addTarget(self, action: "selectTeam:", forControlEvents: UIControlEvents.TouchUpInside)
        copsButton.tag = 1
        copsButton.backgroundColor = UIColor.grayColor()
        
        let robbersButton = UIButton(frame: CGRectMake(244, 100, 100, 50))
        robbersButton.setTitle("Robbers", forState: UIControlState.Normal)
        robbersButton.addTarget(self, action: "selectTeam:", forControlEvents: UIControlEvents.TouchUpInside)
        robbersButton.tag = 0
        robbersButton.backgroundColor = UIColor.grayColor()
        
        let createGameButton = UIButton(frame: CGRectMake(142, 300, 100, 50))
        createGameButton.setTitle("Ready", forState: UIControlState.Normal)
        createGameButton.addTarget(self, action: "createGame", forControlEvents: UIControlEvents.TouchUpInside)
        createGameButton.backgroundColor = UIColor.grayColor()
        self.view.addSubview(createGameButton)
    }
    
    func otherTeam(team: Int) -> Int {
        return 1 - team
    }
    
    func selectTeam(sender: UIButton) {
        teamSelected = sender.tag
        sender.backgroundColor = UIColor.redColor()
        self.view.viewWithTag(otherTeam(sender.tag))?.backgroundColor = UIColor.grayColor()
        
        
    }
    
    func readyUp(sender: UIButton) {
        
    }
    
    func setupListeners() {
//        "player update"
//        Args - String:player_name, Int:team, Bool:ready_status
        
//        "start select locations"
//        Args - String:selector_player
    }
    
}
