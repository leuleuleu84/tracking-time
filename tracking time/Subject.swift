//
//  Subject.swift
//  tracking time
//
//  Created by Thắng on 5/14/15.
//  Copyright (c) 2015 Trương Minh Thắng. All rights reserved.
//

import Foundation
import UIKit

class Subject: UIView {
    var lbTime: UILabel!
    var lbTitle: UILabel!
    var clickView: UIView!
    
    var titleSubject = [
        "Time for IT",
        "Time for News",
        "Time for English",
        "Time for Home",
        "Time for Fitness",
        "Time for Sleep"]
    
    var colorSubject : [UIColor]{
        var colorSubject = [UIColor]()
        colorSubject.append(UIColor.blackColor())
        colorSubject.append(UIColor.redColor())
        colorSubject.append(UIColor.blueColor())
        colorSubject.append(UIColor.orangeColor())
        colorSubject.append(UIColor.greenColor())
        colorSubject.append(UIColor.cyanColor())
        return colorSubject
    }

    init(frame: CGRect, index : Int) {
        super.init(frame: frame)
        super.backgroundColor = colorSubject[index]
        
        
        lbTime = UILabel(frame: CGRect(x: 0, y: 0, width: super.bounds.width, height: 50))
        lbTime.text = "--:--:--"
        lbTime.textAlignment = NSTextAlignment.Center
        
        lbTime.textColor = UIColor.whiteColor()
        lbTime.font = UIFont.boldSystemFontOfSize(32)
        lbTime.center = super.center
        lbTime.center.y = super.center.y + 10
        
        super.addSubview(lbTime)
        
        
        clickView = UIView(frame: frame)
        clickView.backgroundColor = UIColor.blackColor()
        clickView.alpha = 0.9
        
        clickView.tag = index
        super.addSubview(clickView)
        
        lbTitle = UILabel(frame: CGRect(x: 10, y: 0, width: 200, height: 40))
        lbTitle.textColor = UIColor.darkGrayColor()
        lbTitle.tag = index
        lbTitle.text = titleSubject[index]
        lbTitle.font = UIFont.italicSystemFontOfSize(18)
        
        super.addSubview(lbTitle)
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
}