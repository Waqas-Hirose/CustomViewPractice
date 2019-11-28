//
//  LabelSwitchView.swift
//  Assignment2
//
//  Created by Waqas on 11/21/19.
//  Copyright © 2019 Waqas. All rights reserved.
//

import Foundation
import UIKit

class LabelSwitchView : UIView {
    
    var parentView: UIView?
    var viewHeight: CGFloat?
    var subViewsHeight: CGFloat?
    var switchView: UISwitch!
    var lbl: UILabel!
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        initCommon()
    }
    
   
    
    init (frame: CGRect, customViewHeight: CGFloat, subViewHeight: CGFloat) {
        super.init(frame: frame)
       self.viewHeight = customViewHeight
        self.subViewsHeight = subViewHeight
        initCommon()
        addSubviews(viewHieght: self.subViewsHeight!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initCommon() {
        contentMode = .redraw
        autoresizingMask = UIView.AutoresizingMask(rawValue: UIView.AutoresizingMask.flexibleWidth.rawValue | UIView.AutoresizingMask.flexibleHeight.rawValue)
        
    }
    
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let labelSize = self.lbl.intrinsicContentSize
        let switchSize = self.switchView.intrinsicContentSize

        let width = labelSize.width + switchSize.width + 5;
        let s = CGSize(width: width, height: size.height)

        return s;
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let subviewsYPosition = (viewHeight! - subViewsHeight!)/2
        
        
        let lblNewSize = lbl.sizeThatFits(CGSize(width: frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        self.lbl.frame = CGRect(x: 5 , y: subviewsYPosition, width: lblNewSize.width, height: subViewsHeight!)
        
        
        let switchNewSize = switchView.sizeThatFits(CGSize(width: frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        self.switchView.frame = CGRect(x: lbl.bounds.width + 5 , y: subviewsYPosition, width: switchNewSize.width, height: subViewsHeight!)

    }
    
    
    public func setFramRect(xPoint: CGFloat, yPoint: CGFloat, viewWidth: CGFloat, viewHeight: CGFloat) {
        frame = CGRect(x: xPoint , y: yPoint, width: viewWidth, height: viewHeight)
    }
    
    func addSubviews(viewHieght: CGFloat) {
        
        self.translatesAutoresizingMaskIntoConstraints = false
         
        lbl = UILabel()
        lbl.text = "Auto Login"
        lbl.font = lbl.font?.withSize(16)
        lbl.textColor = .black
        lbl.sizeToFit()
        self.addSubview(lbl)
        
        // Adding Logout Button
        switchView = UISwitch()
        frame = switchView!.frame
        self.addSubview(switchView)
    }
    
    
}

