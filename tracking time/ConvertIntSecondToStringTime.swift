//
//  ConvertIntSecondToStringTime.swift
//  tracking time
//
//  Created by Thắng on 5/14/15.
//  Copyright (c) 2015 Trương Minh Thắng. All rights reserved.
//

import Foundation
struct ConvertIntSecondToStringTime {
    var hour: Int = 0
    var minute: Int = 0
    var second: Int = 0
    init(pHour: Int, pMinute: Int, pSecond : Int)
    {
        hour = pHour
        minute = pMinute
        second = pSecond
    }
    init(second: Int){
        self.second = second % 60
        minute = (second / 60) % 60
        hour = second / 3600
    }
    init(){
        hour = 0
        minute = 0
        second = 0
    }
    
    func toString() -> String {
        var result = ""
        var vStrHour = hour < 10 ? "0" + String(hour) + ":": String(hour) + ":"
        result += vStrHour
        var vStrMin = minute < 10 ? "0" + String(minute) + ":" : String(minute) + ":"
        result += vStrMin
        var vStrSec = second < 10 ? "0" + String(second) : String(second)
        result += vStrSec
        return result
    }
}