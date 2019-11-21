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
        setupViews()
        
    }
    
    override func viewWillLayoutSubviews() {
        super.viewWillLayoutSubviews()
        
        // Reseting CustomView Fram
        customView?.setFramRect(xPoint: 0, yPoint: 0, viewWidth: view.frame.width-(leftSafeArea +  rightSafeArea + 20), viewHeight: customViewHeight)
        
        //        Setting CustonView in the Center of Parent View
        customView?.center = self.view.center
    }
    
    func setupViews()  {
        let viewframe = CGRect(x: 0 , y: 0, width: view.frame.width-(leftSafeArea +  rightSafeArea + 20), height: customViewHeight)
        customView = CustomView(frame: viewframe, customViewHeight: customViewHeight, buttonHeight: buttonHeight)
        customView?.center = self.view.center
        self.view.addSubview(customView!)
        
    }
}

