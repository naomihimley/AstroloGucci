//
//  Constants.swift
//  AstroloGucci
//
//  Created by Naomi Himley on 2/4/16.
//  Copyright © 2016 Vokal. All rights reserved.
//


import Foundation
import UIKit

/**
 Enum for the Zodiac symbol
 Original Credit: https://github.com/RichFell/RFZodiacExt
 
 */
public enum Zodiac : Int {
    case Aries
    case Taurus
    case Gemini
    case Cancer
    case Leo
    case Virgo
    case Libra
    case Scorpio
    case Sagittarius
    case Capricorn
    case Aquarius
    case Pisces
    
    /**
     String representation of the Zodiac type
     
     - returns: The String value for the Zodiac type
     */
    public func name() -> String {
        switch self {
        case .Aries: return "Aries"
        case .Taurus: return "Taurus"
        case .Gemini: return "Gemini"
        case .Cancer: return "Cancer"
        case .Leo: return "Leo"
        case .Virgo: return "Virgo"
        case .Libra: return "Libra"
        case .Scorpio: return "Scorpio"
        case .Sagittarius: return "Sagittarius"
        case .Capricorn: return "Capricorn"
        case .Aquarius: return "Aquarius"
        case .Pisces: return "Pisces"
        }
    }

    /**
     Returns UIImage for Zodiac Sign
     */
    public func signImage()-> UIImage {
        switch self {
        case .Aries:
            return UIImage.ac_Aries()
        case .Taurus:
            return UIImage.ac_Taurus()
        case .Gemini:
            return UIImage.ac_Gemini()
        case .Cancer:
            return UIImage.ac_Cancer()
        case .Leo:
            return UIImage.ac_Leo()
        case .Virgo:
            return UIImage.ac_Virgo()
        case .Libra:
            return UIImage.ac_Libra()
        case .Scorpio:
            return UIImage.ac_Scorpio()
        case .Sagittarius:
            return UIImage.ac_Sagittarius()
        case .Capricorn:
            return UIImage.ac_Capricorn()
        case .Aquarius:
            return UIImage.ac_Aquarius()
        case .Pisces:
            return UIImage.ac_Pisces()
        }
    }
    
    /**
     The compatable symbols for the Zodiac type.
     
     - returns: Array of the compatable Zodiac types.
     */
    public func compatableTypes()-> [Zodiac] {
        switch self {
        case .Aries:
            return [.Gemini, .Sagittarius, .Leo, .Aquarius]
        case .Taurus:
            return [.Capricorn, .Pisces, .Virgo, .Cancer]
        case .Gemini:
            return [.Aquarius, .Libra, .Aries, .Leo]
        case .Cancer:
            return [.Pisces, .Taurus, .Scorpio, .Virgo]
        case .Leo:
            return [.Sagittarius, .Aries, .Gemini, .Libra]
        case .Virgo:
            return [.Taurus, .Capricorn, .Cancer]
        case .Libra:
            return [.Gemini, .Aquarius, .Leo, .Sagittarius]
        case .Scorpio:
            return [.Pisces, .Cancer, .Capricorn, .Virgo]
        case .Sagittarius:
            return [.Leo, .Aries, .Libra, .Aquarius]
        case .Capricorn:
            return [.Taurus, .Virgo, .Pisces, .Scorpio]
        case .Aquarius:
            return [.Gemini, .Libra, .Sagittarius, .Aries]
        case .Pisces:
            return [.Cancer, .Scorpio, .Taurus, .Capricorn]
        }
    }
    
    /**
     The symbol for the Zodiac type
     
     - returns: The String symbol for the Zodiac type
     */
    public func symbol()-> String {
        switch self {
        case .Aries:
            return "♈"
        case .Taurus:
            return "♉"
        case .Gemini:
            return "♊"
        case .Cancer:
            return "♋"
        case .Leo:
            return "♌"
        case .Virgo:
            return "♍"
        case .Libra:
            return "♎"
        case .Scorpio:
            return "♏"
        case .Sagittarius:
            return "♐"
        case .Capricorn:
            return "♑"
        case .Aquarius:
            return "♒"
        case .Pisces:
            return "♓"
        }
    }
}