//
//  FavouriteTableViewCell.swift
//  Grc2016_iOS
//
//  Created by DeepakDhanaie on 19/09/16.
//
//

import UIKit

class FavouriteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ablumImageView : UIImageView?
    @IBOutlet weak var ablumNameLabel : UILabel?
    @IBOutlet weak var singerNameLabel : UILabel?


    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(favurite : Favourite){
        ablumImageView
        singerNameLabel?.text = favurite.singerName
        ablumNameLabel?.text = favurite.albumName
        
        
    }
    
}
