//
//  ContactAddVC.swift
//  Ping_MapModule
//
//  Created by Developer on 18/04/2018.
//  Copyright © 2018 XenoSoft. All rights reserved.
//

import UIKit

class ContactAddVC: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    override func viewDidLoad() {
        super.viewDidLoad()
        //searchBar.layer.borderWidth = 0
        searchBar.setSearchFieldBackgroundImage(UIImage(), for: .normal)
        let sbar = searchBar!.value(forKey: "searchField") as? UILabel
        sbar?.textColor = UIColor.white
        
        
       
        

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
