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
    var subViewsHeight: CGFloat?
    var switchView: UISwitch!
    var lbl: UILabel!
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        initCommon()
    }
    
    
    
    init (frame: CGRect, subViewHeight: CGFloat) {
        super.init(frame: frame)
        self.subViewsHeight = subViewHeight
        initCommon()
        addSubviews(viewHieght: self.subViewsHeight!)
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    func initCommon() {
        contentMode = .redraw
    }
    
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let labelSize = self.lbl.sizeThatFits(size)
        let switchSize = self.switchView.sizeThatFits(size)
        
        let width = labelSize.width + switchSize.width + 5;
        let s = CGSize(width: width, height: size.height)
        
        return s;
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let subviewsYPosition = (self.frame.height - subViewsHeight!)/2
        
        
        let lblNewSize = lbl.sizeThatFits(CGSize(width: frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        self.lbl.frame = CGRect(x: 5 , y: subviewsYPosition, width: lblNewSize.width, height: subViewsHeight!)
        
        
        let switchNewSize = switchView.sizeThatFits(CGSize(width: frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        self.switchView.frame = CGRect(x: lbl.bounds.width + 5 , y: subviewsYPosition, width: switchNewSize.width, height: subViewsHeight!)
        
    }
    
    func addSubviews(viewHieght: CGFloat) {
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

