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
        let nameField = UITextField(frame: CGRectMake(60, 100, 200, 30))
        nameField.delegate = self
        nameField.placeholder = "Room Name"
        
        self.view.addSubview(nameField)
        
        let timer = UIDatePicker(frame: CGRectMake(60, 180, 200, 100))
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
        
    }
}
