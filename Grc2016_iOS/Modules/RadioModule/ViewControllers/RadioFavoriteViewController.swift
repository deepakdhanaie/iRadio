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
    
    var headerView : HeaderView?
    
    let favouriteArray = [Favourite]()
    
    
    

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
        
        headerView = nib.objectAtIndex(0) as? HeaderView
        
        let frame : CGRect = CGRectMake(0,0,self.view.frame.size.width,200)
        
        headerView!.frame = frame
    }
    
    
    
    //***********************************************************************
    // MARK:
    // MARK: - Table view datasource
    // MARK:
    //***********************************************************************
    
    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 10// favouriteArray.count
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell{
        
        var favouriteTableViewCell = tableView.dequeueReusableCellWithIdentifier("FavouriteTableViewCell") as? FavouriteTableViewCell

        if(favouriteTableViewCell == nil){
            let nib:NSArray=NSBundle.mainBundle().loadNibNamed("FavouriteTableViewCell", owner: self, options: nil)
            
            favouriteTableViewCell = nib.objectAtIndex(0) as? FavouriteTableViewCell
        
            
        }
            favouriteTableViewCell?.configureCell(nil)
        
        
        return favouriteTableViewCell!
    }
    
    
    
    
    
    
    //***********************************************************************
    // MARK:
    // MARK: - Table view delegate methods
    // MARK:
    //***********************************************************************
    
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        
        return 80
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        let tempView = UIView(frame: CGRectMake(0, 0, self.view.frame.size.width, 25))
        
        tempView.backgroundColor = UIColor.whiteColor()
        
        let titlelabel = UILabel(frame: CGRectMake(20, 5,200, 21))
        
        titlelabel.textColor = UIColor(red:38.0/255.0, green:47.0/255.0, blue:64.0/255.0, alpha: 1.0)
        
        titlelabel.font = UIFont.boldSystemFontOfSize(18)
        
        titlelabel.text = "Radio"
        
        tempView.addSubview(titlelabel)
        
        
    
        return tempView
    }
    
    

    
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        //_ = favouriteArray[indexPath.row]
    
       // self.navigationController?.pushViewController(listViewController!, animated: true)
        
        
    }
    

    

}
