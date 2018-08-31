//
//  NavigationControllerDelegate.swift
//  Friends
//
//  Created by Carolyn Lea on 8/30/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class NavigationControllerDelegate: NSObject, UINavigationControllerDelegate
{
    var sourceCell: UITableViewCell!
    var imageTransitionAnimator = ImageTransitionAnimator()
    
    func navigationController(_ navigationController: UINavigationController, animationControllerFor operation: UINavigationControllerOperation, from fromVC: UIViewController, to toVC: UIViewController) -> UIViewControllerAnimatedTransitioning?
    {
        guard let toVC = toVC as? DetailViewController else {return nil}
        
        toVC.loadViewIfNeeded()
        
        imageTransitionAnimator.sourceImageView = sourceCell.imageView
        imageTransitionAnimator.sourceName = sourceCell.textLabel
        imageTransitionAnimator.destinationImageView = toVC.friendImageView!
        imageTransitionAnimator.destinationName = toVC.nameLabel!
        
       return imageTransitionAnimator
    }
}
