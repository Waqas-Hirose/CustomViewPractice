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
    
    var btnSettings: UIButton!
    var btnLogin: UIButton!
    var btnLogout: UIButton!
    var lbl: UILabel!
    
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        initCommon()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
//    override func draw(_ rect: CGRect) {
//        let rect1 = CGRect(x: rect.minX, y: rect.minY, width: rect.width, height: 30)
//        super.draw(rect1)
//    }
    func initCommon() {
         contentMode = .redraw
        autoresizesSubviews = true
        autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleWidth.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue)
        setNeedsLayout()
        
    }
    
    public func setFramRect(xPoint: CGFloat, yPoint: CGFloat, viewWidth: CGFloat, viewHeight: CGFloat) {
        frame = CGRect(x: xPoint , y: yPoint, width: viewWidth, height: viewHeight)
    }
    
    func addSubviews(view: UIView){
        
        let window = UIApplication.shared.keyWindow
        
        // Creating Custome View Object
        let customeView = CustomView()
        customeView.setFramRect(xPoint: 0, yPoint: 0, viewWidth: view.frame.width-( (window?.safeAreaInsets.left)! +  (window?.safeAreaInsets.right)! + 20 ), viewHeight: 30)
         customeView.translatesAutoresizingMaskIntoConstraints = false
        
        
        //Adding Stackview
        let sv = UIStackView()
        sv.axis = .horizontal
        sv.frame = customeView.frame
        customeView.addSubview(sv)
        sv.alignment = .fill
        sv.spacing = 10
        sv.distribution = .equalCentering
        
        // Adding Label
        lbl = UILabel()
        lbl.text = "Last login 11/12/2019 3:00"
        lbl.font = lbl.font?.withSize(16)
        lbl.textColor = .black
        
        lbl.setContentHuggingPriority(UILayoutPriority(rawValue: 249), for:   NSLayoutConstraint.Axis.horizontal)
        sv.addArrangedSubview(lbl)
        
        
        // Adding Login Button
        btnLogin = createButton(title: "Log in")
        sv.addArrangedSubview(btnLogin)
        
        // Adding Logout Button
        btnLogout = createButton(title: "Log out")
        sv.addArrangedSubview(btnLogout)
        
        // Adding Settings Button
        btnSettings = createButton(title: "Various Settings")
        sv.addArrangedSubview(btnSettings)
        
        // Adding CustomeView in Parent View
        customeView.center = view.center
        view.addSubview(customeView)
        
        
//        let margins = view.safeAreaLayoutGuide
//        customeView.leadingAnchor.constraint(equalTo: margins.leadingAnchor, constant: 10).isActive = true
//        customeView.trailingAnchor.constraint(equalTo: margins.trailingAnchor, constant: 10).isActive = true
//
//         customeView.centerXAnchor.constraint(equalTo: view.centerXAnchor).isActive = true
//         customeView.centerYAnchor.constraint(equalTo: view.centerYAnchor).isActive = true
        
        // Applying Actions on Buttons
        btnLogin.addTarget(self, action: #selector(btnLoginTapped), for: .touchUpInside)
        btnLogout.addTarget(self, action: #selector(btnLogoutTapped), for: .touchUpInside)
        btnSettings.addTarget(self, action: #selector(btnSettingsTapped), for: .touchUpInside)
        
//        customeView.setFramRect(xPoint: customeView.frame.minX, yPoint: customeView.frame.minY, viewWidth: view.frame.width-( (window?.safeAreaInsets.left)! +  (window?.safeAreaInsets.right)!), viewHeight: 30)
    }
    
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
    
    /*
    This function will be called when Settings Button will be tapped
    */
    @objc func btnSettingsTapped(sender: UIButton!) {
        btnLogout.isHidden = false
        btnLogin.isHidden = false
    }
}
