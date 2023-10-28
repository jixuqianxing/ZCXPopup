//
//  TransitionAnimator.swift
//  ZCXPopoup
//
//  Created by J&Z on 2023/3/1.
//

import UIKit

extension ZCXPopup {

    class TransitionAnimator: NSObject, UIViewControllerAnimatedTransitioning {

        private var isOpen: Bool = false

        convenience init(isOpen: Bool = false) {
            self.init()
            self.isOpen = isOpen
        }

        func transitionDuration(using transitionContext: UIViewControllerContextTransitioning?) -> TimeInterval {
            transitionContext?.isAnimated == true ? 0.5 : 0
        }

        func animateTransition(using transitionContext: UIViewControllerContextTransitioning) {

            guard let fromView = transitionContext.viewController(forKey: .from)?.view else { return }
            guard let toView = transitionContext.viewController(forKey: .to)?.view else { return }

            if isOpen {
                transitionContext.containerView.addSubview(toView)
                toView.transform = .init(scaleX: 0.7, y: 0.7)
                toView.alpha = 0
            }

            UIView.animate(
                withDuration: transitionDuration(using: transitionContext),
                delay: 0,
                usingSpringWithDamping: 0.7,
                initialSpringVelocity: 0.7,
                options: []) {
                if self.isOpen {
                    toView.transform = .identity
                    toView.alpha = 1
                } else {
                    fromView.transform = .init(scaleX: 0.7, y: 0.7)
                    fromView.alpha = 0
                }
            } completion: { _ in
                let wasCancelled = transitionContext.transitionWasCancelled
                transitionContext.completeTransition(!wasCancelled)
            }
        }
    }
}
