//
//  RadioGeneroViewController.swift
//  Grc2016_iOS
//
//  Created by Kailash on 9/19/16.
//
//

import UIKit

class RadioGeneroViewController: UIViewController,GeneroCollectionViewTopHeaderViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    var headerView : GeneroReusableCollectionView?
    var topHeaderView : GeneroCollectionViewTopHeaderView?

    
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
        
        collectionView?.registerClass(GeneroReusableCollectionView.self,forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                                      withReuseIdentifier: "GeneroReusableCollectionView")
        
        collectionView?.registerClass(GeneroCollectionViewTopHeaderView.self,forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                                      withReuseIdentifier: "GeneroCollectionViewTopHeaderView")
        
        
        collectionView.registerNib(UINib(nibName: "GeneroReusableCollectionView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "GeneroReusableCollectionView")
        
         collectionView.registerNib(UINib(nibName: "GeneroCollectionViewTopHeaderView", bundle: nil), forSupplementaryViewOfKind: UICollectionElementKindSectionHeader, withReuseIdentifier: "GeneroCollectionViewTopHeaderView")
    
        
        
    }
}

extension RadioGeneroViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3
    }
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 5
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
         let cell = collectionView.dequeueReusableCellWithReuseIdentifier("GeneroCollectionViewCell", forIndexPath: indexPath) as! GeneroCollectionViewCell
        
        return cell
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, sizeForItemAtIndexPath indexPath: NSIndexPath) -> CGSize
    {
        if indexPath.section == 0 {
            return CGSizeMake(0,0)
        }
        
       return CGSizeMake(self.view.frame.width * 0.30,150)
        
    }
    
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView{
        
        switch kind {
        case UICollectionElementKindSectionHeader:
            
            if indexPath.section == 0 {
                topHeaderView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader,
                                                                                   withReuseIdentifier:"GeneroCollectionViewTopHeaderView", forIndexPath: indexPath) as?  GeneroCollectionViewTopHeaderView
                
                topHeaderView?.delegate = self
                
                return topHeaderView!
            } else {
                headerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader,
                                                                                   withReuseIdentifier:"GeneroReusableCollectionView", forIndexPath: indexPath) as?  GeneroReusableCollectionView
                
                return headerView!
            }
            
            
            
        default:
            return UICollectionReusableView()
            
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let size : CGSize
        if section == 0 {
            size = CGSize(width: 400, height: 280)

        } else {
            size = CGSize(width: 400, height: 35)

        }
        
        return size
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, insetForSectionAtIndex section: Int) -> UIEdgeInsets {
        
        return UIEdgeInsetsMake(5, (self.view.frame.width * 0.10)/4, (self.view.frame.width * 0.10)/4, 10)
    }
    
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        NSNotificationCenter.defaultCenter().postNotificationName("radioItemTapped", object: indexPath)

        
}
    
    func searchBarTapped() {
        print("called in controlelr ")
    }
}

