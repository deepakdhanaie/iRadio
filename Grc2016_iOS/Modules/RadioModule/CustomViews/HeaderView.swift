//
//  HeaderView.swift
//  Grc2016_iOS
//
//  Created by DeepakDhanaie on 19/09/16.
//
//

import UIKit


protocol HeaderViewDelegate {
    
    func buttonTapped(buttonIndex: Int)
    
}
class HeaderView: UIView {
    // IBoutlet properties
    @IBOutlet weak var headerImageView : UIImageView?
    @IBOutlet weak var likeButton : UIButton?
    @IBOutlet weak var favouriteButton : UIButton?
    @IBOutlet weak var shareButton : UIButton?
    
    @IBOutlet weak var bottomLabelHeightConstraint: NSLayoutConstraint?
    // delegate
    var delegate:HeaderViewDelegate?
    
    override func awakeFromNib() {
        
       likeButton?.tag =  LIKEBUTTONTAG
       shareButton?.tag = SHAREBUTTONTAG
       favouriteButton?.tag = FAVOURITEBUTTONTAG
    }
 
    
    func configureView (isPlayer: Bool){
        
        likeButton?.hidden = true
        favouriteButton?.hidden = true
        shareButton?.hidden = true
        
        if(isPlayer){
            likeButton?.hidden = false
            favouriteButton?.hidden = false
            shareButton?.hidden = false
            
             headerImageView?.frame = CGRectMake(0,0,self.frame.size.width,201)
            bottomLabelHeightConstraint?.constant = 34
            
            
        }
        else{
            headerImageView?.frame = CGRectMake(0,0,self.frame.size.width,182)
            bottomLabelHeightConstraint?.constant = 0
            
        }
        
        
    }
    
    
    @IBAction func buttonAction(sender: AnyObject) {
        
        let index = sender.tag as Int
        if let delegate = self.delegate {
            delegate.buttonTapped(index)
        }

    }
    
    override func layoutSubviews() {
         self.layoutIfNeeded()
    }

    
    
}
