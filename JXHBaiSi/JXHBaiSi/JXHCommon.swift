//
//  JXHCommon.swift
//  JXHBaiSi
//
//  Created by mac on 16/7/6.
//  Copyright © 2016年 JXH. All rights reserved.
//

import UIKit

let screenW = UIScreen.mainScreen().bounds.width
let screenH = UIScreen.mainScreen().bounds.height

extension UIView{
    
    var x:CGFloat{
        get{
            return self.frame.origin.x
        }
        set{
            self.frame.origin.x = newValue
        }
    }
    
    var y:CGFloat{
        get{
            return self.frame.origin.y
        }
        set{
            self.frame.origin.y = newValue
        }
    }
    
    var centerX:CGFloat{
        get{
            return self.frame.midX
        }
        set{
            self.frame.origin.x = newValue - self.frame.size.width * 0.5
        }
    }
    
    var centerY:CGFloat{
        get{
            return self.frame.midY
        }
        set{
            self.frame.origin.y = newValue - self.frame.size.height * 0.5
        }
    }
    
    var width:CGFloat{
        get{
            return self.frame.size.width
        }
        set{
            self.frame.size.width = newValue
        }
    }
    
    var height:CGFloat{
        get{
            return self.frame.size.height
        }
        set{
            self.frame.size.height = newValue
        }
    }
    
    var size:CGSize{
        get{
            return self.frame.size
        }
        set{
            self.frame.size = newValue
        }
    }
    
    func isShowingOnKeyWindow() -> Bool{
        let window = UIApplication.sharedApplication().keyWindow
        
        let newFrame = self.superview!.convertRect(self.frame, toView: window)
        let intersects = CGRectIntersectsRect(newFrame, (window?.frame)!)
        
        return !self.hidden && self.alpha > 0.01 && intersects
    }
    
}

extension UIButton {
    
    
    class func creatButton (backImage:UIImage, selectedBackImage:UIImage) -> UIButton {
        let btn = UIButton(type: .Custom)
        btn.setImage(backImage, forState: .Normal)
        btn.setImage(selectedBackImage, forState: .Selected)
        btn.sizeToFit()
        return btn
    }
    
    class func creatButton (backImage:UIImage, selectedBackImage:UIImage , target: AnyObject?, action:Selector) -> UIButton {
        let btn = UIButton(type: .Custom)
        btn.setImage(backImage, forState: .Normal)
        btn.setImage(selectedBackImage, forState: .Selected)
        btn.addTarget(target, action: action, forControlEvents: .TouchUpInside)
        btn.sizeToFit()
        return btn
    }
    
}



class JXHCommon: NSObject {

}
