//
//  CreateGameViewController.swift
//  FugitiveGame
//
//  Created by Michael Cheng on 10/10/15.
//  Copyright (c) 2015 Michael Cheng. All rights reserved.
//

import Foundation
import UIKit

class CreateGameViewController : UIViewController, UITextFieldDelegate, NSURLConnectionDataDelegate {
    
    var roomName: String?
    var minutes: Int?
    
    var data = NSMutableData()
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.whiteColor()
        
        let nameField = UITextField(frame: CGRectMake(92, 100, 200, 30))
        nameField.delegate = self
        nameField.placeholder = "Room Name";
        nameField.textAlignment = .Center
        nameField.layer.borderColor = UIColor.blackColor().CGColor
        nameField.layer.borderWidth = 1.0
        self.view.addSubview(nameField)
        
        let gestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        self.view.addGestureRecognizer(gestureRecognizer)
        
        let timer = UIDatePicker(frame: CGRectMake(0, 180, 384, 200))
        timer.datePickerMode = UIDatePickerMode.CountDownTimer
        timer.addTarget(self, action: "timerDidChangeTime:", forControlEvents: UIControlEvents.ValueChanged)
        self.view.addSubview(timer)
        
        let createGameButton = UIButton(frame: CGRectMake(142, 500, 100, 50))
        createGameButton.setTitle("Create", forState: UIControlState.Normal)
        createGameButton.addTarget(self, action: "sendGameParams", forControlEvents: UIControlEvents.TouchUpInside)
        createGameButton.backgroundColor = UIColor.grayColor()
        self.view.addSubview(createGameButton)
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        resignFirstResponder()
        roomName = textField.text
    }
    
    func timerDidChangeTime(sender : AnyObject) {
        let aTimer = sender as! UIDatePicker
        let dateFormatter = NSDateFormatter()
        dateFormatter.dateFormat = "HH:mm"
        let dateString = dateFormatter.stringFromDate(aTimer.date)
        let dateStringArray = dateString.componentsSeparatedByString(":")
        minutes = Int(dateStringArray[0])! * 60 + Int(dateStringArray[1])!
    }
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
    
    /* Create game through rest */
    
    func sendGameParams() {
        let url = NSURL(string: "/create_game", relativeToURL: NSURL(string: host))
        let urlRequest = NSMutableURLRequest(URL: url!)
        urlRequest.HTTPMethod = "POST"
        var paramsDict = Dictionary<String,String>()
        paramsDict["name"] = roomName!
        paramsDict["time"] = String(minutes!)
        urlRequest.HTTPBody =  NSKeyedArchiver.archivedDataWithRootObject(paramsDict)
        let connection = NSURLConnection(request: urlRequest, delegate: self, startImmediately: false)
        connection?.start()
    }
    
    func connection(connection: NSURLConnection, didReceiveData data: NSData) {
        self.data.appendData(data)
    }
    
    func connectionDidFinishLoading(connection: NSURLConnection) {
        let response = NSString(data: self.data, encoding: NSUTF8StringEncoding)
        if response == "1" {
            self.presentViewController(ReadyScreenViewController(roomName: roomName!), animated: true, completion: nil)
        }
    }
}
