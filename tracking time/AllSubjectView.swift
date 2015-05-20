//
//  AllSubjectView.swift
//  tracking time
//
//  Created by Thắng on 5/14/15.
//  Copyright (c) 2015 Trương Minh Thắng. All rights reserved.
//

import Foundation
import UIKit

class AllSubjectView : UIView {
    var subjectViewTag : Int!
    var numberOfSubject: Int!
    var subjectViewBound: CGRect!
    var subjectHeight: Int!
    var centerPoint : [CGPoint] {
        var cPoint = [CGPoint]()
        for i in 0 ..< numberOfSubject {
            var point = CGPoint(x: super.center.x, y: (CGFloat(i) + 0.5) * CGFloat(subjectHeight!))
            cPoint.append(point)
        }
        return cPoint
    }

    func newApp(){
        subjectViewTag = 0
        numberOfSubject = 2
        subjectHeight = 150
        subjectViewBound = CGRect(x: 0, y: 0, width: Int(super.bounds.width), height: subjectHeight!)
        for i in 0 ..< numberOfSubject {
            addNewSubject(i)
        }
    }
    func addNewSubject(i : Int){
        var newSubject = SubjectView(frame: subjectViewBound)
        newSubject.center = centerPoint[i]
        var 
        super.addSubview(newSubject)
    }
    override init(frame: CGRect){
        super.init(frame: frame)
        newApp()
    }

    required init(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}