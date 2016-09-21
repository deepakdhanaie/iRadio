//
//  StationProfileTableViewCell.swift
//  Grc2016_iOS
//
//  Created by DeepakDhanaie on 21/09/16.
//
//

import UIKit

class StationProfileTableViewCell: UITableViewCell {

    @IBOutlet weak var albumArtImageView: UIImageView?
    
    @IBOutlet weak var albumName: UILabel?
    
    @IBOutlet weak var timeLabel: UILabel?
    
    @IBOutlet weak var onDemandLabel: UILabel?
    
    
    @IBOutlet weak var playAlbumButton: UIButton?
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    @IBAction func playAlbum(sender: AnyObject) {
    }
    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
