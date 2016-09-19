//
//  RadioViewController.swift
//  Grc2016_iOS
//
//  Created by Kailash on 9/14/16.
//
//

import UIKit

class RadioViewController: UIViewController,UIPageViewControllerDataSource {

    var controllersArray: Array<UIViewController>?
    var radioPageViewController:UIPageViewController?
    override func viewDidLoad() {
        super.viewDidLoad()
        
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
        radioPageViewController!.view.frame = CGRectMake(0, 0, view.frame.size.width, view.frame.size.height);
        
        addChildViewController(radioPageViewController!)
        view.addSubview(radioPageViewController!.view)
        radioPageViewController!.didMoveToParentViewController(self)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func configureLeftNavBarButton() {
        let leftMenuButton = UIBarButtonItem(image: UIImage(named: "MenuIcon"), style: UIBarButtonItemStyle.Done, target: self, action: #selector(RadioViewController.leftDrawerButtonPress(_:)))
        self.navigationItem.leftBarButtonItem = leftMenuButton
        
        //self.navigationController?.navigationItem.appearance().barTintColor = UIColor.whiteColor()
        
        UINavigationBar.appearance().barTintColor = UIColor.whiteColor()
        UINavigationBar.appearance().tintColor = UIColor.whiteColor()



    }
    
    func leftDrawerButtonPress(sender: AnyObject) {
        self.evo_drawerController?.toggleLeftDrawerSideAnimated(true, completion: nil)
    }
    
    func presentationCountForPageViewController(pageViewController: UIPageViewController) -> Int
    {
        return 4
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
