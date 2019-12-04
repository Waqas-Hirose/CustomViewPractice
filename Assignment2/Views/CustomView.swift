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
    
    private var btnLogin: UIButton!
    private var btnLogout: UIButton!
    private var btnSettings: UIButton!
    private var lbl: UILabel!
    private var labelSwitch: LabelSwitchView!
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let btnSettingsSize = btnSettings.sizeThatFits(CGSize(width: frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        var subviewYPosition = (self.frame.height - btnSettingsSize.height)/2
        self.btnSettings.frame = CGRect(x: self.bounds.width-10 - btnSettingsSize.width , y: subviewYPosition, width: btnSettingsSize.width, height: btnSettingsSize.height)
        
        
        let btnLogoutSize = btnLogout.sizeThatFits(CGSize(width: frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        subviewYPosition = (self.frame.height - btnLogoutSize.height)/2
        self.btnLogout.frame = CGRect(x: btnSettings.frame.minX-10-btnLogoutSize.width , y: subviewYPosition, width: btnLogoutSize.width, height: btnLogoutSize.height)
        
        let btnLogintSize = btnLogin.sizeThatFits(CGSize(width: frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        subviewYPosition = (self.frame.height - btnLogintSize.height)/2
        self.btnLogin.frame = CGRect(x: btnSettings.frame.minX-10-btnLogintSize.width , y: subviewYPosition, width: btnLogintSize.width, height: btnLogintSize.height)
        
        let switchSize = labelSwitch.sizeThatFits(CGSize(width: frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        subviewYPosition = (self.frame.height - switchSize.height)/2
        if(btnLogin.isHidden){
            self.labelSwitch.frame = CGRect(x: btnLogout.frame.minX-10-switchSize.width , y: subviewYPosition, width: switchSize.width+5 , height: switchSize.height)
        } else {
            
            self.labelSwitch.frame = CGRect(x: btnLogin.frame.minX-10-switchSize.width , y: subviewYPosition, width: switchSize.width+5 , height: switchSize.height)
        }
        
        subviewYPosition = (self.frame.height - lbl.frame.height)/2
        let lblSize = lbl.sizeThatFits(CGSize(width: frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        self.lbl.frame = CGRect(x: 0 , y: subviewYPosition, width: labelSwitch.frame.minX-10 , height: lblSize.height)
        
    }
    
    
    private func addSubviews() {
        // Adding Various Settings Button
        btnSettings = createButton(title: "Various Settings")
        self.addSubview(btnSettings)
        
        // Adding Logout Button
        btnLogout = createButton(title: "Log out")
        self.addSubview(btnLogout)
        
        // Adding Login Button
        btnLogin = createButton(title: "Log in")
        frame = btnLogin.frame
        self.addSubview(btnLogin)
        
        //Applying Actions on Buttons
        btnLogin.addTarget(self, action: #selector(btnLoginTapped), for: .touchUpInside)
        btnLogout.addTarget(self, action: #selector(btnLogoutTapped), for: .touchUpInside)
        
        // Adding LabelSwitch Custom View
        let frame = CGRect(x: 0 , y: 0, width: 100 , height: 30)
        labelSwitch = LabelSwitchView(frame: frame)
        labelSwitch.sizeToFit()
        self.addSubview(labelSwitch)
        
        // Adding Last Login Time Label
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
    private func createButton(title: String) -> UIButton {
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
    @objc private func btnLoginTapped(sender: UIButton!) {
        btnLogin.isHidden = true
        btnLogout.isHidden = false
        self.setNeedsLayout()
    }
    
    /*
     This function will be called when Logout Button will be tapped
     */
    @objc private func btnLogoutTapped(sender: UIButton!) {
        btnLogout.isHidden = true
        btnLogin.isHidden = false
        self.setNeedsLayout()
    }
    
}
