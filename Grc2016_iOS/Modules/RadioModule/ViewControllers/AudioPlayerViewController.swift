//
//  AudioPlayerViewController.swift
//  Grc2016_iOS
//
//  Created by Kailash on 9/21/16.
//
//

import UIKit

class AudioPlayerViewController: UIViewController {

    @IBOutlet weak var albumArtImageView: UIImageView!
    
    @IBOutlet weak var emailLabel: UILabel!
    
    @IBOutlet weak var albumDetailLabel: UILabel!
    @IBOutlet weak var albumNameLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func backButtonTapped(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func shareButtonTapped(sender: AnyObject) {
    }
    
    
    @IBAction func likeButtonTapped(sender: AnyObject) {
    }
    
    @IBAction func bookMarkButtonTapped(sender: AnyObject) {
    }
    
    
    @IBAction func playButtonTapped(sender: AnyObject) {
    }
    
    

}
