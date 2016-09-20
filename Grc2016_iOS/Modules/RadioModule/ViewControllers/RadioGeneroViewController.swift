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
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    private func registerCellNib() {
        
        collectionView.registerNib(UINib(nibName: "GTVLoadingCell", bundle: nil), forCellWithReuseIdentifier: "")
    }
    
    

}

extension RadioGeneroViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 1
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
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
}
}

