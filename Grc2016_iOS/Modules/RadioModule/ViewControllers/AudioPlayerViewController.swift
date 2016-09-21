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
        self.tabBarController?.tabBar.hidden = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    override func viewWillDisappear(animated: Bool) {
        self.tabBarController?.tabBar.hidden = false

    }
    
    @IBAction func backButtonTapped(sender: AnyObject) {
        self.navigationController?.popViewControllerAnimated(true)
    }

    @IBAction func shareButtonTapped(sender: AnyObject) {
        
        self.showActivityController()
    }
    
    
    @IBAction func likeButtonTapped(sender: AnyObject) {
        
        let nib:NSArray=NSBundle.mainBundle().loadNibNamed("CustomAlertView", owner: self, options: nil)
        
        let customAlertView = nib.objectAtIndex(0) as? CustomAlertView
        customAlertView?.configureView("kTe has suscrito a esta estacion para recibir notificaciones")
        customAlertView?.frame = self.view.frame
        self.view.addSubview(customAlertView!)
    }
    
    @IBAction func bookMarkButtonTapped(sender: AnyObject) {
        let nib:NSArray=NSBundle.mainBundle().loadNibNamed("CustomAlertView", owner: self, options: nil)
        
        let customAlertView = nib.objectAtIndex(0) as? CustomAlertView
        customAlertView?.configureView("Esta estacion se ha anadido a la seccion de Favoritos")
        customAlertView?.frame = self.view.frame
        self.view.addSubview(customAlertView!)
    }
    
    
    @IBAction func playButtonTapped(sender: AnyObject) {
    }
    
    //***********************************************************************
    // MARK:
    // MARK: - Default sharing related methods
    // MARK:
    //***********************************************************************
    
    
    func showActivityController(){
        
        let activityViewController = UIActivityViewController(activityItems:[], applicationActivities: nil)
        // Exclude irrelevant activities
        //        activityViewController.excludedActivityTypes =
        //            [UIActivityTypeAssignToContact, UIActivityTypeSaveToCameraRoll, UIActivityTypePostToFlickr,
        //                UIActivityTypePostToVimeo,UIActivityTypePostToTwitter,UIActivityTypePostToFacebook]
        
        self.presentViewController(activityViewController, animated: true, completion: nil)
        
    }
    

    

}
