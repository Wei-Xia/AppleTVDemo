//
//  ServiceProvider.swift
//  AppleTVServiceDemo
//
//  Created by Oleksii Ozun on 01.12.15.
//  Copyright © 2015 DataArt. All rights reserved.
//

import Foundation
import TVServices

class ServiceProvider: NSObject, TVTopShelfProvider {

    override init() {
        super.init()
    }
    static let TVBaseURL = "http://localhost:8080/"
    // MARK: - TVTopShelfProvider protocol

    var topShelfStyle: TVTopShelfContentStyle {
        // Return desired Top Shelf style.
        return .Inset
    }

    var topShelfItems: [TVContentItem] {
        // Create an array of TVContentItems.
        let item = TVContentItem(contentIdentifier: TVContentIdentifier(identifier: "item1", container: nil)!)
        item?.imageURL = NSURL(string: "\(ServiceProvider.TVBaseURL)images/shelf1.png")
        
        let item2 = TVContentItem(contentIdentifier: TVContentIdentifier(identifier: "item1", container: nil)!)
        item2?.imageURL = NSURL(string: "\(ServiceProvider.TVBaseURL)images/shelf2.png")
        
        let item3 = TVContentItem(contentIdentifier: TVContentIdentifier(identifier: "item1", container: nil)!)
        item3?.imageURL = NSURL(string: "\(ServiceProvider.TVBaseURL)images/shelf3.png")
        
        return [item!, item2!, item3!]
    }

}

