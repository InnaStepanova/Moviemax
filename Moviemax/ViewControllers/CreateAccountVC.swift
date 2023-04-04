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
        label.font = UIFont.systemFont(ofSize: 24, weight: .bold)
        label.textColor = UIColor.white
        return label
    }()
    
    private var topViewLowLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor.white
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor.gray
        return label
    }()
    
    private lazy var midleHint: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor.gray
        return label
    }()
    
    private lazy var lowHintLoginLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor.black
        return label
    }()
    
    private lazy var loginLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = UIFont.systemFont(ofSize: 16, weight: .regular)
        label.textColor = UIColor.systemBlue
        return label
    }()
    
    private lazy var emailTextField = UITextField()
    
    private lazy var continueEmailButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.setTitle("Continue with Email", for: .normal)
        button.backgroundColor = UIColor(named: "BlueButtonColor")
        button.layer.cornerRadius = 28
        button.addTarget(self, action: #selector(continueEmailButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var continueGmailButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.black, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16, weight: .semibold)
        button.setTitle("Continue with Google", for: .normal)
        button.backgroundColor = .white
        button.layer.borderColor = UIColor.black.cgColor
        button.layer.borderWidth = 1
        button.layer.cornerRadius = 28
        button.addTarget(self, action: #selector(continueGmailButtonPressed), for: .touchUpInside)
        return button
    }()
    
    var additionalView : UIView = {
        let newView = UIView(frame: CGRect(x: 0, y: 198, width: 200, height: 200))
        newView.backgroundColor = .white
        newView.layer.cornerRadius = 30
        return newView
    }()
    let gmailButtomImageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 30 , height: 30))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
    }
    
    
    func setupView() {
        view.backgroundColor = UIColor(named: "PurpleBackGroundColor")
        
        emailTextField.paddingLeft(10)
        
        topViewLabel.text = "Create Account"
        topViewLowLabel.text = "Lorem ipsum dolor sit amet"
        emailLabel.text = "Email"
        midleHint.text = "———  Or continue with  ———"
        lowHintLoginLabel.text = "Already have an account?"
        loginLabel.text = "Login"
        
        // задаём размер additionalView согласно размеру экрана
        let screenSize = UIScreen.main.bounds.size
        additionalView.frame.size.width = screenSize.width
        additionalView.frame.size.height = screenSize.height
        
        emailTextField.backgroundColor = UIColor(named: "LightBlueTextField")
        emailTextField.placeholder = "Enter your email address" // задаем подсказку для текстового поля
        emailTextField.borderStyle = .none  // задаем стиль границы текстового поля
        emailTextField.layer.cornerRadius = 28
        emailTextField.isSecureTextEntry = true
        
        //Тут вместо создания кнопки сделал, действие при нажатии на label
        let loginTapGesture = UITapGestureRecognizer(target: self, action: #selector(loginTapped))
        loginLabel.isUserInteractionEnabled = true
        loginLabel.addGestureRecognizer(loginTapGesture)
        
        // Настраиваем изображение внутри кнопки
        gmailButtomImageView.contentMode = .scaleAspectFit
        gmailButtomImageView.image = UIImage(named: "GmailImage")
        
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

