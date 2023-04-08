//
//  CreateAccountVC.swift
//  Moviemax
//
//  Created by user on 4.04.23.
//

import UIKit

class CreateAccountVC : UIViewController {
    
    var topViewLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = Resources.Fonts.plusJakartaSansBold(with: 24)
        label.textColor = UIColor.white
        label.text = "Create Account"
        return label
    }()
    
    private var topViewLowLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = Resources.Fonts.plusJakartaSans(with: 16)
        label.textColor = UIColor.white
        label.text = "Lorem ipsum dolor sit amet"
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = Resources.Fonts.plusJakartaSans(with: 16)
        label.textColor = UIColor.gray
        label.text = "Email"
        return label
    }()
    
    private lazy var midleHint: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = Resources.Fonts.plusJakartaSans(with: 14)
        label.textColor = UIColor(named: "GreyWhiteTextColor")
        label.text = "———  Or continue with  ———"
        return label
    }()
    
    private lazy var lowHintLoginLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = Resources.Fonts.plusJakartaSans(with: 16)
        label.textColor = UIColor(named: "GreyWhiteTextColor")
        label.text = "Already have an account?"
        return label
    }()
    
    private lazy var loginLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = Resources.Fonts.plusJakartaSans(with: 16)
        label.textColor = UIColor.systemBlue
        label.text = "Login"
        return label
    }()
    
    private lazy var emailTextField : UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(named: "LightBlueTextField")
        textField.placeholder = "Enter your email address"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "BorderTextFieldColor")?.cgColor
        textField.layer.cornerRadius = 28
        textField.isSecureTextEntry = true
        return textField
    }()
    
    private lazy var continueEmailButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Resources.Fonts.plusJakartaSansSemiBold(with: 16)
        button.setTitle("Continue with Email", for: .normal)
        button.backgroundColor = UIColor(named: "BlueButtonColor")
        button.layer.cornerRadius = 28
        button.addTarget(self, action: #selector(continueEmailButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var continueGmailButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(UIColor(named: "BlackWhite"), for: .normal)
        button.titleLabel?.font = Resources.Fonts.plusJakartaSansSemiBold(with: 16)
        button.setTitle("Continue with Google", for: .normal)
        button.backgroundColor = UIColor(named: "BackgroundColor")
        button.layer.borderColor = UIColor(named: "BlackWhite")?.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 28
        button.addTarget(self, action: #selector(continueGmailButtonPressed), for: .touchUpInside)
        return button
    }()
    
    var additionalView : UIView = {
        let newView = UIView(frame: CGRect(x: 0, y: 198, width: 200, height: 200))
        newView.backgroundColor = UIColor(named: "BackgroundColor")
        newView.layer.cornerRadius = 30
        return newView
    }()
    let gmailButtomImageView : UIImageView = {
        let imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30 , height: 30))
        imageView.contentMode = .scaleAspectFit
        imageView.image = UIImage(named: "GmailImage")
        return imageView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    func setupView() {
        view.backgroundColor = UIColor(named: "PurpleBackGroundColor")
        
        emailTextField.paddingLeft(10)
        
        // задаём размер additionalView согласно размеру экрана
        let screenSize = UIScreen.main.bounds.size
        additionalView.frame.size.width = screenSize.width
        additionalView.frame.size.height = screenSize.height
        
        //Тут вместо создания кнопки сделал, действие при нажатии на label
        let loginTapGesture = UITapGestureRecognizer(target: self, action: #selector(loginTapped))
        loginLabel.isUserInteractionEnabled = true
        loginLabel.addGestureRecognizer(loginTapGesture)
        
        view.addSubview(topViewLabel)
        view.addSubview(topViewLowLabel)
        view.addSubview(additionalView)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(continueEmailButton)
        view.addSubview(midleHint)
        view.addSubview(continueGmailButton)
        view.addSubview(lowHintLoginLabel)
        view.addSubview(loginLabel)
        view.addSubview(gmailButtomImageView)
        
        setConstraints()
    }
    
    private func setConstraints() {
        topViewLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topViewLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 74),
            topViewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        topViewLowLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topViewLowLabel.topAnchor.constraint(equalTo: topViewLabel.bottomAnchor, constant: 8),
            topViewLowLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        emailLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailLabel.topAnchor.constraint(equalTo: additionalView.topAnchor, constant: 47),
            emailLabel.leadingAnchor.constraint(equalTo: additionalView.leadingAnchor, constant: 24)
        ])
        emailTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: 8),
            emailTextField.leadingAnchor.constraint(equalTo: additionalView.leadingAnchor, constant: 24),
            emailTextField.trailingAnchor.constraint(equalTo: additionalView.trailingAnchor, constant: -24),
            emailTextField.heightAnchor.constraint(equalToConstant: 52)
        ])
        continueEmailButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            continueEmailButton.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 32),
            continueEmailButton.leadingAnchor.constraint(equalTo: additionalView.leadingAnchor, constant: 24),
            continueEmailButton.trailingAnchor.constraint(equalTo: additionalView.trailingAnchor, constant: -24),
            continueEmailButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        midleHint.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            midleHint.topAnchor.constraint(equalTo: continueEmailButton.bottomAnchor, constant: 32),
            midleHint.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        continueGmailButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            continueGmailButton.topAnchor.constraint(equalTo: midleHint.bottomAnchor, constant: 40),
            continueGmailButton.leadingAnchor.constraint(equalTo: additionalView.leadingAnchor, constant: 24),
            continueGmailButton.trailingAnchor.constraint(equalTo: additionalView.trailingAnchor, constant: -24),
            continueGmailButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        continueGmailButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            continueGmailButton.topAnchor.constraint(equalTo: midleHint.bottomAnchor, constant: 40),
            continueGmailButton.leadingAnchor.constraint(equalTo: additionalView.leadingAnchor, constant: 24),
            continueGmailButton.trailingAnchor.constraint(equalTo: additionalView.trailingAnchor, constant: -24),
            continueGmailButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        lowHintLoginLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lowHintLoginLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -93),
            lowHintLoginLabel.trailingAnchor.constraint(equalTo: additionalView.trailingAnchor, constant: -110),
            lowHintLoginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -10)
        ])
        loginLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -93),
            loginLabel.leadingAnchor.constraint(equalTo: lowHintLoginLabel.trailingAnchor, constant: 0),
            loginLabel.trailingAnchor.constraint(equalTo: additionalView.trailingAnchor, constant: -24),
        ])
        
        gmailButtomImageView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            gmailButtomImageView.centerYAnchor.constraint(equalTo: continueGmailButton.centerYAnchor),
            gmailButtomImageView.leadingAnchor.constraint(equalTo: continueGmailButton.leadingAnchor, constant: 55),
            gmailButtomImageView.heightAnchor.constraint(equalToConstant: 25),
            gmailButtomImageView.widthAnchor.constraint(equalToConstant: 25)
        ])
    }
    
    @objc
    private func continueEmailButtonPressed() {
        print("continueEmailButtonPressed")
    }
    
    @objc
    private func continueGmailButtonPressed() {
        print("continueGmailButtonPressed")
    }
    
    @objc func loginTapped(_ sender: UITapGestureRecognizer) {
        // здесь можно добавить любое действие, которое должно происходить при нажатии на login
        print("Loggin Pressed")
    }
    
}

