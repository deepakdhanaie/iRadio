//
//  CreateAccountViewController.swift
//  Grc2016_iOS
//
//  Created by Rahul on 9/9/16.
//
//

import UIKit

class CreateAccountViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func facebookButtonTapped(sender: AnyObject) {
    }
    
    
    @IBAction func twitterButtonTapped(sender: AnyObject) {
    }
    
    @IBAction func googlePlusButtonTapped(sender: AnyObject) {
    }
    
    @IBAction func omitirButtonTapped(sender: AnyObject) {
        self.configureTabBarController()
    }
    
    func configureTabBarController() {
        let tabBarController = UITabBarController()
            tabBarController.tabBar.backgroundColor = UIColor.whiteColor()
        
        let radioViewController = RadioViewController(nibName: "RadioViewController", bundle: nil)
        
        let radioNavigationViewController = UINavigationController(rootViewController: radioViewController)
        
        
        let onDemandViewController = OnDemandViewController(nibName: "OnDemandViewController", bundle: nil)
        
        let onDemandNavigationViewController = UINavigationController(rootViewController: onDemandViewController)
        
        
        let enterateViewController = EnterateViewController(nibName: "EnterateViewController", bundle: nil)
        let enterateNavigationViewController = UINavigationController(rootViewController: enterateViewController)
        
        
        let destertadorViewController = DestertadorViewController(nibName: "DestertadorViewController", bundle: nil)
        let destertadorNavigationViewController = UINavigationController(rootViewController: destertadorViewController)
        
        
        let ajusteViewController = AjusteViewController(nibName: "AjusteViewController", bundle: nil)
        let adusterNavigationViewController = UINavigationController(rootViewController: ajusteViewController)
        
        
        let controllers = [radioNavigationViewController,onDemandNavigationViewController,enterateNavigationViewController,destertadorNavigationViewController,adusterNavigationViewController]
        tabBarController.viewControllers = controllers
        
        let radioTabBarIconImage = UIImage(named: "Estaciones")
        let onDemandTabBarIconImage = UIImage(named: "Ondemand")
        let enterateTabBarIconImage = UIImage(named: "Personalizar")
        let destertadorTabBarIconImage = UIImage(named: "Despertador")
        let ajusteTabBarIconImage = UIImage(named: "Enterate")
        
        
        radioViewController.tabBarItem = UITabBarItem(
            title: "",
            image: radioTabBarIconImage,
            tag: 1)
        onDemandViewController.tabBarItem = UITabBarItem(
            title: "",
            image: onDemandTabBarIconImage,
            tag:2)
        enterateViewController.tabBarItem = UITabBarItem(
            title: "",
            image: enterateTabBarIconImage,
            tag:2)
        destertadorViewController.tabBarItem = UITabBarItem(
            title: "",
            image: destertadorTabBarIconImage,
            tag:2)
        ajusteViewController.tabBarItem = UITabBarItem(
            title: "",
            image: ajusteTabBarIconImage,
            tag:2)
        
        
        let menuViewController = MenuViewController(nibName: "MenuViewController", bundle: nil)
        let menuNavigationViewController = UINavigationController(rootViewController: menuViewController)
        
//        let drawerCon = DrawerController(centerViewController: tabBarController, leftDrawerViewController: menuNavigationViewController)
//        
//        drawerCon.openDrawerGestureModeMask = OpenDrawerGestureMode.BezelPanningCenterView
//        drawerCon.closeDrawerGestureModeMask = CloseDrawerGestureMode.PanningCenterView
        
        
        let appDelegate = UIApplication.sharedApplication().delegate as! AppDelegate
        
        appDelegate.window?.rootViewController = tabBarController
    }

}
