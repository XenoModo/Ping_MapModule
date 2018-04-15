//
//  TransparentNavBar.swift
//  Ping_MapModule
//
//  Created by Developer on 15/04/2018.
//  Copyright © 2018 XenoSoft. All rights reserved.
//

import UIKit

class TransparentNavBar: UINavigationController {

    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationBar.setBackgroundImage(UIImage(), for: .default)
        self.navigationBar.shadowImage = UIImage()
                 }

    

}
