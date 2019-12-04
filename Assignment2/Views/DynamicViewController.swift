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
    
    private var customView : CustomView?
    private let customViewHeight: CGFloat = 50
    
    private var rightSafeArea: CGFloat {
        if #available(iOS 11.0, *) {
            return view.safeAreaInsets.right
        }
        return 0
    }
    private var leftSafeArea: CGFloat {
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
        
        customView?.frame = CGRect(x: 0, y: 0, width: view.frame.width-(leftSafeArea +  rightSafeArea + 20), height: customViewHeight)
        
        // Setting CustonView in the Center of Parent View
        customView?.center = self.view.center
    }
    
    private func setupViews()  {
        customView = CustomView(frame: .zero)
        if let customView = customView {
            self.view.addSubview(customView)
            
            // Applying Constraints on CustomeView
            NSLayoutConstraint(item: customView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0).isActive = true
            
            customView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10).isActive = true
            customView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 10).isActive = true
            customView.addConstraint(NSLayoutConstraint(
                item:customView, attribute:NSLayoutConstraint.Attribute.height,
                relatedBy:NSLayoutConstraint.Relation.equal,
                toItem:nil, attribute:NSLayoutConstraint.Attribute.notAnAttribute,
                multiplier:0, constant:customViewHeight))
            
        }
    }
}

