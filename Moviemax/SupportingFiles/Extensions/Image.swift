//
//  Image.swift
//  Moviemax
//
//  Created by Николай on 05.04.2023.
//
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
    
    static var star1: UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: "star1")
        return image
    }
    
    static var stars2: UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: "2stars")
        return image
    }
    
    static var stars3: UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: "3stars")
        return image
    }
    
    static var stars4: UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: "4stars")
        return image
    }
    
    static var star5: UIImageView {
        let image = UIImageView()
        image.image = UIImage(named: "5stars")
        return image
    }
    
}

