//
//  SearchViewController.swift
//  Grc2016_iOS
//
//  Created by Kailash on 9/20/16.
//
//

import UIKit

class SearchViewController: UIViewController {

    @IBOutlet weak var searchBar: UISearchBar!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationBar.hidden = true
        searchBar.becomeFirstResponder()
        
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.Default
        self.tabBarController?.tabBar.hidden = true
        
        let view = UIView(frame:
            CGRect(x: 0.0, y: 0.0, width: UIScreen.mainScreen().bounds.size.width, height: 20.0)
        )
        view.backgroundColor = UIColor(red: 175/256.0, green: 175/256.0, blue: 175/256.0, alpha: 1.0)
        
        self.view.addSubview(view)

    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func viewWillDisappear(animated: Bool) {
        UIApplication.sharedApplication().statusBarStyle = UIStatusBarStyle.LightContent
        self.tabBarController?.tabBar.hidden = false


    }
    
    func searchBarCancelButtonClicked(searchBar: UISearchBar) {
     self.navigationController?.popViewControllerAnimated(false)
    }
}
