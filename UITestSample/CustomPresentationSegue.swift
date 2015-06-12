//
//  CustomPresentationSegue.swift
//  UITestSample
//
//  Created by 塚越啓介 on 2015/06/11.
//  Copyright © 2015年 ktsukago. All rights reserved.
//

import UIKit

class CustomAnimationPresentationSegue: UIStoryboardSegue, UIViewControllerTransitioningDelegate, UIViewControllerAnimatedTransitioning {
    
    override func perform() {
        /*
        Because this class is used for a Present Modally segue, UIKit will
        maintain a strong reference to this segue object for the duration of
        the presentation. That way, this segue object will still be around to
        provide an animation controller for the eventual dismissal, as well
        as for the initial presentation.
        */
        destinationViewController.transitioningDelegate = self
        
        super.perform()
    }
    
    func animationControllerForPresentedController(presented: UIViewController, presentingController presenting: UIViewController, sourceController source: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func animationControllerForDismissedController(dismissed: UIViewController) -> UIViewControllerAnimatedTransitioning? {
        return self
    }
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()!
        
        let toView = transitionContext.viewForKey(UITransitionContextToViewKey)!
        
        if transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) == destinationViewController {
            // Presenting.
            UIView.performWithoutAnimation {
                toView.alpha = 0
                containerView.addSubview(toView)
            }
            
            let transitionContextDuration = transitionDuration(transitionContext)
            
            UIView.animateWithDuration(transitionContextDuration, animations: {
                toView.alpha = 1
                }, completion: { success in
                    transitionContext.completeTransition(success)
            })
        }
        else {
            // Dismissing.
            let fromView = transitionContext.viewForKey(UITransitionContextFromViewKey)!
            
            UIView.performWithoutAnimation {
                containerView.insertSubview(toView, belowSubview: fromView)
            }
            
            let transitionContextDuration = transitionDuration(transitionContext)
            
            UIView.animateWithDuration(transitionContextDuration, animations: {
                fromView.alpha = 0
                }, completion: { success in
                    transitionContext.completeTransition(success)
            })
        }
    }
}
