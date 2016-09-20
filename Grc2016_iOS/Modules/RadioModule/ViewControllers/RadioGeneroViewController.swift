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
        
        collectionView?.registerClass(GeneroReusableCollectionView.self,forSupplementaryViewOfKind: UICollectionElementKindSectionHeader,
                                      withReuseIdentifier: "GeneroReusableCollectionView")
    }
}

extension RadioGeneroViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func numberOfSectionsInCollectionView(collectionView: UICollectionView) -> Int {
        return 3
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
        if indexPath.section == 0 {
            return CGSizeMake(0,0)

        }
        
        return CGSizeMake(150,150)

    }
    
    
    func collectionView(collectionView: UICollectionView, viewForSupplementaryElementOfKind kind: String, atIndexPath indexPath: NSIndexPath) -> UICollectionReusableView{
        
        switch kind {
        case UICollectionElementKindSectionHeader:
            
            
            headerView = collectionView.dequeueReusableSupplementaryViewOfKind(UICollectionElementKindSectionHeader,
                                                                               withReuseIdentifier:"GeneroReusableCollectionView", forIndexPath: indexPath) as?  GeneroReusableCollectionView
            
            headerView?.backgroundColor = UIColor.redColor()
            return headerView!
            
        default:
            return UICollectionReusableView()
            
        }
        
    }
    
    func collectionView(collectionView: UICollectionView, layout collectionViewLayout: UICollectionViewLayout, referenceSizeForHeaderInSection section: Int) -> CGSize {
        let size : CGSize
        if section == 0 {
            size = CGSize(width: 400, height: 300)

        } else {
            size = CGSize(width: 400, height: 50)

        }
        
        return size
    }
    
    
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        
}
}

