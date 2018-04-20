//
//  BirthdayVC.swift
//  Ping_MapModule
//
//  Created by Developer on 20/04/2018.
//  Copyright © 2018 XenoSoft. All rights reserved.
//

import UIKit

class BirthdayVC: UIViewController {

    @IBOutlet weak var datePicker: UIDatePicker!
    @IBOutlet weak var birthdayTextField: UITextField!
    override func viewDidLoad() {
        super.viewDidLoad()

     
        
        datePicker.datePickerMode = UIDatePickerMode.date
        datePicker.setValue(UIColor.white, forKey: "textColor")
        datePicker.addTarget(self, action: #selector(BirthdayVC.datePickerValueChanged(sender:)), for: UIControlEvents.valueChanged)
        birthdayTextField.inputView = datePicker
        
        birthdayTextField.setPadding()
        birthdayTextField.setBottomBorder()
        
    }
    
    @objc func datePickerValueChanged(sender: UIDatePicker){
        let formatter = DateFormatter()
        formatter.dateStyle = DateFormatter.Style.medium
        formatter.timeStyle = DateFormatter.Style.none
        birthdayTextField.text = formatter.string(from: sender.date)
    }
    
    
    
    
    
    
    
    
    

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

  

}
