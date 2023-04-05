//
//  Resources.swift
//  Moviemax
//
//  Created by Лаванда on 05.04.2023.
//

import UIKit

enum Resources {
    enum Fonts {
        static func plusJakartaSansSemiBold(with size:CGFloat) -> UIFont {
            UIFont(name: "PlusJakartaSansRoman-SemiBold", size: size) ?? UIFont()
        }
        static func plusJakartaSansBold(with size:CGFloat) -> UIFont {
            UIFont(name: "PlusJakartaSansRoman-Bold", size: size) ?? UIFont()
        }
        static func plusJakartaSans(with size:CGFloat) -> UIFont {
            UIFont(name: "PlusJakartaSans-Regular", size: size) ?? UIFont()
        }
        static func plusJakartaSansMedium(with size:CGFloat) -> UIFont {
            UIFont(name: "PlusJakartaSansRoman-Medium", size: size) ?? UIFont()
        }
        
        static func montserratMedium(with size:CGFloat) -> UIFont {
            UIFont(name: "MontserratRoman-Medium", size: size) ?? UIFont()
        }
    }
}
