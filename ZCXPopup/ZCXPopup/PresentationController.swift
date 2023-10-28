//
//  PresentationController.swift
//  ZCXPopoup
//
//  Created by J&Z on 2023/3/1.
//

import UIKit

extension ZCXPopup {

    class PresentationController: UIPresentationController {

        override func presentationTransitionWillBegin() {
            guard let containerView else { return }
            dimmingView.frame = containerView.bounds
            dimmingView.alpha = 0.0
            containerView.insertSubview(dimmingView, at: 0)

            // 背景蒙层淡入动画
            presentedViewController.transitionCoordinator?.animate { _ in
                self.dimmingView.alpha = 1.0
            }
        }

        override func dismissalTransitionWillBegin() {
            // 背景蒙层淡出动画，以及移除操作
            presentedViewController.transitionCoordinator?.animate(alongsideTransition: { _ in
                self.dimmingView.alpha = 0.0
            }, completion: { _ in
                self.dimmingView.removeFromSuperview()
            })
        }

        override var frameOfPresentedViewInContainerView: CGRect { UIScreen.main.bounds }

        override func containerViewWillLayoutSubviews() {

            guard let containerView else { return }
            dimmingView.frame = containerView.bounds

            guard let presentedView else { return }
            presentedView.frame = frameOfPresentedViewInContainerView
        }

        // MARK: -

        /// 背景蒙层
        private lazy var dimmingView: UIView = {
            let view = UIView()
            view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
            return view
        }()
    }
}
