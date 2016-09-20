//
//  RadioFavoriteViewController.swift
//  Grc2016_iOS
//
//  Created by Kailash on 9/19/16.
//
//

import UIKit

class RadioFavoriteViewController: UIViewController,UIActionSheetDelegate {
    
    // MARK: Outlet properties
    @IBOutlet weak var favouriteTableView: UITableView?
    
    var headerView : HeaderView?
    
    let favouriteArray = [Favourite]()
    
    var editButton : UIButton?
    
    var isEditFirst : Bool?
    
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.registerHeaderView()
        headerView?.delegate = self
        headerView?.configureView(true)
        favouriteTableView?.tableHeaderView = headerView
        isEditFirst = true
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func registerHeaderView(){
    
        let nib:NSArray=NSBundle.mainBundle().loadNibNamed("HeaderView", owner: self, options: nil)
        
        headerView = nib.objectAtIndex(0) as? HeaderView
        
        print(headerView?.frame)
        
       self.favouriteTableView?.tableHeaderView?.frame = CGRectMake(0,0,self.view.frame.size.width,182)
        
        self.favouriteTableView?.tableHeaderView = self.favouriteTableView?.tableHeaderView;
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
        favouriteTableViewCell?.delegate = self
        favouriteTableViewCell?.configureCell(nil, isEditing:(favouriteTableView?.editing)!)
        
        
        return favouriteTableViewCell!
    }
    
    
    
    
    
    
    //***********************************************************************
    // MARK:
    // MARK: - Table view delegate methods
    // MARK:
    //***********************************************************************
    
    
    func tableView(tableView: UITableView, estimatedHeightForRowAtIndexPath indexPath: NSIndexPath) -> CGFloat{
        
        return 64
    }
    
    func tableView(tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
        
        
        let tempView = UIView(frame: CGRectMake(0, 0, self.view.frame.size.width, 39))
        
        tempView.backgroundColor = UIColor.whiteColor()
        
        let titlelabel = UILabel(frame: CGRectMake(19, 14,200, 14))
        
        titlelabel.textColor = UIColor.blackColor()
        
        titlelabel.font = UIFont(name: "HelveticaNeue-Medium", size: 16.0)
        
        titlelabel.text = "Radio"
        
        tempView.addSubview(titlelabel)
        
        

        
        if(isEditFirst == true){
            editButton = UIButton(frame: CGRectMake(self.view.frame.size.width - (50 + 15), 15,50, 16))
            editButton!.setTitle("Editor", forState: .Normal)
            isEditFirst = false
        }
    
        
        editButton?.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 11.0)
        
        editButton!.setTitleColor(UIColor(red:206.0/255.0, green:206.0/255.0, blue:206.0/255.0, alpha: 1.0), forState: .Normal)
        
        editButton!.addTarget(self, action: "editSongList", forControlEvents: .TouchUpInside)
        
        tempView.addSubview(editButton!)
        
    
        return tempView
    }
    
    

    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 39
        }
        return tableView.sectionHeaderHeight
    }
    
    
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath){
        
        //_ = favouriteArray[indexPath.row]
    
       // self.navigationController?.pushViewController(listViewController!, animated: true)
        
        
    }
    
    
    
    func editSongList(){
        
        if(self.favouriteTableView?.editing == true){
            
            self.favouriteTableView?.setEditing(false, animated: true)
            
             editButton!.setTitle("Editor", forState: .Normal)
            
        } else {
            
            
            editButton!.setTitle("Done", forState: .Normal)
            self.favouriteTableView?.setEditing(true, animated: true)
            
            
        }
        
        self.favouriteTableView?.reloadSections(NSIndexSet(index: 0), withRowAnimation: .Fade)
        
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
    
    
    func showActionSheet(){
        let actionSheet = UIActionSheet(title: "Choose Option", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil, otherButtonTitles: "Save", "Delete")
        let tabbar =   self.tabBarController?.tabBar
        actionSheet.showFromTabBar(tabbar!)
    }
    

}


extension RadioFavoriteViewController : HeaderViewDelegate,FavouriteTableViewCellDelegate{
    
       func buttonTapped(buttonIndex: Int){
        
        switch (buttonIndex) {
            
        case LIKEBUTTONTAG : break
            
        case SHAREBUTTONTAG :
            self.showActivityController()
              break
            
        case FAVOURITEBUTTONTAG :
            break
            
        default:
            break
            
            
        }

        
    }
    
    
    func programToSchedule(){
        
        self.showActionSheet()
       
    }
    
    
}
