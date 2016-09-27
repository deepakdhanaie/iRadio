//
//  CustomAlertView.swift
//  Grc2016_iOS
//
//  Created by Kailash on 9/21/16.
//
//

import UIKit

class CustomAlertView: UIView,UIGestureRecognizerDelegate {

    @IBOutlet weak var baseView: UIView?
    
    @IBOutlet weak var tickMarkImageView: UIImageView!
    
    @IBOutlet weak var messageLabel: UILabel!
    
    
    override func awakeFromNib() {
        self.baseView!.backgroundColor = UIColor.whiteColor()
        let blackColor = UIColor.blackColor()
        self.backgroundColor = blackColor.colorWithAlphaComponent(0.7)
    }
    
    func configureView(message: String) {
        messageLabel.text = message
    
        let tap = UITapGestureRecognizer(target: self, action: Selector("handleTap:"))
        tap.delegate = self
        self.userInteractionEnabled = true
        self.addGestureRecognizer(tap)
    }
    
    func handleTap(sender: UITapGestureRecognizer? = nil) {
        // handling code
        self.removeFromSuperview()
    }
}
