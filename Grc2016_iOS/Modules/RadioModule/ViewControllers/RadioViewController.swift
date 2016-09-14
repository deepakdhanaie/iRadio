//
//  RadioViewController.swift
//  Grc2016_iOS
//
//  Created by Kailash on 9/14/16.
//
//

import UIKit

class RadioViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Radio"
        
        let startDate =  NSCalendar.currentCalendar().startOfDayForDate(NSDate())
        print(startDate.timeIntervalSince1970)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
}
