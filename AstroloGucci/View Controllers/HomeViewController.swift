//
//  ViewController.swift
//  AstroloGucci
//
//  Created by Naomi Himley on 2/4/16.
//  Copyright © 2016 Naomi Himley. All rights reserved.
//

import UIKit

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    //TODO: Update to auto generate IB Identifier strings
    let reuseIdentifier = "ZodiacCell"
    
    
    // MARK: - UICollectionViewDataSource protocol
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ZodiacSignCell
        if let signIndex = Zodiac(rawValue: indexPath.row) {
            cell.signImageView.image = signIndex.signImage()
            cell.signLabel.text = signIndex.name()
        }
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    func collectionView(collectionView: UICollectionView, didSelectItemAtIndexPath indexPath: NSIndexPath) {
        //TODO: Push to Horoscope view
    }
}
