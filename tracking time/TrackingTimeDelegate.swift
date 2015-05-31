//
//  TrackingTimeDelegate.swift
//  tracking time
//
//  Created by Thắng on 5/14/15.
//  Copyright (c) 2015 Trương Minh Thắng. All rights reserved.
//

import Foundation
import UIKit

class TrackingTimeDelegate: UIApplication, UIApplicationDelegate {
    
    var window: UIWindow?
    
    var bgTask: UIBackgroundTaskIdentifier!
    
    var timer: NSTimer?
    
    var vCL : TrackingTimeViewController!

    var path : String = {
        let fileManager = NSFileManager()
        var documentsPath = NSHomeDirectory().stringByAppendingPathComponent("Documents")
        return documentsPath.stringByAppendingPathComponent("textfile.txt")
    }()
    func isMultitaskingSupported() -> Bool{
        return UIDevice.currentDevice().multitaskingSupported
    }
    func writeToFile(){
        
        let timeEndBackgroundTask = NSDate()
        let saveArray : NSArray = [
            timeEndBackgroundTask,
            vCL.timeIndex,
            vCL.timeIt,
            vCL.timeNews,
            vCL.timeEnglish,
            vCL.timeHome,
            vCL.timeTheDuc,
            vCL.timeSleep
        ]

        let writenSuccessful = saveArray.writeToFile(path, atomically: true)
        if writenSuccessful {
            println("Save successful")
                    println(saveArray)
        }
        else {
            println("Save unsuccessful")
        }
        
    }
    func  endBackgroundTask() {
        let mainQueue = dispatch_get_main_queue()
        dispatch_async(mainQueue, {[weak self] in
            if let theTimer = self!.timer{
                
                theTimer.invalidate()
                self!.timer = nil
                self!.writeToFile()
                
                UIApplication.sharedApplication().endBackgroundTask(
                    self!.bgTask)
                self!.bgTask = UIBackgroundTaskInvalid
            }
            })
    }
    
    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {
        vCL = TrackingTimeViewController()
        window = UIWindow(frame: UIScreen.mainScreen().bounds)
        window?.rootViewController = vCL
        window?.makeKeyAndVisible()
        timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "handle:", userInfo: nil, repeats: true)
        UIScreen.mainScreen().brightness = 0.3
        return true
    }
    
    func applicationDidEnterBackground(application: UIApplication) {
        println("applicationDidEnterBackground")
        
        if !isMultitaskingSupported(){
            println(isMultitaskingSupported)
            return
        }
        bgTask = application.beginBackgroundTaskWithName("task", expirationHandler: { [weak self] in
            println("run func endBackgroundTask")
            
            self!.endBackgroundTask()
            
            })
        
    }
    
    func handle(sender: NSTimer){
        
        vCL.handleTimer(sender)
    }
    func applicationWillResignActive(application: UIApplication) {
        
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
        // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
        
    }
    func applicationWillEnterForeground(application: UIApplication) {
        println("applicationWillEnterForeground")
        if timer == nil {
            var loadArray : NSArray?
            loadArray = NSArray(contentsOfFile: path)
            
            var timeEndBackgroundTask : NSDate = loadArray![0] as! NSDate
            vCL.timeIndex = loadArray![1] as! Int
            vCL.timeIt = loadArray![2]  as! Int
            vCL.timeNews = loadArray![3] as! Int
            vCL.timeEnglish = loadArray![4] as! Int
            vCL.timeHome = loadArray![5] as! Int
            vCL.timeTheDuc = loadArray![6] as! Int
            vCL.timeSleep = loadArray![7] as! Int

            println(loadArray)

            var diff = -timeEndBackgroundTask.timeIntervalSinceNow
            println(diff)
            
            switch vCL.timeIndex {
            case 0:
                vCL.timeIt += Int(diff)
            case 1:
                vCL.timeNews += Int(diff)
            case 2:
                vCL.timeEnglish += Int(diff)
            case 3:
                vCL.timeHome += Int(diff)
            case 4:
                vCL.timeTheDuc += Int(diff)
            case 5: vCL.timeSleep += Int(diff)
            default: vCL.timeIndex = 6
            }
            println("load Successful")

            timer = NSTimer.scheduledTimerWithTimeInterval(1.0, target: self, selector: "handle:", userInfo: nil, repeats: true)
            
            
        }
        // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
    }
    
    func applicationDidBecomeActive(application: UIApplication) {
        println("applicationDidBecomeActive")
        UIApplication.sharedApplication().idleTimerDisabled = true
        
    
        
        // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
    }
    
    func applicationWillTerminate(application: UIApplication) {
        println("applicationWillTerminate")
        
        // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
    }
    
    
    
}