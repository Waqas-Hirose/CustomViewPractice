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
        //setupViews()
        
    }
    
    override func viewWillLayoutSubviews() {
        //        setupViews()
        if(isFirstLaunch!){
            setupViews()
            customView?.layoutIfNeeded()
            customView?.layoutIfNeeded()
        } else {
            customView?.layoutIfNeeded()
        }
        
        isFirstLaunch = false
        
    }
    
    func setupViews()  {
        //        let isLoginButtonHidden = customView?.btnLogin?.isHidden
        //        let isLogotButtonHidden = customView?.btnLogout?.isHidden
        
        for view in self.view.subviews {
            view.removeFromSuperview()
        }
        let window = UIApplication.shared.keyWindow
        customView = CustomView(view: self.view)
        customView?.setFramRect(xPoint: 0, yPoint: 0, viewWidth: view.frame.width-( (window?.safeAreaInsets.left)! +  (window?.safeAreaInsets.right)! + 20 ), viewHeight: 30)
        customView?.addSubviews(view: self.view, viewHieght:30)
        self.view.addSubview(customView!)
        customView?.center = self.view.center
        //        customView?.btnLogin.isHidden = isLoginButtonHidden ?? false
        //        customView?.btnLogout.isHidden = isLogotButtonHidden ?? false
        
//        if(isFirstLaunch!){
//            //            customView?.btnLogout.isHidden = true
//            //customView?.layoutIfNeeded()
//        }
    }
}

