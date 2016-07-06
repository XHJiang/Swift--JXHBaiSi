//
//  JXHTabBarController.swift
//  JXHBaiSi
//
//  Created by mac on 16/7/6.
//  Copyright © 2016年 JXH. All rights reserved.
//

import UIKit


class JXHTabBarController: UITabBarController {
    
    
    override class func initialize() {
        
//        print(JXHTabBarController.classForCoder())
        
        if self == JXHTabBarController.self {
            let attrs = [NSFontAttributeName : UIFont.systemFontOfSize(12),NSForegroundColorAttributeName : UIColor.grayColor()]
            
            let selectedAttrs = [NSFontAttributeName : attrs[NSFontAttributeName]!, NSForegroundColorAttributeName : UIColor.darkGrayColor()]
            
            let item = UITabBarItem.appearance()
            
            item.setTitleTextAttributes(attrs, forState: UIControlState.Normal);
            item.setTitleTextAttributes(selectedAttrs, forState: .Selected)
            
        }
        
        
    }
    
    override func viewWillAppear(animated: Bool) {
        // 添加控制器
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        
        // 添加子控制器
        addChildVC()

        
        setTabBar()
    }
    
    //设置tabbar
    func setTabBar() {
        
        let newTabBar = JXHTabBar.init(frame: tabBar.bounds)
        
        setValue(newTabBar, forKey: "tabBar")
        
    }
    
    private func addChildVC() {
        setupChildVc(JXHEssenceViewController(), image: UIImage.init(named:"tabBar_essence_icon")!, selectedImage: UIImage.init(named: "tabBar_essence_click_icon")!, title: "精华")
        
        setupChildVc(JXHNewViewController(), image: UIImage.init(named: "tabBar_new_icon")!, selectedImage: UIImage.init(named: "tabBar_new_click_icon")!,title: "最新")
        
        setupChildVc(JXHFriendTrendsViewController(), image: UIImage.init(named: "tabBar_friendTrends_icon")!, selectedImage: UIImage.init(named: "tabBar_friendTrends_click_icon")!, title: "关注")
        
        setupChildVc(JXHMeViewController(), image: UIImage.init(named: "tabBar_me_icon")!, selectedImage: UIImage.init(named: "tabBar_me_click_icon")!,title: "我")
    }
    
    private func setupChildVc (vc : UIViewController, image : UIImage, selectedImage : UIImage, title : String) {
        // 设置文字和图片
        vc.tabBarItem.title = title;
        vc.tabBarItem.image = image
        vc.tabBarItem.selectedImage = selectedImage
        
        
        
        addChildViewController(vc)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
