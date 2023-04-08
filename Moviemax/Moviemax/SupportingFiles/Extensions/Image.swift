//
//  Image.swift
//  Moviemax
//
//  Created by Николай on 05.04.2023.
//

import Foundation
import UIKit

extension UIImageView {
    
    static var dateImage: UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: "date")
        return image
    }
    static var genreImage: UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: "movie")
        return image
    }
    
    static var timeImage: UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: "time")
        return image
    }
    
    static var starImage: UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: "star")
        return image
    }
    
}
