//
//  PasswordVC.swift
//  Ping_MapModule
//
//  Created by Developer on 18/04/2018.
//  Copyright © 2018 XenoSoft. All rights reserved.
//

import UIKit

class PasswordVC: UIViewController {

    @IBOutlet weak var psswrdtextfield: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        psswrdtextfield.setPadding()
        psswrdtextfield.setBottomBorder()
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
