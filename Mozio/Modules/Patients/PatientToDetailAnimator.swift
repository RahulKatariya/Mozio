//
//  PatientToDetailAnimator.swift
//  Mozio
//
//  Created by Rahul Katariya on 11/09/16.
//  Copyright © 2016 Rahul Katariya. All rights reserved.
//

import UIKit

class PatientToDetailAnimator: NSObject, UIViewControllerAnimatedTransitioning {
    
    func transitionDuration(transitionContext: UIViewControllerContextTransitioning?) -> NSTimeInterval {
        return 0.5
    }
    
    func animateTransition(transitionContext: UIViewControllerContextTransitioning) {
        let containerView = transitionContext.containerView()
        let fromVC = transitionContext.viewControllerForKey(UITransitionContextFromViewControllerKey) as! PatientsTableViewController
        let toVC = transitionContext.viewControllerForKey(UITransitionContextToViewControllerKey) as! PatientDetailViewController
        
        containerView!.addSubview(toVC.view)
        toVC.view.alpha = 0.0
        
        let duration = transitionDuration(transitionContext)
        UIView.animateWithDuration(duration, animations: {
            toVC.view.alpha = 1.0
            }, completion: { finished in
                fromVC.view.removeFromSuperview()
                transitionContext.completeTransition(finished)
        })
    }
    
}
