//
//  RadioStationProfileViewController.swift
//  Grc2016_iOS
//
//  Created by DeepakDhanaie on 21/09/16.
//
//

import UIKit

class RadioStationProfileViewController: UIViewController,UIActionSheetDelegate {
    
    // MARK: Outlet properties
    @IBOutlet weak var stationProfileTableView: UITableView?
    
    var headerView : HeaderView?


    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.registerHeaderView()
        headerView?.configureView(true)
        stationProfileTableView?.tableHeaderView = headerView
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func registerHeaderView(){
        
        let nib:NSArray=NSBundle.mainBundle().loadNibNamed("HeaderView", owner: self, options: nil)
        
        headerView = nib.objectAtIndex(0) as? HeaderView
        
        print(headerView?.frame)
         headerView?.delegate = self
        
        self.stationProfileTableView?.tableHeaderView?.frame = CGRectMake(0,0,self.view.frame.size.width,201)
        
        self.stationProfileTableView?.tableHeaderView = self.stationProfileTableView?.tableHeaderView;
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
        
        var stationTableViewCell = tableView.dequeueReusableCellWithIdentifier("StationProfileTableViewCell") as? StationProfileTableViewCell
        
        if(stationTableViewCell == nil){
            let nib:NSArray=NSBundle.mainBundle().loadNibNamed("StationProfileTableViewCell", owner: self, options: nil)
            
            stationTableViewCell = nib.objectAtIndex(0) as? StationProfileTableViewCell
        }
        
//        favouriteTableViewCell?.delegate = self
        //favouriteTableViewCell?.configureCell(nil, isEditing:(favouriteTableView?.editing)!)
        
        
        return stationTableViewCell!
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
        
        let titlelabel = UILabel(frame: CGRectMake(10, 14,200, 14))
        
        titlelabel.textColor = UIColor(red:231.0/255.0, green:44.0/255.0, blue:40.0/255.0, alpha: 1.0)
        
        titlelabel.font = UIFont(name: "HelveticaNeue", size: 13.0)
        
        titlelabel.text = "Continua"
        
        tempView.addSubview(titlelabel)
    
        
        return tempView
    }
    
    
    
    func tableView(tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        if section == 0 {
            return 39
        }
        return tableView.sectionHeaderHeight
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

extension RadioStationProfileViewController : HeaderViewDelegate{
    
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

