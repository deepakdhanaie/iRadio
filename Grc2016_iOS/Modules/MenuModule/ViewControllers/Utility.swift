//
//  Utility.swift
//  Grc2016_iOS
//
//  Created by Kailash on 9/19/16.
//
//

import UIKit

class Utility: NSObject {

    class func configureNavBarThemeing(viewController: UIViewController, barTintColor: UIColor , titleColor: UIColor){
        
        viewController.navigationController?.navigationBar.tintColor = titleColor
        viewController.navigationController?.navigationBar.barTintColor = barTintColor
        
        viewController.navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName : titleColor]
    }
    
    
    
    class func showBottomView(isTabBar:Bool) {
        
         let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        if(appDelegate.window?.viewWithTag(1000) == nil){
            let nib:NSArray=NSBundle.mainBundle().loadNibNamed("PlayerMiniView", owner: self, options: nil)
            
            let miniView = nib.objectAtIndex(0) as? PlayerMiniView
            miniView?.tag = 1000
            var distanceFromBottom = SCREENSIZE.height - 64
            
            if(isTabBar){
                distanceFromBottom =    distanceFromBottom - CGFloat(TABBARHEIGHT)
            }
            
            miniView?.frame = CGRectMake(0,distanceFromBottom,SCREENSIZE.width,64)
            appDelegate.window!.addSubview(miniView!)
            
        }
        else{
         let bottomPlayer =  appDelegate.window?.viewWithTag(1000)
            var distanceFromBottom = SCREENSIZE.height - 64
            if(isTabBar){
                distanceFromBottom =    distanceFromBottom - CGFloat(TABBARHEIGHT)
            }
        
          bottomPlayer?.frame =  CGRectMake(0,distanceFromBottom,SCREENSIZE.width,64)
        }
    }
    
    
    
    class func hideBottomBar() {
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
         if((appDelegate.window?.viewWithTag(1000)) != nil){
            appDelegate.window!.viewWithTag(1000)?.removeFromSuperview()
        }
        
        
        
        
    }
    
    class func configureRadioData() -> NSDictionary{
        
        let requestDict = NSMutableDictionary()
        
        requestDict.setObject("Bryan Adams", forKey: "singerName")
        requestDict.setObject("Cloud No 9.", forKey: "albumName")
      
        
        return requestDict
        
    }

    
    
    
    
    
}
