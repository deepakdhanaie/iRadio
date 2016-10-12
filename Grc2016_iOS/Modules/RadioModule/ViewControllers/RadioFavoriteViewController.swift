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
    
    var sectionArray = [AnyObject]()
    
    var editButton : UIButton?
    
    var isEditFirst : Bool?
    
    

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        
        self.registerHeaderView()
       
        headerView?.configureView(false)
        favouriteTableView?.tableHeaderView = headerView
        isEditFirst = true
        
        self.configureArray()
        //self.setupConstraints()
    }
    
    
    func configureArray(){
    
        for var i = 1; i<=5; i++ {
            let responsedictionary =   Utility.configureRadioData()
            let favuorite = Favourite(responseDictionary:responsedictionary as! [String : AnyObject])
            sectionArray.append(favuorite)
        }
    
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    
    func registerHeaderView(){
    
        let nib:NSArray=NSBundle.mainBundle().loadNibNamed("HeaderView", owner: self, options: nil)
        
        headerView = nib.objectAtIndex(0) as? HeaderView
        
        print(headerView?.frame)
        
         headerView?.frame = CGRectMake(0,0,self.view.frame.size.width,153)
        
        self.favouriteTableView?.tableHeaderView = headerView
        
        
    }
    
    
    
    //***********************************************************************
    // MARK:
    // MARK: - Table view datasource
    // MARK:
    //***********************************************************************
    
     func numberOfSectionsInTableView(tableView: UITableView) -> Int{
        
         return 2
    }

    
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int{
        return 5
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
    
    

    
    // Override to support rearranging the table view.
     func tableView(tableView: UITableView, moveRowAtIndexPath fromIndexPath: NSIndexPath, toIndexPath: NSIndexPath) {
        
        let itemToMove = sectionArray[fromIndexPath.row]
        sectionArray.removeAtIndex(fromIndexPath.row)
        sectionArray.insert(itemToMove, atIndex: toIndexPath.row)
    }
    

    
    func tableView(tableView: UITableView, targetIndexPathForMoveFromRowAtIndexPath sourceIndexPath: NSIndexPath, toProposedIndexPath proposedDestinationIndexPath: NSIndexPath) -> NSIndexPath{
        
        if(sourceIndexPath.section != proposedDestinationIndexPath.section){
            var row = 0
            if(sourceIndexPath.section < proposedDestinationIndexPath.section){
                row = tableView.numberOfRowsInSection(sourceIndexPath.section)-1
            }
            
            return NSIndexPath(forRow: row, inSection: sourceIndexPath.section)
        }
        return proposedDestinationIndexPath
        
    }
    
    
    // Override to support conditional rearranging of the table view.
     func tableView(tableView: UITableView, canMoveRowAtIndexPath indexPath: NSIndexPath) -> Bool {
        return true;
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
        
        if(section == 0){
           titlelabel.text = "Radio"
        }
        else{
           titlelabel.text = "On-Demand"
        }
    
        tempView.addSubview(titlelabel)

        
        if(isEditFirst == true){
            editButton = UIButton(frame: CGRectMake(self.view.frame.size.width - (40 + 15), 15,50, 16))
            editButton!.setTitle("Editor", forState: .Normal)
            isEditFirst = false
        }
    
        
        editButton?.titleLabel?.font = UIFont(name: "HelveticaNeue", size: 11.0)
        
        editButton!.setTitleColor(UIColor(red:206.0/255.0, green:206.0/255.0, blue:206.0/255.0, alpha: 1.0), forState: .Normal)
        
        editButton!.addTarget(self, action: "editSongList", forControlEvents: .TouchUpInside)
        if( section == 0){
        tempView.addSubview(editButton!)
        }
        
    
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
    
       
    
    func showActionSheet(){
        let actionSheet = UIActionSheet(title: "Choose Option", delegate: self, cancelButtonTitle: "Cancel", destructiveButtonTitle: nil, otherButtonTitles: "Save", "Delete")
        let tabbar =   self.tabBarController?.tabBar
        actionSheet.showFromTabBar(tabbar!)
    }
    
    private func setupConstraints(){
        let tableHeaderView =   self.favouriteTableView?.tableHeaderView
        
        headerView!.translatesAutoresizingMaskIntoConstraints = false
        
        tableHeaderView!.addConstraints([NSLayoutConstraint(item: headerView!, attribute:
            NSLayoutAttribute.Leading, relatedBy: NSLayoutRelation.Equal, toItem: tableHeaderView, attribute:NSLayoutAttribute.Leading, multiplier: 1.0, constant:0.0),
            
            NSLayoutConstraint(item: headerView!, attribute: NSLayoutAttribute.Trailing, relatedBy: NSLayoutRelation.Equal, toItem: tableHeaderView, attribute: NSLayoutAttribute.Trailing, multiplier: 1.0, constant: 0.0),
            
            NSLayoutConstraint(item: headerView!, attribute: NSLayoutAttribute.Top, relatedBy: NSLayoutRelation.Equal, toItem: tableHeaderView, attribute: NSLayoutAttribute.Top, multiplier: 1.0, constant: 0),
            
             NSLayoutConstraint(item: headerView!, attribute: NSLayoutAttribute.Height, relatedBy: NSLayoutRelation.Equal, toItem: tableHeaderView, attribute: NSLayoutAttribute.Height, multiplier: 1.0, constant: 182)])
        
         self.favouriteTableView?.layoutIfNeeded()
        
    }

    

}


extension RadioFavoriteViewController :FavouriteTableViewCellDelegate{

    func programToSchedule(){
        
        self.showActionSheet()
       
    }
    
    
}
