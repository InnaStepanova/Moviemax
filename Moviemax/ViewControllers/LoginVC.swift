//
//  CreateAccountVC.swift
//  Moviemax
//
//  Created by user on 4.04.23.
//

import UIKit
import FirebaseAuth

class LoginVC : UIViewController {
    
    var topViewLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = Resources.Fonts.plusJakartaSansBold(with: 24)
        label.textColor = UIColor.white
        label.text = "Login Account"
        return label
    }()
    
    private var topViewLowLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = Resources.Fonts.plusJakartaSans(with: 16)
        label.textColor = UIColor.white
        label.text = "Welcome back"
        return label
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = Resources.Fonts.plusJakartaSans(with: 16)
        label.textColor = UIColor.gray
        label.text = "Email"
        return label
    }()
    
    private lazy var passwordLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = Resources.Fonts.plusJakartaSans(with: 16)
        label.textColor = UIColor.gray
        label.text = "Password"
        return label
    }()

    
    private lazy var lowHintLoginLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = Resources.Fonts.plusJakartaSans(with: 16)
        label.textColor = UIColor(named: "GreyWhiteTextColor")
        label.text = "Don't have an account?"
        return label
    }()
    
    private lazy var registerLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = Resources.Fonts.plusJakartaSans(with: 16)
        label.textColor = UIColor.systemBlue
        label.text = "Register"
        return label
    }()
    
    private lazy var emailTextField : UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(named: "LightBlueTextField")
        textField.placeholder = "Enter your email address"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "BorderTextFieldColor")?.cgColor
        textField.layer.cornerRadius = 28
        return textField
    }()
    
    private var passwordTextField : UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(named: "LightBlueTextField")
        textField.placeholder = "Enter your password"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "BorderTextFieldColor")?.cgColor
        textField.layer.cornerRadius = 28
        textField.isSecureTextEntry = true
         return textField
    }()
    
    private lazy var loginButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Resources.Fonts.plusJakartaSansSemiBold(with: 16)
        button.setTitle("Login", for: .normal)
        button.backgroundColor = UIColor(named: "BlueButtonColor")
        button.layer.cornerRadius = 28
        button.addTarget(self, action: #selector(loginButtonPressed), for: .touchUpInside)
        return button
    }()
    
    var additionalView : UIView = {
        let newView = UIView(frame: CGRect(x: 0, y: 198, width: 200, height: 200))
        newView.backgroundColor = UIColor(named: "BackgroundColor")
        newView.layer.cornerRadius = 30
        return newView
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupView()
        emailTextField.text = "1@1.com"
        passwordTextField.text = "123456"
    }
    
    
    func setupView() {
        view.backgroundColor = UIColor(named: "PurpleBackGroundColor")
        
        emailTextField.paddingLeft(10)
        passwordTextField.paddingLeft(10)
        
        // задаём размер additionalView согласно размеру экрана
        let screenSize = UIScreen.main.bounds.size
        additionalView.frame.size.width = screenSize.width
        additionalView.frame.size.height = screenSize.height
        
        //Тут вместо создания кнопки сделал, действие при нажатии на label
        let loginTapGesture = UITapGestureRecognizer(target: self, action: #selector(registerTapped))
        registerLabel.isUserInteractionEnabled = true
        registerLabel.addGestureRecognizer(loginTapGesture)
        
        view.addSubview(topViewLabel)
        view.addSubview(topViewLowLabel)
        view.addSubview(additionalView)
        view.addSubview(emailLabel)
        view.addSubview(emailTextField)
        view.addSubview(passwordLabel)
        view.addSubview(passwordTextField)
        view.addSubview(loginButton)
        view.addSubview(lowHintLoginLabel)
        view.addSubview(registerLabel)
        
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
        passwordLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: 10),
            passwordLabel.leadingAnchor.constraint(equalTo: additionalView.leadingAnchor, constant: 24)
        ])
        passwordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            passwordTextField.topAnchor.constraint(equalTo: passwordLabel.bottomAnchor, constant: 8),
            passwordTextField.leadingAnchor.constraint(equalTo: additionalView.leadingAnchor, constant: 24),
            passwordTextField.trailingAnchor.constraint(equalTo: additionalView.trailingAnchor, constant: -24),
            passwordTextField.heightAnchor.constraint(equalToConstant: 52)
        ])
        
        loginButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            loginButton.topAnchor.constraint(equalTo: passwordTextField.bottomAnchor, constant: 32),
            loginButton.leadingAnchor.constraint(equalTo: additionalView.leadingAnchor, constant: 24),
            loginButton.trailingAnchor.constraint(equalTo: additionalView.trailingAnchor, constant: -24),
            loginButton.heightAnchor.constraint(equalToConstant: 56)
        ])
        lowHintLoginLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lowHintLoginLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -93),
            lowHintLoginLabel.trailingAnchor.constraint(equalTo: additionalView.trailingAnchor, constant: -110),
            lowHintLoginLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor, constant: -10)
        ])
        registerLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            registerLabel.bottomAnchor.constraint(equalTo: view.bottomAnchor, constant: -93),
            registerLabel.leadingAnchor.constraint(equalTo: lowHintLoginLabel.trailingAnchor, constant: 0),
            registerLabel.trailingAnchor.constraint(equalTo: additionalView.trailingAnchor, constant: -24),
        ])
        
    }
    
    @objc
    private func loginButtonPressed() {
        if let email = emailTextField.text, let password = passwordTextField.text {
            Auth.auth().signIn(withEmail: email, password: password) { [weak self] authResult, error in
                if let e = error {
                    print(e)
                }else {
                    
                    if let user = RealmStorageManager.shared.findUser(email1: email, password1: password) {
                        
                        let mainVC = MainVC()
                        mainVC.currentUser = user
                        
                        let tabBarController = TabBarController()
                        tabBarController.selectedIndex = 2
                        tabBarController.modalPresentationStyle = .fullScreen
                        self!.present(tabBarController, animated: true)
                    }
//                        let secondStart = SecondStartViewController()
//                        self!.present(secondStart, animated: true)
                }
            }
        }
    }
    
    @objc func registerTapped(_ sender: UITapGestureRecognizer) {
        let createVC = CreateAccountVC()
        navigationController?.pushViewController(createVC, animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
}

