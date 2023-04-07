//
//  UiLabelText.swift
//  Moviemax
//
//  Created by user on 3.04.23.
//

import Foundation
import UIKit

extension UILabel {
    static var signTopLabel: UILabel {
        let label = UILabel(frame: .zero)
        label.font = Resources.Fonts.plusJakartaSansBold(with: 18)
        label.textColor = UIColor(named: "BlackWhite")
        return label
    }
    
    static var signBigLabel: UILabel {
        let label = UILabel(frame: .zero)
        label.font = Resources.Fonts.plusJakartaSansBold(with: 24)
        label.textColor = UIColor(named: "BlackWhite")
        return label
    }
    
    static var hintLabel: UILabel {
        let label = UILabel(frame: .zero)
        label.font = Resources.Fonts.plusJakartaSansMedium(with: 16)
        label.textColor = UIColor(named: "BlackWhite")
        label.alpha = 0.9
        return label
    }
    
    static var signLowLabel: UILabel {
        let label = UILabel(frame: .zero)
        label.font = Resources.Fonts.plusJakartaSans(with: 14)
        label.textColor = UIColor(named: "GreyWhiteTextColor")
        return label
    }
    
    
}

