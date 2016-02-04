//
// Cat2CatUIImage.swift
//
// Generated Automatically Using Cat2Cat
// NOTE: This file is wholly regenerated whenever that utility is run, so any changes made manually will be lost.
//
// For more information, go to http://github.com/vokal/Cat2Cat
//

import UIKit

extension UIImage {

    // MARK: - IMAGES
    
    static func ac_Aquarius() -> UIImage {
        return UIImage(c2cName: Cat2CatImageName.Aquarius)
    }
    
    static func ac_Aries() -> UIImage {
        return UIImage(c2cName: Cat2CatImageName.Aries)
    }
    
    static func ac_Cancer() -> UIImage {
        return UIImage(c2cName: Cat2CatImageName.Cancer)
    }
    
    static func ac_Capricorn() -> UIImage {
        return UIImage(c2cName: Cat2CatImageName.Capricorn)
    }
    
    static func ac_Gemini() -> UIImage {
        return UIImage(c2cName: Cat2CatImageName.Gemini)
    }
    
    static func ac_Leo() -> UIImage {
        return UIImage(c2cName: Cat2CatImageName.Leo)
    }
    
    static func ac_Libra() -> UIImage {
        return UIImage(c2cName: Cat2CatImageName.Libra)
    }
    
    static func ac_Pisces() -> UIImage {
        return UIImage(c2cName: Cat2CatImageName.Pisces)
    }
    
    static func ac_Sagittarius() -> UIImage {
        return UIImage(c2cName: Cat2CatImageName.Sagittarius)
    }
    
    static func ac_Scorpio() -> UIImage {
        return UIImage(c2cName: Cat2CatImageName.Scorpio)
    }
    
    static func ac_Taurus() -> UIImage {
        return UIImage(c2cName: Cat2CatImageName.Taurus)
    }
    
    static func ac_Virgo() -> UIImage {
        return UIImage(c2cName: Cat2CatImageName.Virgo)
    }
    
    // MARK: - Contents.json
    
}

extension UIImage {
    /**
    Initializes using the specified Cat2CatImageName.
    */
    convenience init(c2cName: Cat2CatImageName) {
        self.init(named: c2cName.rawValue)!
    }
}

enum Cat2CatImageName: String {
    case
    // IMAGES
    Aquarius = "Aquarius",
    Aries = "Aries",
    Cancer = "Cancer",
    Capricorn = "Capricorn",
    Gemini = "Gemini",
    Leo = "Leo",
    Libra = "Libra",
    Pisces = "Pisces",
    Sagittarius = "Sagittarius",
    Scorpio = "Scorpio",
    Taurus = "Taurus",
    Virgo = "Virgo"    // Contents.json

}
