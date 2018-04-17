//
//  SignUpVC.swift
//  Ping_MapModule
//
//  Created by Developer on 15/04/2018.
//  Copyright © 2018 XenoSoft. All rights reserved.
//

import UIKit
extension UITextField{
    func setPadding(){
        let paddingView = UIView(frame: CGRect (x: 0, y: 0, width: 5, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
        
    }
    func setBottomBorder(){
        self.layer.shadowColor = UIColor.white.cgColor
        self.layer.shadowOffset = CGSize(width: 0.0, height: 1.0)
        self.layer.shadowOpacity = 6.0
        self.layer.shadowRadius = 0.0
    }
    
    
}

class SignUpVC: UIViewController {
    
    @IBOutlet weak var lstnametextfield: UITextField!
    @IBOutlet weak var frstnametextfield: UITextField!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        lstnametextfield.setPadding()
        lstnametextfield.setBottomBorder()
        frstnametextfield.setPadding()
        frstnametextfield.setBottomBorder()
        
        
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
