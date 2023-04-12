//
//  SecondStartViewController.swift
//  Moviemax
//
//  Created by Janibek Voskanyan on 07.04.23.
//

import UIKit

class SecondStartViewController: UIViewController {
    
    private lazy var girlIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "girlIcon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var ballsIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "ballsIcon")
        imageView.contentMode = .scaleAspectFit
        return imageView
    }()
    
    private lazy var whiteView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 16
        view.backgroundColor = .white
        return view
    }()
    
    //MARK: FIX
    private lazy var dotAnimationIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dotAnimationIcon")
        return imageView
    }()

    private lazy var dotIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dotIcon")
        return imageView
    }()

    private lazy var dotIcon2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dotIcon")
        return imageView
    }()
    private lazy var textLabelBold: UILabel = {
        let label = UILabel()
        label.textColor = .black
        label.text = "Watch your favorite movie easily"
        label.font = Resources.Fonts.plusJakartaSansBold(with: 24)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var textLabel: UILabel = {
        let label = UILabel()
        label.textColor = UIColor(named: "grayTextColor")
        label.text = "Semper in cursus magna et eu varius nunc adipiscing. Elementum justo, laoreet id sem."
        label.font = Resources.Fonts.plusJakartaSans(with: 14)
        label.numberOfLines = 0
        label.textAlignment = .center
        return label
    }()
    
    private lazy var purpleView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 24
        view.backgroundColor = UIColor(named: "BlueButtonColor")
        return view
    }()
    
    private lazy var continueLabel: UILabel = {
        let label = UILabel()
        label.textColor = .white
        label.text = "Continue"
        label.font = Resources.Fonts.plusJakartaSans(with: 24)
        return label
    }()
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "PurpleBackGroundColor")
        addViews()
        setConstraints()
    }
    
    private func addViews() {
        view.addSubview(ballsIcon)
        ballsIcon.addSubview(girlIcon)
        view.addSubview(whiteView)
        whiteView.addSubview(dotAnimationIcon)
        whiteView.addSubview(dotIcon)
        whiteView.addSubview(dotIcon2)
        whiteView.addSubview(textLabelBold)
        whiteView.addSubview(textLabel)
        whiteView.addSubview(purpleView)
        purpleView.addSubview(continueLabel)
        
    }
    
    private func setConstraints() {
        girlIcon.translatesAutoresizingMaskIntoConstraints = false
        ballsIcon.translatesAutoresizingMaskIntoConstraints = false
        whiteView.translatesAutoresizingMaskIntoConstraints = false
        dotAnimationIcon.translatesAutoresizingMaskIntoConstraints = false
        dotIcon.translatesAutoresizingMaskIntoConstraints = false
        dotIcon2.translatesAutoresizingMaskIntoConstraints = false
        textLabelBold.translatesAutoresizingMaskIntoConstraints = false
        textLabel.translatesAutoresizingMaskIntoConstraints = false
        purpleView.translatesAutoresizingMaskIntoConstraints = false
        continueLabel.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            girlIcon.heightAnchor.constraint(equalToConstant: 408),
            girlIcon.widthAnchor.constraint(equalToConstant: 612),
            girlIcon.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: -118),
            girlIcon.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: 119),
            girlIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 30),
            
            
            ballsIcon.leadingAnchor.constraint(equalTo: girlIcon.leadingAnchor, constant: 142),
            ballsIcon.trailingAnchor.constraint(equalTo: girlIcon.trailingAnchor, constant: -149),
            ballsIcon.topAnchor.constraint(equalTo: girlIcon.topAnchor, constant: 25),
            
//            whiteView.widthAnchor.constraint(equalToConstant: 332),
//            whiteView.heightAnchor.constraint(equalToConstant: 325),
            whiteView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            whiteView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            whiteView.topAnchor.constraint(equalTo: girlIcon.bottomAnchor, constant: 0),
            whiteView.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -46),
            
            dotAnimationIcon.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 136),
            dotAnimationIcon.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 28),

            dotIcon.leftAnchor.constraint(equalTo: dotAnimationIcon.rightAnchor, constant: 8),
            dotIcon.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 28),
            
            dotIcon2.leftAnchor.constraint(equalTo: dotIcon.rightAnchor, constant: 8),
            dotIcon2.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 28),
            
            textLabelBold.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 28),
            textLabelBold.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -27),
            textLabelBold.topAnchor.constraint(equalTo: whiteView.topAnchor, constant: 55),
            
            textLabel.heightAnchor.constraint(equalToConstant: 85),
            textLabel.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 24),
            textLabel.rightAnchor.constraint(equalTo: whiteView.rightAnchor, constant: -29),
//            textLabel.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor),
            textLabel.topAnchor.constraint(equalTo: textLabelBold.bottomAnchor, constant: 12),
            
            
            purpleView.heightAnchor.constraint(equalToConstant: 56),
            purpleView.widthAnchor.constraint(equalToConstant: 200),
            purpleView.centerXAnchor.constraint(equalTo: whiteView.centerXAnchor),
            purpleView.bottomAnchor.constraint(equalTo: whiteView.bottomAnchor, constant: -28),
            
            continueLabel.centerXAnchor.constraint(equalTo: purpleView.centerXAnchor),
            continueLabel.centerYAnchor.constraint(equalTo: purpleView.centerYAnchor),
            continueLabel.topAnchor.constraint(equalTo: purpleView.topAnchor, constant: 16),
        ])
    }
}
