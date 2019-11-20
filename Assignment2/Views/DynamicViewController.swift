//
//  DynamicViewController.swift
//  Assignment2
//
//  Created by TK-LPT-0142 on 11/18/19.
//  Copyright © 2019 Waqas. All rights reserved.
//

import Foundation
import UIKit

class DynamicViewController : UIViewController {
    
    var customView : CustomView?
    var isFirstLaunch: Bool?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isFirstLaunch = true
    }
    
    override func viewWillLayoutSubviews() {
        setupViews()
        isFirstLaunch = false
    }
    
    func setupViews()  {
        let isLoginButtonHidden = customView?.btnLogin?.isHidden
        let isLogotButtonHidden = customView?.btnLogout?.isHidden
        
        for view in self.view.subviews {
            view.removeFromSuperview()
        }
        customView = CustomView()
        customView?.addSubviews(view: self.view, viewHieght:30)
        customView?.center = self.view.center
        self.view.addSubview(customView!)
        customView?.btnLogin.isHidden = isLoginButtonHidden ?? false
        customView?.btnLogout.isHidden = isLogotButtonHidden ?? false
        
        if(isFirstLaunch!){
            customView?.btnLogout.isHidden = true
        }
    }
}

