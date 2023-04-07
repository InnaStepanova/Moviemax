//
//  StartViewController.swift
//  Moviemax
//
//  Created by Janibek Voskanyan on 05.04.23.
//

import UIKit

class StartViewController: UIViewController {
    
    private lazy var movieIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "movieIcon")
        return imageView
    }()
    
    private lazy var moviemaxLabel: UILabel = {
        let label = UILabel()
        label.text = "Moviemax"
        label.textColor = .white
        label.font = Resources.Fonts.plusJakartaSansSemiBold(with: 32)
        return label
    }()
    
    private lazy var roundView: UIView = {
        let view = UIView()
        view.layer.cornerRadius = 44
        view.backgroundColor = UIColor(red: 1, green: 1, blue: 1, alpha: 0.2)
        return view
    }()
    
    private lazy var loadingIcon: UIImageView = {
        let imageView = UIImageView()
        imageView.image = UIImage(named: "Loading")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = UIColor(named: "PurpleBackGroundColor")
        addViews()
        setConstraints()
        
    }
    
    private func addViews() {
        roundView.addSubview(movieIcon)
        view.addSubview(roundView)
        view.addSubview(moviemaxLabel)
        view.addSubview(loadingIcon)
    }
    
    private func setConstraints() {
        movieIcon.translatesAutoresizingMaskIntoConstraints = false
        roundView.translatesAutoresizingMaskIntoConstraints = false
        moviemaxLabel.translatesAutoresizingMaskIntoConstraints = false
        loadingIcon.translatesAutoresizingMaskIntoConstraints = false
        
        NSLayoutConstraint.activate([
            roundView.heightAnchor.constraint(equalToConstant: 88),
            roundView.widthAnchor.constraint(equalToConstant: 88),
            roundView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            roundView.topAnchor.constraint(equalTo: view.topAnchor, constant: 268),
            
            moviemaxLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            moviemaxLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 380),
            
            movieIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            movieIcon.topAnchor.constraint(equalTo: view.topAnchor, constant: 289),
            
            loadingIcon.heightAnchor.constraint(equalToConstant: 70),
            loadingIcon.widthAnchor.constraint(equalToConstant: 70),
            loadingIcon.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            loadingIcon.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -74),
        ])
    }
}
