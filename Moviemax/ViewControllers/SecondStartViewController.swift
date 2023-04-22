//
//  SecondStartViewController.swift
//  Moviemax
//
//  Created by Janibek Voskanyan on 07.04.23.
//

import UIKit

class SecondStartViewController: UIViewController {
    
    private var count = 0
    
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
        imageView.image = UIImage(named: "dotIcon")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = UIColor(named: "BlueButtonColor")
        return imageView
    }()

    private lazy var dotIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dotIcon")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .lightGray
        return imageView
    }()

    private lazy var dotIcon2: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "dotIcon")?.withRenderingMode(.alwaysTemplate)
        imageView.tintColor = .lightGray
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
        label.text = "Lots of favorite movies with trailers and reviews! Top rating recomendations."
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
    
    private lazy var continueButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.setTitle("Continue", for: .normal)
        button.titleLabel?.font = Resources.Fonts.plusJakartaSans(with: 24)
        return button
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
        purpleView.addSubview(continueButton)
        
        
        //Тут вместо создания кнопки сделал, действие при нажатии на label   Xlori
        let continueTapGesture = UITapGestureRecognizer(target: self, action: #selector(loginTapped))
        continueButton.isUserInteractionEnabled = true
        continueButton.addGestureRecognizer(continueTapGesture)
        
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
        continueButton.translatesAutoresizingMaskIntoConstraints = false
        
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
            
            dotAnimationIcon.leftAnchor.constraint(equalTo: whiteView.leftAnchor, constant: 160),
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
            
            continueButton.centerXAnchor.constraint(equalTo: purpleView.centerXAnchor),
            continueButton.centerYAnchor.constraint(equalTo: purpleView.centerYAnchor),
            continueButton.topAnchor.constraint(equalTo: purpleView.topAnchor, constant: 16),
        ])
    }
    
    

    // xlori
    @objc func loginTapped(_ sender: UITapGestureRecognizer) {
        switch count {
        case 0:
            textLabelBold.text = "Search for movies"
            textLabel.text = "All movies in one app! Are you ready to watch the best movies and shows?"
            dotIcon.tintColor = UIColor(named: "BlueButtonColor")
            dotAnimationIcon.tintColor = .lightGray
            count += 1
        case 1:
            textLabelBold.text = "The best in always at hand"
            textLabel.text = "Add your favorite movies to favorites! Easy to search and find what you want to watch."
            continueButton.setTitle("Start", for: .normal)
            dotIcon2.tintColor = UIColor(named: "BlueButtonColor")
            dotIcon.tintColor = .lightGray
            count += 1
        case 2:
            let createVC = CreateAccountVC()
            navigationController?.pushViewController(createVC, animated: true)
        default:
            break
        }
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
}
