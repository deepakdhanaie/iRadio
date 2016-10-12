//
//  Favourite.swift
//  Grc2016_iOS
//
//  Created by DeepakDhanaie on 19/09/16.
//
//

import UIKit

class Favourite: NSObject {
    
    var singerName: String
    var albumName : String
    var albumIcon : String

    
    init(responseDictionary: [String : AnyObject]) {
    
            self.singerName = responseDictionary ["singerName"] as! String
            self.albumName =  responseDictionary ["albumName"]  as! String
            self.albumIcon =  ""
        
        
        
        
    }

}
