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
    
    @IBOutlet weak var labelLeadingConstraint: NSLayoutConstraint!
    var delegate:GeneroCollectionViewTopHeaderViewDelegate?

    @IBOutlet weak var radioLabel: UILabel!

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.configureView()
        
    }
    
    func configureView() {
        let leadingEdge = (self.frame.width * 0.10)/4
        
        labelLeadingConstraint.constant = leadingEdge + 1
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
