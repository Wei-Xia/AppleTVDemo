//
//  RootViewController.swift
//  AppleTVDemo
//
//  Created by Oleksii Ozun on 01.12.15.
//  Copyright © 2015 DataArt. All rights reserved.
//

import UIKit
import TVMLKit

class RootViewController: UIViewController {

    static let episodesDoc = "episodes"
    static let scriptString = "presentScreen(\"\(episodesDoc)\")"
    
    var tvAppController:TVApplicationController?
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func episodesButtonAction(sender: AnyObject) {
        if let tvNavigation = tvAppController?.navigationController{
            presentViewController(tvNavigation, animated: true) {
                self.tvAppController?.evaluateInJavaScriptContext({ (context) -> Void in
                    context.evaluateScript(RootViewController.scriptString)
                    }, completion: nil)
            }
        }
    }
}
