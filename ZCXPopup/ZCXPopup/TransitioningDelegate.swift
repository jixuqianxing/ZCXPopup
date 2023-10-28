//
//  TransitioningDelegate.swift
//  ZCXPopoup
//
//  Created by J&Z on 2023/3/1.
//

import UIKit

extension ZCXPopup {

    class TransitioningDelegate: NSObject, UIViewControllerTransitioningDelegate {

        func presentationController(
            forPresented presented: UIViewController,
            presenting: UIViewController?,
            source: UIViewController
        ) -> UIPresentationController? {
            PresentationController(presentedViewController: presented, presenting: presenting)
        }

        func animationController(
            forPresented presented: UIViewController,
            presenting: UIViewController,
            source: UIViewController
        ) -> UIViewControllerAnimatedTransitioning? {
            TransitionAnimator(isOpen: true)
        }

        func animationController(
            forDismissed dismissed: UIViewController
        ) -> UIViewControllerAnimatedTransitioning? {
            TransitionAnimator(isOpen: false)
        }
    }
}
