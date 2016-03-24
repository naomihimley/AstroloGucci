//
//  HoroscopeDetaillViewController.swift
//  AstroloGucci
//
//  Created by Naomi Himley on 2/4/16.
//  Copyright © 2016 Vokal. All rights reserved.
//

import UIKit

class HoroscopeDetailViewController: UIViewController {

    @IBOutlet weak var signImageView: UIImageView!
    @IBOutlet weak var signAndDateLabel: UILabel!
    @IBOutlet weak var horoscopeTextView: UITextView!
    @IBOutlet weak var dateSegmentedControl: UISegmentedControl!

    enum ZodiacDates : Int {
        case Yesterday = 0
        case Today
        case Tomorrow
    }

    var zodiacSign : Zodiac?
    override func viewDidLoad() {
        super.viewDidLoad()
        self.title = GucciString.HoroscopeOfTheDay
        guard let zodiacSign = zodiacSign else {
            return
        }
        signImageView.image = zodiacSign.signImage()

        //Default to showing today's date on initial load
        let todaysDate = NSDate()
        setSignAndDateLabelForDate(todaysDate)
        guard let todaysLyric = NSUserDefaults.standardUserDefaults().objectForKey(UserDefaultKey.TodayLyric)
            else {
                horoscopeTextView.text = "Generic Error"
                return
        }
        horoscopeTextView.text = todaysLyric as! String
    }

    @IBAction func didSelectDateControl(sender: UISegmentedControl) {
        let selectedDate = ZodiacDates(rawValue: dateSegmentedControl.selectedSegmentIndex)
        let calendar = NSCalendar.currentCalendar()
        switch selectedDate! {
            case .Yesterday:
                let yesterdaysDate = calendar.dateByAddingUnit(.Day, value: -1, toDate: NSDate(), options: [])
                setSignAndDateLabelForDate(yesterdaysDate)
                guard let yesterdayLyrics = NSUserDefaults.standardUserDefaults().objectForKey(UserDefaultKey.YesterdayLyric)
                    else {
                        horoscopeTextView.text = "Generic Error"
                        break
                    }
                horoscopeTextView.text = yesterdayLyrics as! String
            case .Today:
                setSignAndDateLabelForDate(NSDate())
                guard let todaysLyric = NSUserDefaults.standardUserDefaults().objectForKey(UserDefaultKey.TodayLyric)
                    else {
                        horoscopeTextView.text = "Generic Error"
                        break
                }
                horoscopeTextView.text = todaysLyric as! String
            case .Tomorrow:
                let tomorrowsDate = calendar.dateByAddingUnit(.Day, value: 1, toDate: NSDate(), options: [])
                setSignAndDateLabelForDate(tomorrowsDate)
                guard let tomorrowLyric = NSUserDefaults.standardUserDefaults().objectForKey(UserDefaultKey.TomorrowLyric)
                    else {
                        horoscopeTextView.text = "Generic Error"
                        break
                }
                horoscopeTextView.text = tomorrowLyric as! String
        }
    }
    
    func setSignAndDateLabelForDate(date : NSDate?) {
        guard let zodiacSign = zodiacSign, let date = date else {
            return
        }
        signAndDateLabel.text = "\(zodiacSign.name()) \n\(zodiacSign.dateSpanOfZodiac()) \n\(date.stringMMddyyyyFormat())"
    }
}
