//
//  CustomView.swift
//  Assignment2
//
//  Created by Waqas on 11/18/19.
//  Copyright © 2019 Waqas. All rights reserved.
//

import Foundation
import UIKit

class CustomView : UIView {
    
    var btnLogin: UIButton!
    var btnLogout: UIButton!
    var btnSettings: UIButton!
    var parentView: UIView?
    var lbl: UILabel!
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        initCommon()
    }
    
    init (view: UIView) {
        super.init(frame: view.frame)
        parentView = view
        initCommon()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initCommon() {
        contentMode = .redraw
        autoresizesSubviews = true
        autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleWidth.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue)
        //setNeedsLayout()
        
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        let window = UIApplication.shared.keyWindow
        
        self.setFramRect(xPoint: 0, yPoint: 0, viewWidth: parentView!.frame.width-( (window?.safeAreaInsets.left)! +  (window?.safeAreaInsets.right)! + 20 ), viewHeight: 120)
        self.center = parentView!.center
        var frame = btnSettings.frame
        self.btnSettings.frame = CGRect(x: self.frame.maxX-10-frame.width , y: 0, width: frame.width, height: 30)
        
        
        frame = btnLogout.frame
        self.btnLogout.frame = CGRect(x: btnSettings.frame.minX-10-frame.width , y: 0, width: frame.width, height: 30)
        
        //frame = btnLogin.frame
        self.btnLogin.frame = CGRect(x: btnSettings.frame.minX-10-frame.width , y: 0, width: frame.width, height: 30)
        
        self.lbl.frame = CGRect(x: parentView!.frame.minX , y: 0, width: btnLogin.frame.minX-10 , height: 30)
        //        self.btnLogin.frame = CGRect(x: 100 , y: 10, width: 40, height: 30)
//        if(btnLogin.isHidden){
//            self.btnLogin.frame = CGRect(x: btnSettings.frame.minX-10-frame.width , y: 0, width: 0, height: 30)
//        }
//
//        if(btnLogout.isHidden){
//            self.btnLogout.frame = CGRect(x: btnSettings.frame.minX-10-frame.width , y: 0, width: 0, height: 30)
//        }
    }
    public func setFramRect(xPoint: CGFloat, yPoint: CGFloat, viewWidth: CGFloat, viewHeight: CGFloat) {
        frame = CGRect(x: xPoint , y: yPoint, width: viewWidth, height: viewHeight)
    }
    
    func addSubviews(view: UIView, viewHieght: CGFloat) {
        
        let window = UIApplication.shared.keyWindow
        
        //                self.setFramRect(xPoint: 0, yPoint: 0, viewWidth: view.frame.width-( (window?.safeAreaInsets.left)! +  (window?.safeAreaInsets.right)! + 20 ), viewHeight: viewHieght)
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Adding Various Settings Button
        btnSettings = UIButton()
        btnSettings.backgroundColor = .gray
        btnSettings.setTitle("Various Settings", for: .normal)
        btnSettings.sizeToFit()
        var frame = btnSettings.frame
        //                 btnSettings.frame = CGRect(x: view.frame.maxX-10-frame.width , y: 0, width: frame.width, height: 30)
        self.addSubview(btnSettings)
        
        
        
        // Adding Logout Button
        btnLogout = UIButton()
        btnLogout.backgroundColor = .gray
        btnLogout.setTitle("Log out", for: .normal)
        btnLogout.sizeToFit()
        frame = btnLogout.frame
        //                btnLogout.frame = CGRect(x: btnSettings.frame.minX-10-frame.width , y: 0, width: frame.width, height: 30)
        self.addSubview(btnLogout)
        
        
        // Adding Logout Button
        btnLogin = UIButton()
        btnLogin.backgroundColor = .gray
        btnLogin.setTitle("Log in", for: .normal)
        btnLogin.sizeToFit()
        frame = btnLogin.frame
        //                btnLogin.frame = CGRect(x: btnLogout.frame.minX-10-frame.width , y: 0, width: frame.width, height: 30)
        self.addSubview(btnLogin)
        
         //Applying Actions on Buttons
        btnLogin.addTarget(self, action: #selector(btnLoginTapped), for: .touchUpInside)
        btnLogout.addTarget(self, action: #selector(btnLogoutTapped), for: .touchUpInside)
        
        lbl = UILabel()
        lbl.text = "Hello This is first label"
        lbl.textColor = .black
        lbl.sizeToFit()
        //                lbl.frame = CGRect(x: 10 , y: 0, width: btnLogin.frame.minX-20 , height: 30)
        self.addSubview(lbl)
        
        self.setFramRect(xPoint: 0, yPoint: 0, viewWidth: self.frame.width, viewHeight: 120)
        // self.center.y = self.center.y
        //let sv = UIStackView()
        //sv.frame = CGRect(x: 0, y: 0, width: self.view.frame.width, height: 120)
        //sv.backgroundColor = .brown
        //customeView.addSubview(sv)
        //self.view.addSubview(customeView)
        //customeView.addSubview(sv)
        // var btnLogin = UIButton()
        // btnLogin.setTitle("Log in", for:.normal)
        //btnLogin.backgroundColor = .gray
        //        btnLogin.frame = CGRect(x: 60 , y: 0, width: 10, height: 30)
        // btnLogin.setTitle("Log in", for: .normal)
        //btnLogin.sizeToFit()
        // frame = btnLogin.frame
        
        //        btnLogin.frame = CGRect(x: view.frame.maxX-10-frame.width , y: 0, width: frame.width, height: 30)
        //        btnLogin.setContentHuggingPriority(UILayoutPriority(rawValue: 750), for:   NSLayoutConstraint.Axis.horizontal)
        //         lbl.setContentHuggingPriority(UILayoutPriority(rawValue: 748), for:   NSLayoutConstraint.Axis.horizontal)
        // customeView.addSubview(lbl)
        //customeView.addSubview(btnLogin)
        
        
    }
    
//    func hideLoginButton(){
//        btnLogin.isHidden = true
//        btnLogout.isHidden = false;
//        self.btnLogin.frame = CGRect(x: btnSettings.frame.minX-10-frame.width , y: 0, width: 0, height: 30)
//
//        self.btnLogin.frame = CGRect(x: btnSettings.frame.minX-10-frame.width , y: 0, width: frame.width, height: 30)
//
//        self.btnLogout.frame = CGRect(x: btnSettings.frame.minX-10-frame.width , y: 0, width: frame.width, height: 30)
//
//        //frame = btnLogin.frame
//
//
//        if(btnLogin.isHidden){
//            self.btnLogin.frame = CGRect(x: btnSettings.frame.minX-10-frame.width , y: 0, width: 0, height: 30)
//        }
//
//        if(btnLogout.isHidden){
//            self.btnLogout.frame = CGRect(x: btnSettings.frame.minX-10-frame.width , y: 0, width: 0, height: 30)
//        }
//
//    }
    //    func addSubviews(view: UIView, viewHieght: CGFloat) {
    //
    //        let window = UIApplication.shared.keyWindow
    //
    //        self.setFramRect(xPoint: 0, yPoint: 0, viewWidth: view.frame.width-( (window?.safeAreaInsets.left)! +  (window?.safeAreaInsets.right)! + 20 ), viewHeight: viewHieght)
    //        self.translatesAutoresizingMaskIntoConstraints = false
    //
    //
    //        //Adding Stackview
    //        let sv = UIStackView()
    //        sv.axis = .horizontal
    //        sv.frame = self.frame
    //        self.addSubview(sv)
    //        sv.alignment = .lastBaseline
    //        sv.spacing = 10
    //        //sv.distribution = .equalCentering
    //
    //        // Adding Label
    //        let lbl = UILabel()
    //        lbl.text = "Last login 11/12/2019 3:00"
    //        lbl.font = lbl.font?.withSize(16)
    //        lbl.textColor = .black
    //
    //
    //        lbl.setContentHuggingPriority(UILayoutPriority(rawValue: 249), for:   NSLayoutConstraint.Axis.horizontal)
    //        sv.addArrangedSubview(lbl)
    //
    //
    //        // Adding Login Button
    //        btnLogin = createButton(title: "Log in")
    //        sv.addArrangedSubview(btnLogin)
    //
    //        // Adding Logout Button
    //        btnLogout = createButton(title: "Log out")
    //        sv.addArrangedSubview(btnLogout)
    //
    //        // Adding Settings Button
    //        let btnSettings = createButton(title: "Various Settings")
    //        sv.addArrangedSubview(btnSettings)
    //
    //        // Applying Actions on Buttons
    //        btnLogin.addTarget(self, action: #selector(btnLoginTapped), for: .touchUpInside)
    //        btnLogout.addTarget(self, action: #selector(btnLogoutTapped), for: .touchUpInside)
    //
    //    }
    //
    /*
     This functions will retun button with required properties
     */
    func createButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 5
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitleColor(.black, for: .normal)
        let spacing: CGFloat = 5.0
        button.contentEdgeInsets = UIEdgeInsets(top: 0, left: spacing, bottom: 0, right: spacing)
        button.titleLabel?.font = button.titleLabel?.font.withSize(16)
        
        return button
    }
    
    /*
     This function will be called when Login Button will be tapped
     */
    @objc func btnLoginTapped(sender: UIButton!) {
        btnLogin.isHidden = true
        btnLogout.isHidden = false
    }
    
    /*
     This function will be called when Logout Button will be tapped
     */
    @objc func btnLogoutTapped(sender: UIButton!) {
        btnLogout.isHidden = true
        btnLogin.isHidden = false
    }
    
}
