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
    @IBOutlet weak var learnMoreViewHeightConstraint: NSLayoutConstraint!
    @IBOutlet weak var collectionView: UICollectionView!
    var bottomFocusGuide: UIFocusGuide!
    @IBOutlet weak var learnMoreButton: UIButton!
    override func viewDidLoad() {
        super.viewDidLoad()

        bottomFocusGuide = UIFocusGuide()
        
        self.view.addLayoutGuide(bottomFocusGuide)
        bottomFocusGuide.preferredFocusedView = learnMoreButton
        bottomFocusGuide.topAnchor.constraintEqualToAnchor(learnMoreButton.topAnchor).active = true
        bottomFocusGuide.leftAnchor.constraintEqualToAnchor(self.view.leftAnchor).active = true
        bottomFocusGuide.widthAnchor.constraintEqualToAnchor(self.view.widthAnchor).active = true
        bottomFocusGuide.heightAnchor.constraintEqualToAnchor(learnMoreButton.heightAnchor).active = true
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
    
    override func didUpdateFocusInContext(context: UIFocusUpdateContext, withAnimationCoordinator coordinator: UIFocusAnimationCoordinator) {
        if context.nextFocusedView != learnMoreButton &&  context.previouslyFocusedView != learnMoreButton{
            return
        }
        var constant: CGFloat
        var alpha: CGFloat
        if context.nextFocusedView == learnMoreButton{
            constant = 600
            alpha = 0.3
            learnMoreViewHeightConstraint.constant = 600
       
        }else {
            constant = 200
            alpha = 1.0
        }
        
        learnMoreViewHeightConstraint.constant = constant
        coordinator.addCoordinatedAnimations({ () -> Void in
            self.collectionView.alpha = alpha
            self.view.layoutIfNeeded()
            }, completion: nil)
    }
}
