//
//  JXHNavigationController.swift
//  JXHBaiSi
//
//  Created by mac on 16/7/7.
//  Copyright © 2016年 JXH. All rights reserved.
//

import UIKit

class JXHNavigationController: UINavigationController {
    
    var popDelegate : UIGestureRecognizerDelegate?


    override class func initialize() {
        
        if self == JXHNavigationController.self {
            
            let bar = UINavigationBar.appearance()
            let attrs = [NSFontAttributeName : UIFont.systemFontOfSize(12)]
            bar.titleTextAttributes = attrs
            
            bar.setBackgroundImage(UIImage(named: "navigationbarBackgroundWhite"), forBarMetrics: .Default)
        }
        
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // 左滑返回功能
        popDelegate = interactivePopGestureRecognizer?.delegate
        delegate = self
        
        
    }
    
    
    override func pushViewController(viewController: UIViewController, animated: Bool) {
        
        if self.childViewControllers.count > 0 {
            let btn = UIButton.creatButton(UIImage(named: "navigationButtonReturn")!, selectedImage: UIImage(named: "navigationButtonReturnClick")!, target: self, action: "back", title: "返回");
            
            btn.setTitle("返回", forState: .Normal)
            
            // 让按钮内部的所有内容左对齐
            btn.contentHorizontalAlignment = .Left;
            
            // 让按钮的内容往左便宜10
            btn.contentEdgeInsets = UIEdgeInsetsMake(0, -10, 0, 0)
            btn.setTitleColor(UIColor.blackColor(), forState: .Normal)
            btn.setTitleColor(UIColor.redColor(), forState: .Selected)
            
            viewController.navigationItem.leftBarButtonItem = UIBarButtonItem(customView: btn)
            
            // 隐藏tabbar
            viewController.hidesBottomBarWhenPushed = true
            
            // 左滑返回干扰移除
            interactivePopGestureRecognizer?.delegate = nil
            
        }
        
        super.pushViewController(viewController, animated: true)
    }
    
    func back() {
        popViewControllerAnimated(true)
    }
    
}

// MARK: - UINavigationControllerDelegate,控制左滑删除
extension JXHNavigationController: UINavigationControllerDelegate {
    func navigationController(navigationController: UINavigationController, didShowViewController viewController: UIViewController, animated: Bool) {
        
        if viewController == viewControllers.first {
            interactivePopGestureRecognizer?.delegate = popDelegate
        }
    }
}