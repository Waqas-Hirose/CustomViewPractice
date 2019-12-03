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
    var switchView: UISwitch!
    var lbl: UILabel!
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
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
        let lblNewSize = lbl.sizeThatFits(CGSize(width: frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        var subviewYPosition =   (self.frame.height - lblNewSize.height)/2
        self.lbl.frame = CGRect(x: 5 , y: subviewYPosition, width: lblNewSize.width, height: lblNewSize.height)
        
        
        let switchNewSize = switchView.sizeThatFits(CGSize(width: frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        subviewYPosition =   (self.frame.height - switchNewSize.height)/2
        self.switchView.frame = CGRect(x: lbl.bounds.width + 5 , y: subviewYPosition, width: switchNewSize.width, height: switchNewSize.height)
        
    }
    
    func addSubviews() {
        // Adding Label
        lbl = UILabel()
        lbl.text = "Auto Login"
        lbl.font = lbl.font?.withSize(16)
        lbl.textColor = .black
        lbl.sizeToFit()
        self.addSubview(lbl)
        
        // Adding Switch
        switchView = UISwitch()
        frame = switchView!.frame
        self.addSubview(switchView)
    }
}

