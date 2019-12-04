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
    
    private let customView : CustomView = CustomView(frame: .zero)
    private let customViewHeight: CGFloat = 50
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
        
    }
    
    private func setupViews()  {
        // Adding CustomView in Parent View
        self.view.addSubview(customView)
        
        // Applying Constraints on CustomeView
        customView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint(item: customView, attribute: NSLayoutConstraint.Attribute.centerY, relatedBy: NSLayoutConstraint.Relation.equal, toItem: view, attribute: NSLayoutConstraint.Attribute.centerY, multiplier: 1, constant: 0).isActive = true
        
        customView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: 0).isActive = true
        customView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: 0).isActive = true
        customView.addConstraint(NSLayoutConstraint(
            item:customView, attribute:NSLayoutConstraint.Attribute.height,
            relatedBy:NSLayoutConstraint.Relation.equal,
            toItem:nil, attribute:NSLayoutConstraint.Attribute.notAnAttribute,
            multiplier:0, constant:customViewHeight))
        
    }
}

