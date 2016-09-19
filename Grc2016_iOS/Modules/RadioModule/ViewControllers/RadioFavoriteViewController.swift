//
//  RadioFavoriteViewController.swift
//  Grc2016_iOS
//
//  Created by Kailash on 9/19/16.
//
//

import UIKit

class RadioFavoriteViewController: UIViewController {
    
    // MARK: Outlet properties
    @IBOutlet weak var recipeDetailTableView: UITableView?
    
    let headerView : HeaderView?
    
    let favouriteArray = [Favourite]
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.registerHeaderView()
        recipeDetailTableView?.tableHeaderView = headerView
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func registerHeaderView(){
        
        let nib:NSArray=NSBundle.mainBundle().loadNibNamed("HeaderView", owner: self, options: nil)
        
        recipeHeaderView = nib.objectAtIndex(0) as? HeaderView
        
        let frame : CGRect = CGRectMake(0,0,self.view.frame.size,300)
        
        recipeHeaderView!.frame = frame
    }
    
    
    
    //***********************************************************************
    // MARK:
    // MARK: - Table view datasource
    // MARK:
    //***********************************************************************
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return favouriteArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        let cell = tableView.dequeueReusableCellWithIdentifier("FavouriteTableViewCell") as! FavouriteTableViewCell
        
        if cell == nil {
            //tableView.registerNib(UINib(nibName: "UICustomTableViewCell", bundle: nil), forCellReuseIdentifier: "UICustomTableViewCell")
            tableView.registerClass(FavouriteTableViewCell.classForCoder(), forCellReuseIdentifier: kCellIdentifier)
            
            cell = FavouriteTableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: kCellIdentifier)
        }

    
        let favouritres = favouriteArray[indexPath.row] as! Favourite
        
        cell.configureCell(favouritres)
        
        
        return cell
    }
    
    
    
    
    
    
    //***********************************************************************
    // MARK:
    // MARK: - Table view delegate methods
    // MARK:
    //***********************************************************************
    
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        
        return 50
    }
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        let favouritres = favouriteArray[indexPath.row] as! Favourite
        
        
       // self.navigationController?.pushViewController(listViewController!, animated: true)
        
        
    }
    

    

}
