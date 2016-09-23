//
//  GeneroReusableCollectionView.swift
//  Grc2016_iOS
//
//  Created by Kailash on 9/20/16.
//
//

import UIKit

class GeneroReusableCollectionView: UICollectionReusableView {

    @IBOutlet weak var labelLeadingConstraint: NSLayoutConstraint!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
        self.configureView()
    }
    
    func configureView() {
        let leadingEdge = (self.frame.width * 0.10)/4
        
        labelLeadingConstraint.constant = leadingEdge + 1
    }
    
}
