//
//  RadioGeneroViewController.swift
//  Grc2016_iOS
//
//  Created by Kailash on 9/19/16.
//
//

import UIKit

class RadioGeneroViewController: UIViewController {

    @IBOutlet weak var collectionView: UICollectionView!
    var headerView : UICollectionReusableView?
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.registerCellNib()
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private func registerCellNib() {
        
        collectionView.registerNib(UINib(nibName: "GeneroCollectionViewCell", bundle: nil), forCellWithReuseIdentifier: "GeneroCollectionViewCell")
        
        collectionView.registerNib(UINib(nibName: "GeneroReusableCollectionView", bundle: nil), forCellWithReuseIdentifier: "GeneroReusableCollectionView")

    }
}

extension RadioGeneroViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 2
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GeneroCollectionViewCell", forIndexPath: indexPath) as! GeneroCollectionViewCell
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        return CGSizeMake(150,150)

    }
    
//    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
//        if Helpers.CurrentDevice == .Phone {
//            return UIEdgeInsetsMake((self.view.frame.width * 0.10)/2, Constants.NumericConstant.ZERO_CONSTANT, Constants.NumericConstant.ZERO_CONSTANT, Constants.NumericConstant.ZERO_CONSTANT)
//        }
//        else
//        {
//            return UIEdgeInsetsMake((self.view.frame.width * 0.10)/3, self.view.frame.width * 0.035, Constants.NumericConstant.ZERO_CONSTANT, self.view.frame.width * 0.035)
//        }
//    }
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView{
        
        switch kind {
        case UICollectionElementKindSectionHeader:
            
            headerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader,
                                                                               withReuseIdentifier:"GeneroReusableCollectionView", forIndexPath: indexPath) as?  GeneroReusableCollectionView
//            headerView?.delegate = self
//            headerView?.recipeOfDayArray = self.fetchCachedRecipeOfDay()
            
            return headerView!
            
//        case UICollectionElementKindSectionFooter:
//            
//            recipeFooterView  = collectionView.dequeueReusableSupplementaryViewOfKind(kind, withReuseIdentifier: "FOOTERVIEW", forIndexPath: indexPath)
//            
//            recipeFooterView?.backgroundColor = UIColor.clearColor();
//            return recipeFooterView!
            
        default:
            return UICollectionReusableView()
            
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
}
}

