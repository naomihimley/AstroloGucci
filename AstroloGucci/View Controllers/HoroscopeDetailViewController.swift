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
        self.title = "Horoscope of the Day"
        guard let zodiacSign = zodiacSign else {
            return
        }
        signImageView.image = zodiacSign.signImage()

        //Default to showing today's date on initial load
        let todaysDate = NSDate()
        setSignAndDateLabelForDate(todaysDate)
        //TODO: Set horoscopeTextView's text from Gucci Mane lyrics generator once API is exposed
    }

    @IBAction func didSelectDateControl(sender: UISegmentedControl) {
        let selectedDate = ZodiacDates(rawValue: dateSegmentedControl.selectedSegmentIndex)
        let calendar = NSCalendar.currentCalendar()
        switch selectedDate! {
            case .Yesterday:
                //TODO: Display Yesterday's horoscope for zodiacSign
                let yesterdaysDate = calendar.dateByAddingUnit(.Day, value: -1, toDate: NSDate(), options: [])
                setSignAndDateLabelForDate(yesterdaysDate)
            case .Today:
                //TODO: Display Today's horoscope for zodiacSign
                setSignAndDateLabelForDate(NSDate())
            case .Tomorrow:
                //TODO: Display Tomorrow's horoscope for zodiacSign
                let tomorrowsDate = calendar.dateByAddingUnit(.Day, value: 1, toDate: NSDate(), options: [])
                setSignAndDateLabelForDate(tomorrowsDate)
        }
    }
    
    func setSignAndDateLabelForDate(date : NSDate?) {
        guard let zodiacSign = zodiacSign, let date = date else {
            return
        }
        signAndDateLabel.text = "\(zodiacSign.name()) \n\(zodiacSign.dateSpanOfZodiac()) \n\(date.stringMMddyyyyFormat())"
    }
}
