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
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    override func viewWillLayoutSubviews() {
        for view in self.view.subviews {
            view.removeFromSuperview()
        }
        customView = CustomView()
        customView?.addSubviews(view: self.view, viewHieght:30)
        customView?.center = self.view.center
        self.view.addSubview(customView!)
    }
}

