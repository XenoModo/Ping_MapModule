//
//  GetProfilePicVC.swift
//  Ping_MapModule
//
//  Created by Developer on 17/04/2018.
//  Copyright © 2018 XenoSoft. All rights reserved.
//

import UIKit

extension UIImageView {
    
    func circleImage(){
        self.layer.cornerRadius = self.frame.size.width / 2
        self.clipsToBounds = true
    }
}

class GetProfilePicVC: UIViewController {

    @IBOutlet weak var profileCircle: UIImageView!
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
      profileCircle.circleImage()
        

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
