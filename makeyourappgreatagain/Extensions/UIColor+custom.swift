//
//  UIColor+custom.swift
//  makeyourappgreatagain
//
//  Created by Aleksander Lorenc on 20/09/2017.
//

import Foundation
import UIKit

protocol CustomColors {
    static var customRed: UIColor { get }
    static var customGray: UIColor { get }
    static var customDarkGray: UIColor { get }
}

extension UIColor: CustomColors {
    static var customRed: UIColor {
        return UIColor(red: 229.0/255.0, green: 25.0/255.0, blue: 61.0/255.0, alpha: 1)
    }

    static var customGray: UIColor {
        return UIColor(red: 54.0/255.0, green: 60.0/255.0, blue: 71.0/255.0, alpha: 1)
    }

    static var customDarkGray: UIColor {
        return UIColor(red: 37.0/255, green: 42.0/255, blue: 52/255.0, alpha: 1)
    }
}
