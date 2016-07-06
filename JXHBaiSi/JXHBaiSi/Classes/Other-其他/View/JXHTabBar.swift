//
//  JXHTabBar.swift
//  JXHBaiSi
//
//  Created by mac on 16/7/6.
//  Copyright © 2016年 JXH. All rights reserved.
//

import UIKit

class JXHTabBar: UITabBar {
    
    
    private lazy var publishButton : UIButton = {
        let btn = UIButton.creatButton(UIImage.init(named: "tabBar_publish_icon")!, selectedBackImage: UIImage.init(named: "tabBar_publish_click_icon")!, target: self, action: "presentView")
        return btn
    }()
    
    /**
     点击加号
     */
    func presentView(){
//        UIApplication.sharedApplication().keyWindow?.rootViewController?.presentViewController(UIViewController(), animated: false, completion: nil)
        
    }

    override init(frame: CGRect) {
        super.init(frame: frame)

        addSubview(publishButton)
        backgroundImage = UIImage(named: "tabbar-light")
    }

    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    override func layoutSubviews() {
        super.layoutSubviews()
        
        let width = frame.width
        let height = frame.height
        
        
        // 设置发布按钮的frame
        publishButton.center = CGPointMake(width * 0.5, height * 0.5)
        publishButton.frame.size.width = width * 0.2
        publishButton.frame.size.height = height
        
//        publishButton.width = 20
        
        
        // 设置其他UITabBarButton的frame
        let buttonY : CGFloat = 0;
        let buttonW = width / 5;
        let buttonH = height;
        var index : CGFloat = 0;
        for button in subviews {
            //        if (![button isKindOfClass:NSClassFromString(@"UITabBarButton")]) continue;
            if !button.isKindOfClass(NSClassFromString("UITabBarButton")!) || button == self.publishButton {
                continue
            }
            
            // 计算按钮的x值
            let buttonX = buttonW * ((index > 1) ? (index + 1) : index);
            button.frame = CGRectMake(buttonX, buttonY, buttonW, buttonH)

            
            // 增加索引
            index++
        }
    }

}
