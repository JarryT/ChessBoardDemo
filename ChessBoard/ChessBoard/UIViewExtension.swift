//
//  UIViewExtension.swift
//  StoreDemo
//
//  Created by 汤军 on 17/1/19.
//  Copyright © 2017年 TJarry. All rights reserved.
//

import UIKit


//MARK: UIView Frame extension
extension UIView {
    
    //1.上
    var top: CGFloat{
        get{
            return self.frame.origin.y
        }
        set(newValue){
            self.frame = CGRect.init(x:self.frame.origin.x, y:newValue, width:self.frame.size.width, height:self.frame.size.height)
        }
    }
    
    //2.左
    var left: CGFloat{
        get{
            return self.frame.origin.x
        }
        set(newValue){
            self.frame = CGRect.init(x:newValue, y:self.frame.origin.y, width:self.frame.size.width, height:self.frame.size.height)
        }
    }
    
    //3.下
    var bottom: CGFloat{
        get{
            return self.frame.origin.y + self.frame.size.height
        }
        set(newValue){
            self.frame = CGRect.init(x:self.frame.origin.x, y:newValue - self.frame.size.height, width:self.frame.size.width, height:self.frame.size.height)
        }
    }
    
    //4.右
    var right: CGFloat{
        get{
            return self.frame.origin.x + self.frame.size.width;
        }
        set(newValue){
            self.frame = CGRect.init(x:newValue - self.frame.size.width, y:self.frame.origin.y, width:self.frame.size.width, height:self.frame.size.height)
        }
    }
    
    //5.水平中
    var centerX: CGFloat{
        get{
            return self.frame.origin.x + self.frame.size.width*0.5
        }
        set(newValue){
            self.frame = CGRect.init(x:newValue - self.frame.size.width*0.5, y:self.frame.origin.y, width:self.frame.size.width, height:self.frame.size.height)
        }
    }
    
    //5.竖直中
    var centerY: CGFloat{
        get{
            return self.frame.origin.y + self.frame.size.height*0.5
        }
        set(newValue){
            self.frame = CGRect.init(x:self.frame.origin.x, y:newValue - self.frame.size.height*0.5, width:self.frame.size.width, height:self.frame.size.height)
        }
    }
    
    //6.大小
    var size: CGSize{
        get{
            return CGSize.init(width:self.frame.size.width, height:self.frame.size.height)
        }
        set(newValue){
            self.frame = CGRect.init(x:self.frame.origin.x, y:self.frame.origin.y, width:newValue.width, height:newValue.height)
        }
    }
    
    //7.位置
    var origin: CGPoint{
        get{
            
            return CGPoint.init(x: self.left, y: self.top)
        }
        set(newValue){
            self.frame = CGRect.init(x:newValue.x, y:newValue.y, width:width, height:self.height)
        }
    }
    
    //8.宽
    var width: CGFloat{
        get{
            return self.frame.size.width
        }
        set(newValue){
            self.frame = CGRect.init(x:self.frame.origin.x, y:self.frame.origin.y, width:newValue, height:self.frame.size.height)
        }
    }
    
    //9.高
    var height: CGFloat{
        get{
            return self.frame.size.height
        }
        set(newValue){
            self.frame = CGRect.init(x:self.frame.origin.x, y:self.frame.origin.y, width:self.frame.size.width, height:newValue)
        }
    }
    
}


