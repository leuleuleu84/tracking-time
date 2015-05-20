//
//  ViewController.swift
//  tracking time
//
//  Created by Thắng on 5/14/15.
//  Copyright (c) 2015 Trương Minh Thắng. All rights reserved.
//

import UIKit

class TrackingTimeViewController: UIViewController {
    
    
    var lbTime = [UILabel]()
    var timeIndex : Int = 6
    var tap: UITapGestureRecognizer!
    var timer : NSTimer?
    var timeIt : Int = 0
        {
        didSet{
            if lbTime.count != 0 {
                var time = ConvertIntSecondToStringTime(second: timeIt)
                lbTime[0].text = time.toString()
            }
        }
        
    }
    var timeNews: Int = 0
        {
        didSet{
            if lbTime.count != 0 {
                var time = ConvertIntSecondToStringTime(second: timeNews)
                lbTime[1].text = time.toString()
            }
        }
        
    }
    var timeEnglish: Int = 0
        {
        didSet{
            if lbTime.count != 0 {
                var time = ConvertIntSecondToStringTime(second: timeEnglish)
                lbTime[2].text = time.toString()
            }
        }
        
    }
    var timeHome: Int = 0
        {
        didSet{
            if lbTime.count != 0 {
                var time = ConvertIntSecondToStringTime(second: timeHome)
                lbTime[3].text = time.toString()
            }
        }
        
    }
    var timeTheDuc: Int = 0
        {
        didSet{
            if lbTime.count != 0 {
                var time = ConvertIntSecondToStringTime(second: timeTheDuc)
                lbTime[4].text = time.toString()
            }
        }
        
    }
    var timeSleep: Int = 0
        {
        didSet{
            if lbTime.count != 0 {
                var time = ConvertIntSecondToStringTime(second: timeSleep)
                lbTime[5].text = time.toString()
            }
        }
        
    }
    
    
    
    var boundsSubjectView : CGRect!
    var centerPoint : [CGPoint] {
        var center = [CGPoint]()
        for i in 0 ..< 6 {
            var cPoint = CGPoint(x: view.center.x, y: (CGFloat(i) + 0.5) * CGFloat(boundsSubjectView.height))
            center.append(cPoint)
        }
        return center
    }
    var clickView = [UIView]()
    var lbTitle = [UILabel]()
    func setNew(){
        
        boundsSubjectView = CGRect(x: 0, y: 0, width: view.bounds.width, height: view.bounds.height / 6)
        for i in 0 ..< 6 {
            tap = UITapGestureRecognizer(target: self, action: "handle:")
            var subject = Subject(frame: boundsSubjectView, index: i)
            subject.center = centerPoint[i]
            subject.clickView.tag = i
            subject.clickView.addGestureRecognizer(tap)
            subject.clickView.userInteractionEnabled = true
            clickView.append(subject.clickView)
            lbTitle.append(subject.lbTitle)
            
            lbTime.append(subject.lbTime)
            view.addSubview(subject)
        }
        
    }
    func revealScreen(index: Int){
        for i in lbTitle {
            i.textColor = UIColor.darkGrayColor()
            if i.tag == index {
                i.textColor = UIColor.whiteColor()
            }
        }
        for i in clickView {
            i.alpha = 0.9
            if i.tag == index {
                i.alpha = 0
                timeIndex = index
            }
        }
    }
    
    func handleTimer(timer: NSTimer){
        switch timeIndex {
        case 0:
            timeIt++
        case 1:
            timeNews++
        case 2:
            timeEnglish += 1
        case 3:
            timeHome += 1
        case 4:
            timeTheDuc += 1
        case 5: timeSleep += 1
        default: timeIndex = 6
        }
    }
    func handle (tap:UITapGestureRecognizer){
        
        revealScreen(tap.view!.tag)
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        setNew()
 
    }
    override func prefersStatusBarHidden() -> Bool {
    return true
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
}

