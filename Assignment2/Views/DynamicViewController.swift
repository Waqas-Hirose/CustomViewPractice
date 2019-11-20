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

//    var btnSettings: UIButton!
//    var btnLogin: UIButton!
//    var btnLogout: UIButton!
//    var lbl: UILabel!
    var customView : CustomView?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        //setupView()
        //customView = CustomView()
//        customView!.contentMode = .redraw
       // customView?.addSubviews(view: self.view)
    }
    
    override func viewWillLayoutSubviews() {
        for view in self.view.subviews {
            view.removeFromSuperview()
        }
        customView = CustomView()
        customView?.addSubviews(view: self.view)
    }
//    override func viewWillTransition(to size: CGSize, with coordinator: UIViewControllerTransitionCoordinator) {
//        super.viewWillTransition(to: size, with: coordinator)
//        self.view.frame =
//        customView?.layoutIfNeeded()
////        customView?.frame  = CGRect(x: 0 , y: 0, width: size.width, height: size.height)
////        customView?.layoutSubviews()
////        customView?.setNeedsLayout()
////        customView?.center = self.view.center
////        for view in self.view.subviews {
////            view.removeFromSuperview()
////            }
//       // customView = CustomView()
//        //self.view.frame = CGRect(x: 0,y: 0, width: size.width, height: size.height)
////        self.view.setNeedsLayout()
////        self.view.layoutIfNeeded()
////        self.view.layoutSubviews()
//        //customView?.addSubviews(view: self.view)
//    }
//
   
//    func setupView(){
//
//         let customeView = CustomView()
//         customeView.setFramRect(xPoint: 0, yPoint: 0, viewWidth: self.view.frame.width, viewHeight: 120)
//
//         var sv = UIStackView()
//        sv.axis = .horizontal
//        sv.frame = customeView.frame
//        customeView.addSubview(sv)
//
//        sv.alignment = .fill
//        sv.spacing = 10
//
//        sv.distribution = .equalCentering
//
//
//         // Adding Label
//         var lbl = UILabel()
//         lbl.text = "Hello This is first label"
//         lbl.textColor = .black
//
//        lbl.setContentHuggingPriority(UILayoutPriority(rawValue: 249), for:   NSLayoutConstraint.Axis.horizontal)
//         sv.addArrangedSubview(lbl)
//
//
//    // Adding Logout Button
//           btnLogin = UIButton()
//           btnLogin.backgroundColor = .gray
//           btnLogin.setTitle("Log in", for: .normal)
//           sv.addArrangedSubview(btnLogin)
//
//
//   // Adding Logout Button
//           btnLogout = UIButton()
//           btnLogout.backgroundColor = .gray
//           btnLogout.setTitle("Log out", for: .normal)
//           sv.addArrangedSubview(btnLogout)
//
//  // Adding Various Settings Button
//           btnSettings = UIButton()
//           btnSettings.backgroundColor = .gray
//           btnSettings.setTitle("Various Settings", for: .normal)
//           sv.addArrangedSubview(btnSettings)
//
//
//          customeView.center.y = self.view.center.y
//          self.view.addSubview(customeView)
//
//
//          btnLogin.addTarget(self, action: #selector(btnLoginTapped), for: .touchUpInside)
//          btnLogout.addTarget(self, action: #selector(btnLogoutTapped), for: .touchUpInside)
//          btnSettings.addTarget(self, action: #selector(btnSettingsTapped), for: .touchUpInside)
//
//
//    }
//
//    @objc func btnLoginTapped(sender: UIButton!) {
//           btnLogin.isHidden = true
//           btnLogout.isHidden = false
//
//       }
//     @objc func btnLogoutTapped(sender: UIButton!) {
//           btnLogout.isHidden = true
//           btnLogin.isHidden = false
//       }
//
//     @objc func btnSettingsTapped(sender: UIButton!) {
//           btnLogout.isHidden = false
//           btnLogin.isHidden = false
//       }
}

