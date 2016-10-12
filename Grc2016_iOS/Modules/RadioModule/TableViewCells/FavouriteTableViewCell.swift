//
//  FavouriteTableViewCell.swift
//  Grc2016_iOS
//
//  Created by DeepakDhanaie on 19/09/16.
//
//

import UIKit

protocol FavouriteTableViewCellDelegate{
    
    func programToSchedule()
}

class FavouriteTableViewCell: UITableViewCell {
    
    @IBOutlet weak var ablumImageView : UIImageView?
    @IBOutlet weak var ablumNameLabel : UILabel?
    @IBOutlet weak var singerNameLabel : UILabel?
    @IBOutlet weak var extraInfoButton : UIButton?
    
    var delegate : FavouriteTableViewCellDelegate?

    

    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
       // ablumImageView?.clipsToBounds = true
    }

    override func setSelected(selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    func configureCell(favurite : Favourite? ,isEditing :Bool){
        singerNameLabel?.text = "Bryan Adams"
        ablumNameLabel?.text = "Cloud No 9."
        
         extraInfoButton?.hidden = true
        
        if(isEditing){
           //extraInfoButton?.hidden = false
        }
        
    }
    
    
    @IBAction func reschedule(sender: AnyObject) {
        
        if let delegate = self.delegate {
            delegate.programToSchedule()
        }
    }
    
}
