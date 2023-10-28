//
//  UIViewController+ZCXPopup.swift
//  ZCXPopoup
//
//  Created by J&Z on 2023/3/1.
//

import UIKit

extension UIViewController {

    /// 转场类型
    @objc public enum TransitioningType: Int {
        case none  = 0
        case popup = 1
    }

    /// 转场类型
    @objc public var transitioningType: TransitioningType {
        get { getAssociatedObject() as? TransitioningType ?? .none }
        set {
            if newValue == .popup {
                transitioningDelegate = self.popupTransitioningDelegate
                modalPresentationStyle = .custom
            }
            setAssociatedObject(newValue)
        }
    }

    /// transitioningDelegate 实现类
    private var popupTransitioningDelegate: ZCXPopup.TransitioningDelegate {
        lazyVarAssociatedObject { ZCXPopup.TransitioningDelegate() }
    }
}

extension NSObjectProtocol {

    /// 获取关联对象
    public func getAssociatedObject(key: String = #function) -> Any? {
        objc_getAssociatedObject(self, Selector(key).utf8Start)
    }

    /// 设置关联对象
    public func setAssociatedObject(
        _ value: Any?,
        key: String = #function,
        policy: objc_AssociationPolicy = .OBJC_ASSOCIATION_RETAIN_NONATOMIC
    ) {
        objc_setAssociatedObject(self, Selector(key).utf8Start, value, policy)
    }

    /// 懒加载形式创建关联对象
    /// 首次调用这个方法，它会执行 `maker` 进行对象的创建，并将对象关联到 ObjC Runtime
    /// - Parameter maker: 创建对象的闭包
    public func lazyVarAssociatedObject<T>(_ maker: () -> T, key: String = #function) -> T {
        (objc_getAssociatedObject(self, Selector(key).utf8Start) as? T) ?? {
            let object = maker()
            objc_setAssociatedObject(self, Selector(key).utf8Start, object, .OBJC_ASSOCIATION_RETAIN_NONATOMIC)
            return object
        }()
    }
}

extension Selector {

    /// 获取 selector 全局唯一指针
    fileprivate var utf8Start: UnsafePointer<Int8> {
        unsafeBitCast(self, to: UnsafePointer<Int8>.self)
    }
}
