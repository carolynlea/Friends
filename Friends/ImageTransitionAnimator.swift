//
//  ImageTransitionAnimator.swift
//  Friends
//
//  Created by Carolyn Lea on 8/30/18.
//  Copyright © 2018 Carolyn Lea. All rights reserved.
//

import UIKit

class ImageTransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning
{
    var sourceImageView: UIImageView!
    var destinationImageView: UIImageView!
    var sourceName: UILabel!
    var destinationName: UILabel!
    
    func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
        return 1.0
    }
    
    func animateTransition(using transitionContext: UIViewControllerContextTransitioning)
    {
        guard let toVC = transitionContext.viewController(forKey: .to) as? DetailViewController,
            let toView = transitionContext.view(forKey: .to) else {return}
        
        //let containerView = transitionContext.containerView
        
        let toViewEndFrame = transitionContext.finalFrame(for: toVC)
        toView.frame = toViewEndFrame
        toView.alpha = 0.0
        transitionContext.containerView.addSubview(toView)
        
        let sourceImageFrame = transitionContext.containerView.convert((sourceImageView?.bounds)!, from: sourceImageView)
        let sourceNameFrame = transitionContext.containerView.convert((sourceName?.bounds)!, from: sourceName)
        
//        let destinationImageFrame = transitionContext.containerView.convert((destinationImageView?.bounds)!, to: destinationImageView)
//        let destinationNameFrame = transitionContext.containerView.convert((destinationName?.bounds)!, from: destinationName)
        
        
        let animatedImageView = UIImageView(frame: sourceImageFrame)
        animatedImageView.image = sourceImageView?.image
        
        animatedImageView.contentMode = (sourceImageView?.contentMode)!
        animatedImageView.clipsToBounds = true
        
        destinationImageView?.alpha = 0.0
        sourceImageView?.alpha = 0.0
        
        
        
        let animatedNameLabel = UILabel(frame: sourceNameFrame)
        animatedNameLabel.text = sourceName?.text
        animatedNameLabel.font = sourceName?.font
        
        destinationName?.alpha = 0.0
        sourceName?.alpha = 0.0
        transitionContext.containerView.addSubview(animatedImageView)
        transitionContext.containerView.addSubview(animatedNameLabel)
        
        let duration = transitionDuration(using: transitionContext)
        
        toView.layoutIfNeeded()
      
        
        UIView.animate(withDuration: duration, animations: {
            
            animatedImageView.frame = transitionContext.containerView.convert(self.destinationImageView.bounds, from: self.destinationImageView)
            animatedNameLabel.frame = transitionContext.containerView.convert(self.destinationName.bounds, from: self.destinationName)
            toView.alpha = 1.0
            
        }) { (success) in
            
            self.sourceImageView.alpha = 1.0
            self.destinationImageView.alpha = 1.0
            self.sourceName.alpha = 1.0
            self.destinationName.alpha = 1.0
            animatedNameLabel.removeFromSuperview()
            animatedImageView.removeFromSuperview()
            
            transitionContext.completeTransition(!transitionContext.transitionWasCancelled)
        }
    }
    
    
}
