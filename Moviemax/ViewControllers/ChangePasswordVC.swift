//
//  ChangePasswordVC.swift
//  Moviemax
//
//  Created by user on 14.04.23.
//

import UIKit
import FirebaseAuth

class ChangePasswordVC : UIViewController {
    
    var topViewLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = Resources.Fonts.plusJakartaSansBold(with: 24)
        label.textColor = UIColor.white
        label.text = "Change Password"
        return label
    }()
    
    private var topViewLowLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = Resources.Fonts.plusJakartaSans(with: 16)
        label.textColor = UIColor.white
        label.text = "Welcome back"
        return label
    }()
    
    private lazy var currentPasswordLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = Resources.Fonts.plusJakartaSans(with: 16)
        label.textColor = UIColor.gray
        label.text = "Current password"
        return label
    }()
    
    private lazy var newPasswordLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = Resources.Fonts.plusJakartaSans(with: 16)
        label.textColor = UIColor.gray
        label.text = "New password"
        return label
    }()
    
    private lazy var repeatNewPasswordLabel: UILabel = {
        let label = UILabel(frame: .zero)
        label.font = Resources.Fonts.plusJakartaSans(with: 16)
        label.textColor = UIColor.gray
        label.text = "Repeat new password"
        return label
    }()

    private lazy var newPasswordTextField : UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(named: "LightBlueTextField")
        textField.placeholder = "Enter your new password"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "BorderTextFieldColor")?.cgColor
        textField.layer.cornerRadius = 28
        return textField
    }()
    
    private lazy var repeatNewPasswordTextField : UITextField = {
        let textField = UITextField()
        textField.backgroundColor = UIColor(named: "LightBlueTextField")
        textField.placeholder = "Repeat your new password"
        textField.layer.borderWidth = 1
        textField.layer.borderColor = UIColor(named: "BorderTextFieldColor")?.cgColor
        textField.layer.cornerRadius = 28
        return textField
    }()
    
    private lazy var changePasswordButton: UIButton = {
        let button = UIButton(type: .system)
        button.setTitleColor(.white, for: .normal)
        button.titleLabel?.font = Resources.Fonts.plusJakartaSansSemiBold(with: 16)
        button.setTitle("Change password", for: .normal)
        button.backgroundColor = UIColor(named: "BlueButtonColor")
        button.layer.cornerRadius = 28
        button.addTarget(self, action: #selector(changePasswordButtonPressed), for: .touchUpInside)
        return button
    }()
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "BackButton1"), for: .normal)
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
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
    }
    
    
    func setupView() {
        view.backgroundColor = UIColor(named: "PurpleBackGroundColor")
        
        newPasswordTextField.paddingLeft(10)
        repeatNewPasswordTextField.paddingLeft(10)

        // задаём размер additionalView согласно размеру экрана
        let screenSize = UIScreen.main.bounds.size
        additionalView.frame.size.width = screenSize.width
        additionalView.frame.size.height = screenSize.height
        
        view.addSubview(topViewLabel)
        view.addSubview(topViewLowLabel)
        view.addSubview(additionalView)
        view.addSubview(newPasswordLabel)
        view.addSubview(repeatNewPasswordLabel)
        view.addSubview(newPasswordTextField)
        view.addSubview(repeatNewPasswordTextField)
        view.addSubview(changePasswordButton)
        view.addSubview(backButton)

        setConstraints()
    }
    
    private func setConstraints() {
        topViewLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topViewLabel.topAnchor.constraint(equalTo: view.topAnchor, constant: 74),
            topViewLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        backButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.topAnchor, constant: 74),
            backButton.leadingAnchor.constraint(equalTo: view.leadingAnchor, constant: 20)
        ])
        topViewLowLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            topViewLowLabel.topAnchor.constraint(equalTo: topViewLabel.bottomAnchor, constant: 8),
            topViewLowLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor)
        ])
        newPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newPasswordLabel.topAnchor.constraint(equalTo: additionalView.topAnchor, constant: 47),
            newPasswordLabel.leadingAnchor.constraint(equalTo: additionalView.leadingAnchor, constant: 24)
        ])
        newPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            newPasswordTextField.topAnchor.constraint(equalTo: newPasswordLabel.bottomAnchor, constant: 8),
            newPasswordTextField.leadingAnchor.constraint(equalTo: additionalView.leadingAnchor, constant: 24),
            newPasswordTextField.trailingAnchor.constraint(equalTo: additionalView.trailingAnchor, constant: -24),
            newPasswordTextField.heightAnchor.constraint(equalToConstant: 52)
        ])
        repeatNewPasswordLabel.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            repeatNewPasswordLabel.topAnchor.constraint(equalTo: newPasswordTextField.bottomAnchor, constant: 10),
            repeatNewPasswordLabel.leadingAnchor.constraint(equalTo: additionalView.leadingAnchor, constant: 24)
        ])
        repeatNewPasswordTextField.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            repeatNewPasswordTextField.topAnchor.constraint(equalTo: repeatNewPasswordLabel.bottomAnchor, constant: 8),
            repeatNewPasswordTextField.leadingAnchor.constraint(equalTo: additionalView.leadingAnchor, constant: 24),
            repeatNewPasswordTextField.trailingAnchor.constraint(equalTo: additionalView.trailingAnchor, constant: -24),
            repeatNewPasswordTextField.heightAnchor.constraint(equalToConstant: 52)
        ])
        
        changePasswordButton.translatesAutoresizingMaskIntoConstraints = false
        NSLayoutConstraint.activate([
            changePasswordButton.topAnchor.constraint(equalTo: repeatNewPasswordTextField.bottomAnchor, constant: 32),
            changePasswordButton.leadingAnchor.constraint(equalTo: additionalView.leadingAnchor, constant: 24),
            changePasswordButton.trailingAnchor.constraint(equalTo: additionalView.trailingAnchor, constant: -24),
            changePasswordButton.heightAnchor.constraint(equalToConstant: 56)
        ])
    }
    
    @objc private func changePasswordButtonPressed() {
        if let newPassword = newPasswordTextField.text, let repeatNewPassword = newPasswordTextField.text {
            if newPassword == repeatNewPassword {
                // Reauthenticate the user
                let currentUser = Auth.auth().currentUser
                let credential = EmailAuthProvider.credential(withEmail: currentUser?.email ?? "", password: RealmStorageManager.shared.getCurrentUser()?.password ?? "")
                currentUser?.reauthenticate(with: credential, completion: { (result, error) in
                    if let error = error {
                        print(error.localizedDescription)
                        return
                    }
                    
                    // Update the user's password
                    currentUser?.updatePassword(to: newPassword, completion: { (error) in
                        if let error = error {
                            print(error.localizedDescription)
                            return
                        }
                        
                        // Update the password in the local storage
                        guard let currentUser = RealmStorageManager.shared.getCurrentUser() else {return}
                        RealmStorageManager.shared.edit {
                            currentUser.password = newPassword
                        }
                        
                        // Pop the view controller
                        self.navigationController?.popViewController(animated: true)
                    })
                })
            }
        }
    }

//    private func changePasswordButtonPressed() {
//        if let newPassword = newPasswordTextField.text, let repeatNewPassword = newPasswordTextField.text {
//            if newPassword == repeatNewPassword {
//                Auth.auth().currentUser?.updatePassword(to: newPassword) { error in
//                    if let e = error {
//                        print(e)
//                    } else {
//                        guard let currentUser = RealmStorageManager.shared.getCurrentUser() else {return}
//                        RealmStorageManager.shared.edit {
//                            currentUser.password = newPassword
//                        }
//                        self.navigationController?.popViewController(animated: true)
//                    }
//                }
//            }
//        }
//    }
    
    @objc
    private func backButtonPressed() {
        navigationController?.popViewController(animated: true)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        navigationController?.isNavigationBarHidden = true
    }
    
}


