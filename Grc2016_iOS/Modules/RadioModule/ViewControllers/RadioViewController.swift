//
//  RadioViewController.swift
//  Grc2016_iOS
//
//  Created by Kailash on 9/14/16.
//
//

import UIKit

class RadioViewController: UIViewController,UIPageViewControllerDataSource {

    
    @IBOutlet weak var collectionView: UICollectionView!
    var controllersArray: Array<UIViewController>?
    var radioPageViewController:UIPageViewController?
    var optionArray = ["Genero","Favorite","Ciudad","Programas"]
    
    var selectedRowIndexPath : NSIndexPath?

    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(RadioViewController.searchBarTapped(_:)), name: "searchBarTapped", object: nil)
        
        NSNotificationCenter.defaultCenter().addObserver(self, selector: #selector(RadioViewController.radioItemTapped(_:)), name: "radioItemTapped", object: nil)


        selectedRowIndexPath = NSIndexPath(forRow: 0,inSection: 0)
        controllersArray = Array()

        // Do any additional setup after loading the view.
        self.navigationItem.title = "Radio"
        
        Utility.configureNavBarThemeing(self,barTintColor: UIColor.whiteColor(),titleColor: UIColor.whiteColor())
        
        radioPageViewController = RadioPageViewController(nibName: "RadioPageViewController", bundle: nil)
        
        radioPageViewController?.dataSource = self
        
        let radioGeneroViewController = RadioGeneroViewController(nibName: "RadioGeneroViewController", bundle: nil)
        controllersArray?.append(radioGeneroViewController)
        
        let radioFavoriteViewController = RadioFavoriteViewController(nibName: "RadioFavoriteViewController", bundle: nil)
        controllersArray?.append(radioFavoriteViewController)

        let radioprogramsViewController = RadioProgramsViewController(nibName: "RadioProgramsViewController", bundle: nil)
        controllersArray?.append(radioprogramsViewController)

        let radioCloudeViewController = RadioCloudViewController(nibName: "RadioCloudViewController", bundle: nil)
        controllersArray?.append(radioCloudeViewController)
        
        radioPageViewController!.setViewControllers([controllersArray![0]] , direction: .Forward, animated: false, completion: nil)
        radioPageViewController!.view.frame = CGRectMake(0, 64, view.frame.size.width, view.frame.size.height);
        
        addChildViewController(radioPageViewController!)
        view.addSubview(radioPageViewController!.view)
        radioPageViewController!.didMoveToParentViewController(self)
        
        self.navigationController?.navigationBar.hidden = true
        self.registerCellNib()
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private func registerCellNib() {
        
        collectionView.registerNib(UINib(nibName: "RadioCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "RadioCollectionViewCell")
    }
    

    
    func leftDrawerButtonPress(sender: AnyObject) {
        //self.evo_drawerController?.toggleLeftDrawerSideAnimated(true, completion: nil)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return optionArray.count
    }
    
    func presentationIndexForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 0
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerBeforeViewController viewController: UIViewController) -> UIViewController?
    {
        let index = controllersArray?.indexOf(viewController)
        
        if (index == 0) || (index == NSNotFound) {
            return nil
        }
        
        return controllersArray![index! - 1]
    }
    
    func pageViewController(pageViewController: UIPageViewController, viewControllerAfterViewController viewController: UIViewController) -> UIViewController?
    {
        let index = controllersArray?.indexOf(viewController)
        if index! == (controllersArray?.count)! - 1 {
            return nil
        }
        
        return controllersArray![index! + 1]
    }
}
    extension RadioViewController: UICollectionViewDelegate, UICollectionViewDataSource {
        
        func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
            return 1
        }
        
        func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
            return 4
        }
        
        func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
            let cell = collectionView.dequeueReusableCellWithReuseIdentifier("RadioCollectionViewCell", forIndexPath: indexPath) as! RadioCollectionViewCell
            
            cell.optionLabel.text = optionArray[indexPath.row]
            
            if selectedRowIndexPath == indexPath {
                cell.optionLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 15.0)

            } else {
                cell.optionLabel.font = UIFont(name:"HelveticaNeue-Regular", size: 15.0)

            }
            
            return cell
        }
        
        func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
        {
//            if indexPath.row == 3 {
//                return CGSizeMake(self.view.frame.width * 0.22 ,50)
//
//            } else {
//                return CGSizeMake(self.view.frame.width * 0.20 ,50)
//
//            }
            
            return CGSizeMake(self.view.frame.width * 0.23 ,50)

            
        }
        
        func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
            
            return UIEdgeInsetsMake(0, 5, 0, 5)
        }
        
        
        
//        func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
//            
//            return UIEdgeInsetsMake(0, (self.view.frame.width * 0.06)/4, (self.view.frame.width * 0.08)/4, 0)
//        }
        
        func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
            
            self.scrollToViewController(index: indexPath.row)
//            let cell = collectionView.cellForItemAtIndexPath(indexPath) as! RadioCollectionViewCell
//            
//           // cell.optionLabel.t
//            cell.optionLabel.font = UIFont(name:"HelveticaNeue-Bold", size: 16.0)
            
            selectedRowIndexPath = indexPath
            collectionView.reloadData()

        }

        
        func scrollToViewController(index newIndex: Int) {
            if let firstViewController = controllersArray?.first,
                let currentIndex = controllersArray!.indexOf(firstViewController) {
                let direction: UIPageViewControllerNavigationDirection = newIndex >= currentIndex ? .Forward : .Reverse
                let nextViewController = controllersArray![newIndex]
                //scrollToViewController(nextViewController, direction: direction)
                
                 radioPageViewController?.setViewControllers([nextViewController], direction: direction, animated: true, completion: nil)
            }
        }
        
        
        func searchBarTapped(notification:NSNotification)
        {
            let searchViewController = SearchViewController(nibName: "SearchViewController", bundle: nil)
            self.navigationController?.pushViewController(searchViewController, animated: false)
        }
        
        
        func radioItemTapped(notification:NSNotification)
        {
            let audioController = AudioPlayerViewController(nibName: "AudioPlayerViewController", bundle: nil)
            self.presentViewController(audioController, animated: true, completion: nil)
        }
    
}
