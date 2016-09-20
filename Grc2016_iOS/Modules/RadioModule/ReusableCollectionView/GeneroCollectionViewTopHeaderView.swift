//
//  GeneroCollectionViewTopHeaderView.swift
//  Grc2016_iOS
//
//  Created by Kailash on 9/20/16.
//
//

import UIKit

protocol GeneroCollectionViewTopHeaderViewDelegate {
    
    func searchBarTapped()
}

class GeneroCollectionViewTopHeaderView: UICollectionReusableView {
    
    var delegate:GeneroCollectionViewTopHeaderViewDelegate?

    @IBOutlet weak var radioLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        
    }
    
    func applyTheme(){
        
        //self.backgroundColor = UIColor.yellowColor()
        //radioLabel.text = "Hello"
    }
    
    
    @IBAction func searchBarButtonTapped(sender: AnyObject) {
        print("Tapped")
        
        NSNotificationCenter.defaultCenter().postNotificationName("searchBarTapped", object: nil)

    }
    
}
