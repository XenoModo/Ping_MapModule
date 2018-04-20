//
//  LoginVC.swift
//  Ping_MapModule
//
//  Created by Developer on 20/04/2018.
//  Copyright © 2018 XenoSoft. All rights reserved.
//

import UIKit

class LoginVC: UIViewController {

    @IBOutlet weak var usremailTextField: UITextField!
    @IBOutlet weak var psswrdTextField: UITextField!
    override func viewDidLoad() {
        
        super.viewDidLoad()
        usremailTextField.setBottomBorder()
        psswrdTextField.setBottomBorder()
        psswrdTextField.setPadding()
        usremailTextField.setPadding()
        
        

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
