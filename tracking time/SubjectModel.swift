//
//  EventModel.swift
//  tracking time
//
//  Created by Thắng on 5/14/15.
//  Copyright (c) 2015 Trương Minh Thắng. All rights reserved.
//

import Foundation
import UIKit
class SubjectModel: NSObject {
    var timer : NSTimer?
    var selectorIndex: Int?
    var timeofSubject: [Int]{
        for 
    }
    init(timer: NSTimer){
        self.timer = timer
    }
    func pause(){
        if timer != nil {
            
            timer!.invalidate()
            timer = nil
        }
    }
    func run(){
        if timer == nil{
            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "selector", userInfo: nil, repeats: true)
        }
        
    }
    func selector() {
        switch selectorIndex! {
        case 1:
            timeEvent1++
        case 2:
            timeEvent2++
        case 3:
            timeEvent3++
        default:
            break
        }
    }
    
}