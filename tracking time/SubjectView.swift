//
//  EventView.swift
//  tracking time
//
//  Created by Thắng on 5/14/15.
//  Copyright (c) 2015 Trương Minh Thắng. All rights reserved.
//

import Foundation
import UIKit

class SubjectView: UIView {
    var lb : UILabel!
    var btnAdd: UIButton!
    var btnEdit: UIButton!
    var textField: UITextField!
    var lbTitle: UILabel!
    var time: Int!
    var lbTimer : UILabel!


    override init(frame: CGRect) {
        super.init(frame: frame)
        lbTimer = UILabel(frame: CGRect(x: 0, y: 0, width: super.bounds.width, height: 80))
        lbTimer.center = super.center
        lbTimer.text = "Thoi gian"
        lbTimer.textColor = UIColor.whiteColor()
        lbTimer.textAlignment = NSTextAlignment.Center
        lbTimer.font = UIFont.boldSystemFontOfSize(50)
        lbTimer.backgroundColor = UIColor.cyanColor()
        super.addSubview(lbTimer)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }


}