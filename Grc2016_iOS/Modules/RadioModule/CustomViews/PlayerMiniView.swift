//
//  PlayerMiniView.swift
//  Grc2016_iOS
//
//  Created by Kailash on 9/27/16.
//
//

import UIKit



class PlayerMiniView: UIView {
    
    override func awakeFromNib() {
        
        let swipeRight = UISwipeGestureRecognizer(target: self, action: "dismissview")
        swipeRight.direction = UISwipeGestureRecognizerDirection.Right
        self.addGestureRecognizer(swipeRight)
        
        let swipeLeft = UISwipeGestureRecognizer(target: self, action: "dismissview")
        swipeLeft.direction = UISwipeGestureRecognizerDirection.Left
        self.addGestureRecognizer(swipeLeft)
        
        self.addShadow()
    }

    
    func addShadow(){
        
        self.layer.masksToBounds = false
        self.layer.shadowColor = UIColor.blackColor().CGColor
        self.layer.shadowOffset =  CGSize(width: 0.1, height: 0.2)
        self.layer.shadowOpacity =  0.3
    }

    
    @IBAction func openPlayer(){
        
         Utility.hideBottomBar()
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        let audioController = AudioPlayerViewController(nibName: "AudioPlayerViewController", bundle: nil)
        appDelegate.window?.rootViewController!.presentViewController(audioController, animated: true, completion: {
           
        })
    
    }
    
    
    func dismissview(){
         Utility.hideBottomBar()
        
    }

}
