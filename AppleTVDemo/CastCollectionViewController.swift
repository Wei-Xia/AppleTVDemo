//
//  CastCollectionViewController.swift
//  AppleTVDemo
//
//  Created by Oleksii Ozun on 01.12.15.
//  Copyright © 2015 DataArt. All rights reserved.
//

import UIKit

private let reuseIdentifier = "Cell"

class CastCollectionViewController: UIViewController, UICollectionViewDelegateFlowLayout, UICollectionViewDataSource, UICollectionViewDelegate {
    @IBOutlet weak var collectionView: UICollectionView!
    var bottomFocusGuide: UIFocusGuide!
    @IBOutlet weak var learnMoreButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 7
    }

    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! CastCollectionViewCell
    
        cell.imageView?.image = UIImage(named: "cast/\(indexPath.row + 1)")
        
        return cell
    }
}
