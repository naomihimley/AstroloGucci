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

        let todaysDate = NSDate()
        signAndDateLabel.text = "\(zodiacSign.name()) \n\(zodiacSign.dateSpanOfZodiac()) \n\(todaysDate.stringMMddyyyyFormat())"
        //TODO: Set horoscopeTextView's text from Gucci Mane lyrics generator once API is exposed
    }

    @IBAction func didSelectDateControl(sender: UISegmentedControl) {
        let selectedDate = ZodiacDates(rawValue: dateSegmentedControl.selectedSegmentIndex)
        switch selectedDate! {
            case .Yesterday:
                //TODO: Display Yesterday's horoscope for zodiacSign
                DLog("Yesterday")
            case .Today:
                //TODO: Display Today's horoscope for zodiacSign
                DLog("Today")
            case .Tomorrow:
                //TODO: Display Tomorrow's horoscope for zodiacSign
                DLog("Tomorrow")
        }
    }
}
