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
    let horoscopeDetailSegueID = "horoscopeDetailSegueIdentifier"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = "Gucci"
        // Set title of backBarButtonItem to an empty string to only show the arrow, no title
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: " ", style: .Plain, target: nil, action: nil)
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(reuseIdentifier, forIndexPath: indexPath) as! ZodiacSignCell
        if let signFromIndex = Zodiac(rawValue: indexPath.row) {
            cell.signImageView.image = signFromIndex.signImage()
            cell.signLabel.text = signFromIndex.name()
        }
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == horoscopeDetailSegueID {
            let horoscopeDetailVC = segue.destinationViewController as! HoroscopeDetailViewController
            if sender!.isKindOfClass(ZodiacSignCell) {
                let cell = sender as! ZodiacSignCell
                let indexPath = self.collectionView!.indexPathForCell(cell)
                if let signFromIndex = Zodiac(rawValue: indexPath!.row) {
                    horoscopeDetailVC.zodiacSign = signFromIndex
                }
            }
        }
    }
}
