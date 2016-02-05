//
//  HoroscopeDetaillViewController.swift
//  AstroloGucci
//
//  Created by Naomi Himley on 2/4/16.
//  Copyright © 2016 Vokal. All rights reserved.
//

import UIKit

class HoroscopeDetaillViewController: UIViewController {

    @IBOutlet weak var signImageView: UIImageView!
    @IBOutlet weak var signAndDateLabel: UILabel!
    @IBOutlet weak var horoscopeTextView: UITextView!

    var zodiacSign : Zodiac?
    override func viewDidLoad() {
        super.viewDidLoad()
        guard let zodiacSign = zodiacSign else {
            return
        }
        signImageView.image = zodiacSign.signImage()
        //TODO: create date formatter to show today's date on the last line
        signAndDateLabel.text = "\(zodiacSign.name()) \n \(zodiacSign.dateSpanOfZodiac()) \n Todays Date"
        
        //TODO: Set horoscopeTextView's text from Gucci Mane lyrics generator once API is exposed
    }
}
