//
//  Utility.swift
//  Grc2016_iOS
//
//  Created by Kailash on 9/19/16.
//
//

import UIKit

class Utility: NSObject {

    class func configureNavBarThemeing(viewController: UIViewController, barTintColor: UIColor , titleColor: UIColor){
        
        viewController.navigationController?.navigationBar.tintColor = titleColor
        viewController.navigationController?.navigationBar.barTintColor = barTintColor
        
        viewController.navigationController?.navigationBar.titleTextAttributes = [
            NSForegroundColorAttributeName : titleColor]
    }
    
}
