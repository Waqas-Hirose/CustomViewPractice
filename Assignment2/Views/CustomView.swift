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
    //var parentView: UIView?
    var viewHeight: CGFloat?
    var buttonHeight: CGFloat?
    var lbl: UILabel!
    var labelSwitch: LabelSwitchView!
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        initCommon()
    }
    
    init (frame: CGRect, customViewHeight: CGFloat, buttonHeight: CGFloat) {
        super.init(frame: frame)
        //self.parentView = view
        self.viewHeight = customViewHeight
        self.buttonHeight = buttonHeight
        initCommon()
        addSubviews(viewHieght: self.buttonHeight!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initCommon() {
        contentMode = .redraw
        autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleWidth.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue)
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let buttonsYPosition = (viewHeight! - buttonHeight!)/2
        
        var frame = btnSettings.frame
        self.btnSettings.frame = CGRect(x: self.bounds.width-10-frame.width , y: buttonsYPosition, width: frame.width, height: buttonHeight!)
        
        frame = btnLogout.frame
        self.btnLogout.frame = CGRect(x: btnSettings.frame.minX-10-frame.width , y: buttonsYPosition, width: frame.width, height: buttonHeight!)
        
        frame = btnLogin.frame
        self.btnLogin.frame = CGRect(x: btnSettings.frame.minX-10-frame.width , y: buttonsYPosition, width: frame.width, height: buttonHeight!)
        
        labelSwitch.sizeToFit()
        frame = labelSwitch.frame
        self.labelSwitch.frame = CGRect(x:  btnLogout.frame.minX-10-frame.width, y: buttonsYPosition, width: labelSwitch.bounds.width+5 , height: buttonHeight!)
        
        
        self.lbl.frame = CGRect(x: 0 , y: buttonsYPosition, width: labelSwitch.frame.minX-10 , height: buttonHeight!)

    }
    
    
    public func setFramRect(xPoint: CGFloat, yPoint: CGFloat, viewWidth: CGFloat, viewHeight: CGFloat) {
        frame = CGRect(x: xPoint , y: yPoint, width: viewWidth, height: viewHeight)
    }
    
    func addSubviews(viewHieght: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
        
        // Adding Various Settings Button
        btnSettings = createButton(title: "Various Settings")
        self.addSubview(btnSettings)
        
        // Adding Logout Button
        btnLogout = createButton(title: "Log out")
        self.addSubview(btnLogout)
        
        // Adding Logout Button
        btnLogin = createButton(title: "Log in")
        frame = btnLogin.frame
        self.addSubview(btnLogin)
        
        //Applying Actions on Buttons
        btnLogin.addTarget(self, action: #selector(btnLoginTapped), for: .touchUpInside)
        btnLogout.addTarget(self, action: #selector(btnLogoutTapped), for: .touchUpInside)
        
        let frame = CGRect(x: 0 , y: 0, width: 100 , height: 30)
        labelSwitch = LabelSwitchView(frame: frame, customViewHeight: 30, subViewHeight: 30)
        labelSwitch.sizeToFit()
        self.addSubview(labelSwitch)
        
        
        lbl = UILabel()
        lbl.text = " Last login 11/12/2019 3:00"
        lbl.font = lbl.font?.withSize(16)
        lbl.textColor = .black
        lbl.sizeToFit()
        self.addSubview(lbl)
        
        // Logout button will be hidden initially
        self.btnLogout.isHidden = true
        
    }
    
    /*
     This function retuns button with required properties
     */
    func createButton(title: String) -> UIButton {
        let button = UIButton()
        button.setTitle(title, for: .normal)
        button.backgroundColor = .clear
        button.layer.cornerRadius = 2
        button.layer.borderWidth = 1
        button.layer.borderColor = UIColor.black.cgColor
        button.setTitleColor(.black, for: .normal)
        button.sizeToFit()
        let spacing: CGFloat = 2.0
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
