
import Foundation
import UIKit

class SignUpVC: UIViewController {
    
    //MARK: - Create UI
    private lazy var topStackView = UIStackView()
    private lazy var middleStackView = UIStackView()
    private lazy var lowStackView = UIStackView()
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "BackButton"), for: .normal)
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        return button
    }()
    private lazy var showPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "eye"), for: .normal)
        button.addTarget(self, action: #selector(showPasswordToggled), for: .touchUpInside)
        return button
    }()
    private lazy var showConfigPasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "eye"), for: .normal)
        button.addTarget(self, action: #selector(showConfigPasswordToggled), for: .touchUpInside)
        return button
    }()
    private lazy var signUpButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = UIFont.systemFont(ofSize: 16)
        button.setTitle("Sign Up", for: .normal)
        button.backgroundColor = UIColor(named: "BlueButtonColor")
        button.layer.cornerRadius = 28
        button.addTarget(self, action: #selector(signUpButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var signLabel = UILabel.signTopLabel
    private lazy var firstNameLabel = UILabel.signLowLabel
    private lazy var lastNameLabel = UILabel.signLowLabel
    private lazy var emailLabel = UILabel.signLowLabel
    private lazy var passwordLabel = UILabel.signLowLabel
    private lazy var confPasswordLabel = UILabel.signLowLabel
    private lazy var topCompleteLabel = UILabel.signBigLabel
    private lazy var topLowLabel = UILabel.signLowLabel
    private lazy var hintLoginLabel = UILabel.hintLabel
    private lazy var loginLabel = UILabel.hintLabel
    
    private lazy var firstNameTextField = UITextField()
    private lazy var lastNameTextField = UITextField()
    private lazy var emailTextField = UITextField()
    private lazy var passwordTextField = UITextField()
    private lazy var confPasswordTextField = UITextField()
    
    let passwordButtonView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    let confPasswordButtonView = UIView(frame: CGRect(x: 0, y: 0, width: 30, height: 30))
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupViews()
    }
    
    
    private func setupViews() {
        // делаем отступ он начала текстового поля в 10 пикселей
        firstNameTextField.paddingLeft(16)
        lastNameTextField.paddingLeft(16)
        emailTextField.paddingLeft(16)
        passwordTextField.paddingLeft(16)
        confPasswordTextField.paddingLeft(16)

        view.backgroundColor = .white
        topCompleteLabel.text = "Complet your account"
        topLowLabel.text = "Lorem ipsum dolor sit amet"
        firstNameLabel.text = "First Name"
        signLabel.text = "Sign In"
        lastNameLabel.text = "Last Name"
        emailLabel.text = "E-mail"
        passwordLabel.text = "Password"
        confPasswordLabel.text = "Confirm Password"
        hintLoginLabel.text = "Already have an account?"
        loginLabel.text = "Login"
        
        loginLabel.textColor = .systemBlue
        
        //Тут вместо создания кнопки сделал, действие при нажатии на label
        
        let loginTapGesture = UITapGestureRecognizer(target: self, action: #selector(loginTapped))
        loginLabel.isUserInteractionEnabled = true
        loginLabel.addGestureRecognizer(loginTapGesture)
        
        lowStackView = UIStackView(arrangedSubviews: [hintLoginLabel,loginLabel])
        lowStackView.axis = .horizontal
        lowStackView.spacing = 5
        lowStackView.distribution = .fill
        
        topStackView = UIStackView(arrangedSubviews: [backButton,signLabel])
        topStackView.spacing = 120
        topStackView.distribution = .fill
        
        middleStackView = UIStackView(arrangedSubviews: [firstNameLabel,firstNameTextField,lastNameLabel,lastNameTextField,emailLabel,emailTextField,passwordLabel,passwordTextField,confPasswordLabel,confPasswordTextField])
        middleStackView.spacing = 12
        middleStackView.axis = .vertical
        
        firstNameTextField.backgroundColor = UIColor(named: "LightBlueTextField")
        firstNameTextField.placeholder = "Enter your first name" // задаем подсказку для текстового поля
        firstNameTextField.borderStyle = .none  // задаем стиль границы текстового поля
        firstNameTextField.layer.cornerRadius = 20
        
        lastNameTextField.backgroundColor = UIColor(named: "LightBlueTextField")
        lastNameTextField.placeholder = "Enter your last name" // задаем подсказку для текстового поля
        lastNameTextField.borderStyle = .none  // задаем стиль границы текстового поля
        lastNameTextField.layer.cornerRadius = 20
        
        emailTextField.backgroundColor = UIColor(named: "LightBlueTextField")
        emailTextField.placeholder = "Enter your email address" // задаем подсказку для текстового поля
        emailTextField.borderStyle = .none  // задаем стиль границы текстового поля
        emailTextField.layer.cornerRadius = 20
        
        passwordTextField.backgroundColor = UIColor(named: "LightBlueTextField")
        passwordTextField.placeholder = "Enter your password" // задаем подсказку для текстового поля
        passwordTextField.borderStyle = .none  // задаем стиль границы текстового поля
        passwordTextField.layer.cornerRadius = 20
        passwordTextField.isSecureTextEntry = true
        
        confPasswordTextField.backgroundColor = UIColor(named: "LightBlueTextField")
        confPasswordTextField.placeholder = "Confirm your password" // задаем подсказку для текстового поля
        confPasswordTextField.borderStyle = .none  // задаем стиль границы текстового поля
        confPasswordTextField.layer.cornerRadius = 20
        confPasswordTextField.isSecureTextEntry = true
        
        passwordButtonView.addSubview(showPasswordButton)
        passwordTextField.rightView = passwordButtonView
        passwordTextField.rightViewMode = .always
        
        confPasswordButtonView.addSubview(showConfigPasswordButton)
        confPasswordTextField.rightView = confPasswordButtonView
        confPasswordTextField.rightViewMode = .always

        view.addSubview(topStackView)
        view.addSubview(middleStackView)
        view.addSubview(topCompleteLabel)
        view.addSubview(topLowLabel)
        view.addSubview(signUpButton)
        view.addSubview(lowStackView)

        setConstraints()
    }
    
    private func setConstraints() {
        topStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topStackView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: 31),
            topStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 10),
            topStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -20),
            backButton.heightAnchor.constraint(equalToConstant: 40),
            backButton.widthAnchor.constraint(equalToConstant: 40),
            signLabel.trailingAnchor.constraint(equalTo: topStackView.trailingAnchor, constant: 20)
        ])
        middleStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            middleStackView.topAnchor.constraint(equalTo: topLowLabel.bottomAnchor, constant: 32),
            middleStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            middleStackView.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24)
        ])
      
        NSLayoutConstraint.activate([
            firstNameTextField.heightAnchor.constraint(equalToConstant: 40),
            lastNameTextField.heightAnchor.constraint(equalToConstant: 40),
            emailTextField.heightAnchor.constraint(equalToConstant: 40),
            passwordTextField.heightAnchor.constraint(equalToConstant: 40),
            confPasswordTextField.heightAnchor.constraint(equalToConstant: 40)
        ])
        
        topCompleteLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topCompleteLabel.topAnchor.constraint(equalTo: topStackView.bottomAnchor, constant: 43),
            topCompleteLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
            
        ])
        topLowLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topLowLabel.topAnchor.constraint(equalTo: topCompleteLabel.bottomAnchor, constant: 8),
            topLowLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        
        signUpButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            signUpButton.topAnchor.constraint(equalTo: middleStackView.bottomAnchor, constant: 30),
            signUpButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 24),
            signUpButton.trailingAnchor.constraint(equalTo: view.trailingAnchor, constant: -24),
            signUpButton.heightAnchor.constraint(equalToConstant: 56)
          
        ])
        
        lowStackView.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            lowStackView.topAnchor.constraint(equalTo: signUpButton.bottomAnchor, constant: 24),
            lowStackView.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 65),
        ])

        showPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showPasswordButton.centerYAnchor.constraint(equalTo: passwordButtonView.centerYAnchor),
            showPasswordButton.leadingAnchor.constraint(equalTo: passwordButtonView.leadingAnchor, constant: 0),
            showPasswordButton.trailingAnchor.constraint(equalTo: passwordButtonView.trailingAnchor, constant: -14),
            showPasswordButton.heightAnchor.constraint(equalToConstant: 17),
            showPasswordButton.widthAnchor.constraint(equalToConstant: 24)
        ])
        
        showConfigPasswordButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            showConfigPasswordButton.centerYAnchor.constraint(equalTo: confPasswordButtonView.centerYAnchor),
            showConfigPasswordButton.leadingAnchor.constraint(equalTo: confPasswordButtonView.leadingAnchor, constant: 0),
            showConfigPasswordButton.trailingAnchor.constraint(equalTo: confPasswordButtonView.trailingAnchor, constant: -14),
            showConfigPasswordButton.heightAnchor.constraint(equalToConstant: 17),
            showConfigPasswordButton.widthAnchor.constraint(equalToConstant: 24)
        ])
        
    }

    @objc
    private func backButtonPressed() {
        print("backButtonPressed")
    }

    @objc func showPasswordToggled(sender:UIButton) {
         passwordTextField.isSecureTextEntry.toggle()
         sender.setBackgroundImage(passwordTextField.isSecureTextEntry ? UIImage(named: "eye") : UIImage(named: "eye.slash"), for: .normal)
     }
    
    @objc func  showConfigPasswordToggled(sender:UIButton) {
         confPasswordTextField.isSecureTextEntry.toggle()
         sender.setBackgroundImage(confPasswordTextField.isSecureTextEntry ? UIImage(named: "eye") : UIImage(named: "eye.slash"), for: .normal)
     }
    
    @objc
    private func signUpButtonPressed() {
        print("Sign Up button Press")
    }
    
    
    @objc func loginTapped(_ sender: UITapGestureRecognizer) {
        // здесь можно добавить любое действие, которое должно происходить при нажатии на login
        print("Loggin Pressed")
    }

}

    //MARK: Добавлям метод для создания отступа слева от текстового поля
extension UITextField {
    func paddingLeft(_ padding: CGFloat) {
        let paddingView = UIView(frame: CGRect(x: 0, y: 0, width: padding, height: self.frame.height))
        self.leftView = paddingView
        self.leftViewMode = .always
    }
}

