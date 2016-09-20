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
        }
        
        
    }
    
    
    @IBAction func buttonAction(sender: AnyObject) {
        
        let index = sender.tag as Int
        if let delegate = self.delegate {
            delegate.buttonTapped(index)
        }

    }
    

    
    
}
