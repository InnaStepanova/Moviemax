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
        label.font = UIFont.systemFont(ofSize: 18, weight: .bold)
        label.textColor = UIColor.black
        return label
    }
    
    static var signBigLabel: UILabel {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = UIColor.black
        return label
    }
    
    static var hintLabel: UILabel {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor.black
        label.alpha = 0.9
        return label
    }
    
    static var signLowLabel: UILabel {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 14, weight: .regular)
        label.textColor = UIColor.gray
        return label
    }
    
    
}

