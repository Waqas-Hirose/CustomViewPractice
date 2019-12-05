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
    private let switchView: UISwitch = UISwitch()
    private let label: UILabel = UILabel()
    
    override init (frame: CGRect) {
        super.init(frame: frame)
        addSubviews()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override func sizeThatFits(_ size: CGSize) -> CGSize {
        let labelSize = self.label.sizeThatFits(size)
        let switchSize = self.switchView.sizeThatFits(size)
        
        // Adding 5 pixel extra in width to give space between switch and label
        let width = labelSize.width + switchSize.width + CGFloat(5)
        let s = CGSize(width: width, height: frame.height)
        
        return s;
    }
    override func layoutSubviews() {
        super.layoutSubviews()
        let lblNewSize = label.sizeThatFits(CGSize(width: frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        let labelYPosition =   (self.frame.height - lblNewSize.height)/2
        self.label.frame = CGRect(x: 5 , y: labelYPosition, width: lblNewSize.width, height: lblNewSize.height)
        
        
        let switchNewSize = switchView.sizeThatFits(CGSize(width: frame.size.width, height: CGFloat.greatestFiniteMagnitude))
        let switchYPosition =   (self.frame.height - switchNewSize.height)/2
        self.switchView.frame = CGRect(x: label.bounds.width + 5 , y: switchYPosition, width: switchNewSize.width, height: switchNewSize.height)
        
    }
    
    private func addSubviews() {
        // Adding Label
        label.text = "Auto Login"
        label.font = label.font?.withSize(16)
        label.textColor = .black
        self.addSubview(label)
        
        // Adding Switch
        self.addSubview(switchView)
    }
}

