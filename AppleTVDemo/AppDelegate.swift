//
//  AppDelegate.swift
//  AppleTVDemo
//
//  Created by Oleksii Ozun on 01.12.15.
//  Copyright © 2015 DataArt. All rights reserved.
//

import UIKit
import TVMLKit

@UIApplicationMain
class AppDelegate: UIResponder, UIApplicationDelegate {
    
    static let TVBaseURL = "http://localhost:8080/"
    static let TVBootURL = "\(AppDelegate.TVBaseURL)js/application.js"
    
    var window: UIWindow?
    
    var tvAppController: TVApplicationController?
    let tvAppControllerContext = TVApplicationControllerContext()

    func application(application: UIApplication, didFinishLaunchingWithOptions launchOptions: [NSObject: AnyObject]?) -> Bool {

        if let javaScriptURL = NSURL(string: AppDelegate.TVBootURL) {
            tvAppControllerContext.javaScriptApplicationURL = javaScriptURL
        }
        
        tvAppControllerContext.launchOptions["BASEURL"] = AppDelegate.TVBaseURL
        
        if let launchOptions = launchOptions as? [String: AnyObject] {
            for (kind, value) in launchOptions {
                tvAppControllerContext.launchOptions[kind] = value
            }
        }
        tvAppController = TVApplicationController(context: tvAppControllerContext, window: nil, delegate: self)

        if let root = window?.rootViewController as? RootViewController{
            root.tvAppController = tvAppController
        }
        
        return true
    }

    
    func application(app: UIApplication, openURL url: NSURL, options: [String: AnyObject]) -> Bool {
        print("Application launched with URL: \(url)")
        return true
    }
}

extension AppDelegate: TVApplicationControllerDelegate {
    func appController(appController: TVApplicationController, evaluateAppJavaScriptInContext jsContext: JSContext) {
        
        let pushMyViewBlock : @convention(block) () -> Void = {
            () -> Void in
            let story = UIStoryboard(name: "Main", bundle: nil)
            let vc = story.instantiateViewControllerWithIdentifier("cast")
            
            dispatch_async(dispatch_get_main_queue(), {
                self.tvAppController?.navigationController.pushViewController(vc, animated: true)
            })
        }
       
        jsContext.setObject(unsafeBitCast(pushMyViewBlock, AnyObject.self), forKeyedSubscript: "pushCastCollectionViewController")
    }
}

