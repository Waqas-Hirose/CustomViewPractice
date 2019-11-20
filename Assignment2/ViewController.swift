//
//  ViewController.swift
//  Assignment2
//
//  Created by TK-LPT-0142 on 11/16/19.
//  Copyright © 2019 Waqas. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    
    @IBOutlet weak var btnSettings: UIButton!
    @IBOutlet weak var btnLogout: UIButton!
    @IBOutlet weak var btnLogin: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    
    @IBAction func btnLoginTapped(_ sender: Any) {
        btnLogin.isHidden = true
        btnLogout.isHidden = false
    }
    @IBAction func btnLogoutTapped(_ sender: Any) {
        btnLogout.isHidden = true
        btnLogin.isHidden = false
    }
    
    @IBAction func btnSettingsTapped(_ sender: Any) {
        btnLogout.isHidden = false
        btnLogin.isHidden = false
    }
}

