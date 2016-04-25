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
        item?.displayURL = NSURL(string: "Video://video/1")
        item?.playURL = NSURL(string: "Video://video/1")
        
        let item2 = TVContentItem(contentIdentifier: TVContentIdentifier(identifier: "item1", container: nil)!)
        item2?.imageURL = NSURL(string: "\(ServiceProvider.TVBaseURL)images/shelf2.png")
        item2?.displayURL = NSURL(string: "Video://video/3")
        item2?.playURL = NSURL(string: "Video://video/3")

        let item3 = TVContentItem(contentIdentifier: TVContentIdentifier(identifier: "item1", container: nil)!)
        item3?.imageURL = NSURL(string: "\(ServiceProvider.TVBaseURL)images/shelf3.png")
        item3?.displayURL = NSURL(string: "Video://video/2")
        item3?.playURL = NSURL(string: "Video://video/2")

        return [item!, item2!, item3!]
    }

}

