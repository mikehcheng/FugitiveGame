//
//  CreateGameViewController.swift
//  FugitiveGame
//
//  Created by Michael Cheng on 10/10/15.
//  Copyright (c) 2015 Michael Cheng. All rights reserved.
//

import UIKit

class CreateGameViewController : UIViewController, UITextFieldDelegate {
    
    var roomName: String?
    var minutes: Int?
    
    override func viewDidLoad() {
        self.view.backgroundColor = UIColor.whiteColor()
        
        let nameField = UITextField(frame: CGRectMake(60, 100, 200, 30))
        nameField.delegate = self
        nameField.placeholder = "Room Name"
        self.view.addSubview(nameField)
        
        var gestureRecognizer = UITapGestureRecognizer(target: self, action: "dismissKeyboard")
        self.view.addGestureRecognizer(gestureRecognizer)
        
        let timer = UIDatePicker(frame: CGRectMake(0, 180, 320, 100))
        timer.datePickerMode = UIDatePickerMode.CountDownTimer
        timer.addTarget(self, action: "timerDidChangeTime:", forControlEvents: UIControlEvents.ValueChanged)
        minutes = timer.minuteInterval
        self.view.addSubview(timer)
        
        
    }
    
    func textFieldDidEndEditing(textField: UITextField) {
        resignFirstResponder()
        roomName = textField.text
    }
    
    func timerDidChangeTime(sender : AnyObject) {
        let aTimer = sender as! UIDatePicker
        
    }
    
    func dismissKeyboard() {
        self.view.endEditing(true)
    }
}
