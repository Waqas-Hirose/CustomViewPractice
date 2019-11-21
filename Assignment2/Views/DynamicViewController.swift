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
    let customViewHeight: CGFloat = 120
    let buttonHeight: CGFloat = 30
    var isFirstLaunch: Bool?
    
    var rightSafeArea: CGFloat {
        if #available(iOS 11.0, *) {
            return view.safeAreaInsets.right
        }
        return 0
    }
    var leftSafeArea: CGFloat {
        if #available(iOS 11.0, *) {
            return view.safeAreaInsets.left
        }
        return 0
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        isFirstLaunch = true
        //setupViews()
        
    }
    
    override func viewWillLayoutSubviews() {
        if(isFirstLaunch!){
            setupViews()
        }
        
        customView?.layoutIfNeeded()
        isFirstLaunch = false
    }
    
    func setupViews()  {
        customView = CustomView(view: self.view, customViewHeight: customViewHeight, buttonHeight: buttonHeight)
        customView?.setFramRect(xPoint: 0, yPoint: 0, viewWidth: view.frame.width-(leftSafeArea +  rightSafeArea + 20), viewHeight: customViewHeight)
        customView?.addSubviews(view: self.view, viewHieght:30)
        self.view.addSubview(customView!)
        customView?.center = self.view.center
        
        if(isFirstLaunch!){
            customView?.btnLogout.isHidden = true
        }
    }
}

