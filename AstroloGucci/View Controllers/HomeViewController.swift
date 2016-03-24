//
//  ViewController.swift
//  AstroloGucci
//
//  Created by Naomi Himley on 2/4/16.
//  Copyright © 2016 Naomi Himley. All rights reserved.
//

import UIKit

//TODO: Instead of rewriting the 3 horoscopes each day, save Today's as Yesterdays depending on previous fetch date
//Also need to keep the lyrics associated to a sign, instead of being same for all signs

class HomeViewController: UIViewController, UICollectionViewDataSource, UICollectionViewDelegate {

    @IBOutlet weak var collectionView: UICollectionView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = GucciString.AstroloGucci
        // Set title of backBarButtonItem to an empty string to only show the arrow, no title
        self.navigationItem.backBarButtonItem = UIBarButtonItem.init(title: " ", style: .Plain, target: nil, action: nil)
        
        //On initial home page load, check if we have updated lyrics saved in NSUserDefaults
        if !updatedTodayAlready() {
            fetchThreeNewLyrics(1)
        }
    }
    
    func updatedTodayAlready() -> Bool {
        if let dateLastFetched = NSUserDefaults.standardUserDefaults().objectForKey(UserDefaultKey.DateLastFetched) {
            let calendar = NSCalendar.currentCalendar()
            let todayComponents = calendar.components([.Year, .Month, .Day], fromDate: NSDate())
            let today = calendar.dateFromComponents(todayComponents)
            
            let lastFetchedComponents = calendar.components([.Year, .Month, .Day], fromDate: dateLastFetched as! NSDate)
            let lastFetchedDate = calendar.dateFromComponents(lastFetchedComponents)
            
            if (today!.isEqualToDate(lastFetchedDate!)) {
                return true
            } else {
                return false
            }
        } else {
            // Could not get fetched date from NSUserDefaults, return false to fetch new lyrics
            return false
        }
    }

    func fetchThreeNewLyrics(index : Int) {
        NetworkingUtility.fetchOneGucciLyric { (result) in
            //Successful fetch, update NSUserDefaults to reflect newest fetch date.
            NSUserDefaults.standardUserDefaults().setObject(NSDate(), forKey: UserDefaultKey.DateLastFetched)
            if result.count > 1 {
                //When a fetch is unsuccessful result.count is 1, just the error
                //Any successful fetch should have a count of 2
                self.concatenateAndSetLyricsInUserDefaults(result, lyricNumber: index)
                if index < 3 {
                    self.fetchThreeNewLyrics(index+1)
                }
            } else {
                //Fetch was unsuccessful, do not update index, just fetch again with same index
                self.fetchThreeNewLyrics(index)
            }
        }
    }
    
    func concatenateAndSetLyricsInUserDefaults(results : [String : AnyObject], lyricNumber : Int) {
        let firstLineString = results[NetworkingConstant.APIKeywordFirstLine] as! String
        let secondLineString = results[NetworkingConstant.APIKeywordSecondLine] as! String
        let finalLyric = firstLineString + "\n" + secondLineString
        switch lyricNumber {
        case 1:
            NSUserDefaults.standardUserDefaults().setObject(finalLyric, forKey: UserDefaultKey.YesterdayLyric)
        case 2:
            NSUserDefaults.standardUserDefaults().setObject(finalLyric, forKey: UserDefaultKey.TodayLyric)
        case 3:
            NSUserDefaults.standardUserDefaults().setObject(finalLyric, forKey: UserDefaultKey.TomorrowLyric)
        default:
            assert(false, "Unexpected number of lyrics fetched, expecting 3 total")
        }
    }
    
    // MARK: - UICollectionViewDataSource protocol
    
    func collectionView(collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return 12;
    }
    
    func collectionView(collectionView: UICollectionView, cellForItemAtIndexPath indexPath: NSIndexPath) -> UICollectionViewCell {
        
        let cell = collectionView.dequeueReusableCellWithReuseIdentifier(StoryboardIdentifier.reuseIdentifier, forIndexPath: indexPath) as! ZodiacSignCell
        if let signFromIndex = Zodiac(rawValue: indexPath.row) {
            cell.signImageView.image = signFromIndex.signImage()
            cell.signLabel.text = signFromIndex.name()
        }
        
        return cell
    }
    
    // MARK: - UICollectionViewDelegate protocol
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if segue.identifier == StoryboardIdentifier.horoscopeDetailSegueID {
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
