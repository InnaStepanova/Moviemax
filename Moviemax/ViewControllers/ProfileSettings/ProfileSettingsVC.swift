//
//  ProfileSettingsVC.swift
//  Moviemax
//
//  Created by Николай Игнатов on 05.04.2023.
//

import UIKit

final class ProfileSettingsVC: UIViewController {
    
    var currentUser: CurrentUser?
    
    private lazy var backButton: UIButton = {
        let button = UIButton(type: .system)
        button.setBackgroundImage(UIImage(named: "BackButton"), for: .normal)
        button.addTarget(self, action: #selector(backButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var titleLabel: UILabel = {
        let label = UILabel()
        label.font = Resources.Fonts.plusJakartaSansBold(with: 18)
        label.text = "Profile"
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var scrollView: UIScrollView = {
        let scrollView = UIScrollView()
        scrollView.isScrollEnabled = true
        scrollView.alwaysBounceHorizontal = false
        scrollView.translatesAutoresizingMaskIntoConstraints = false
        return scrollView
    }()

    private lazy var avatarImageView: UIImageView = {
        let imageView = UIImageView()
        if let photoData = currentUser?.user?.photo {
            imageView.image = UIImage(data: photoData)
        } else {
            imageView.image = #imageLiteral(resourceName: "avatar.pdf")
        }
        imageView.contentMode = .scaleAspectFill
        imageView.clipsToBounds = true
        imageView.layer.cornerRadius = Constants.Size.avatarSize.half
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var editAvatar: UIImageView = {
        let imageView = UIImageView()
        imageView.image = #imageLiteral(resourceName: "edit")
        imageView.contentMode = .scaleAspectFit
        imageView.translatesAutoresizingMaskIntoConstraints = false
        return imageView
    }()
    
    private lazy var firstNameLabel: UILabel = {
        let label = UILabel.signLowLabel
        label.text = "First name"
        label.font = Resources.Fonts.plusJakartaSansMedium(with: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var firstNameTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.layer.borderWidth = 1.0
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 24
        textField.layer.borderColor = #colorLiteral(red: 0.3179999888, green: 0.3059999943, blue: 0.7139999866, alpha: 1).cgColor
        textField.placeholder = "First name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var lastNameLabel: UILabel = {
        let label = UILabel.signLowLabel
        label.text = "Last name"
        label.font = Resources.Fonts.plusJakartaSansMedium(with: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var lastNameTextField: UITextField = {
        let textField = UITextField()
        textField.text = currentUser?.user?.lastName
        textField.borderStyle = .none
        textField.layer.borderWidth = 1.0
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 24
        textField.layer.borderColor = #colorLiteral(red: 0.3179999888, green: 0.3059999943, blue: 0.7139999866, alpha: 1).cgColor
        textField.placeholder = "Last name"
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var emailLabel: UILabel = {
        let label = UILabel.signLowLabel
        label.text = "E-mail"
        label.font = Resources.Fonts.plusJakartaSansMedium(with: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var emailTextField: UITextField = {
        let textField = UITextField()
        textField.text = currentUser?.user?.email
        textField.borderStyle = .none
        textField.layer.borderWidth = 1.0
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.layer.cornerRadius = 24
        textField.layer.borderColor = #colorLiteral(red: 0.3179999888, green: 0.3059999943, blue: 0.7139999866, alpha: 1).cgColor
        textField.placeholder = "E-mail"
        textField.autocapitalizationType = .none
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    private lazy var dateOfBirthLabel: UILabel = {
        let label = UILabel.signLowLabel
        label.text = "Date of Birth"
        label.font = Resources.Fonts.plusJakartaSansMedium(with: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var dateOfBirthTextField: UITextField = {
        let textField = UITextField()
        textField.borderStyle = .none
        textField.layer.borderWidth = 1.0
        textField.layer.cornerRadius = 24
        textField.leftView = UIView(frame: CGRect(x: 0, y: 0, width: 10, height: textField.frame.height))
        textField.leftViewMode = .always
        textField.layer.borderColor = #colorLiteral(red: 0.3179999888, green: 0.3059999943, blue: 0.7139999866, alpha: 1).cgColor
        textField.placeholder = "Date of Birth"
        let calendarButton = UIButton(type: .system)
        calendarButton.setImage(#imageLiteral(resourceName: "calendar.pdf"), for: .normal)
        calendarButton.tintColor = #colorLiteral(red: 0.3179999888, green: 0.3059999943, blue: 0.7139999866, alpha: 1)
        calendarButton.imageEdgeInsets = UIEdgeInsets(top: 0, left: -15.5, bottom: 0, right: 0)
        calendarButton.addTarget(self, action: #selector(textFieldShouldBeginEditing), for: .touchUpInside)
        textField.rightView = calendarButton
        textField.rightViewMode = .always
        textField.translatesAutoresizingMaskIntoConstraints = false
        return textField
    }()
    
    @objc func textFieldShouldBeginEditing (){
      
            // Создание объекта DatePicker
            let datePicker = UIDatePicker()
            datePicker.datePickerMode = .date
        if #available(iOS 13.4, *) {
            datePicker.preferredDatePickerStyle = .wheels
        } else {
            // Fallback on earlier versions
        }
            // Добавление метода для обработки выбора даты
            datePicker.addTarget(self, action: #selector(dateSelected), for: .valueChanged)
            datePicker.translatesAutoresizingMaskIntoConstraints = false

            // Создание объекта AlertController
            let alertController = UIAlertController(title: "\n\n\n\n\n\n\n\n\n", message: nil, preferredStyle: .alert)
            alertController.view.addSubview(datePicker)
            // Добавление кнопок "Cancel" и "OK"
            let cancelAction = UIAlertAction(title: "Cancel", style: .cancel, handler: nil)
            let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
            alertController.addAction(cancelAction)
            alertController.addAction(okAction)
            // Отображение AlertController
            present(alertController, animated: true, completion: nil)
            datePicker.centerXAnchor.constraint(equalTo: alertController.view.centerXAnchor).isActive = true
            datePicker.centerYAnchor.constraint(equalTo: alertController.view.centerYAnchor).isActive = true
        
    }
        
    @objc func dateSelected(sender: UIDatePicker) {
            // Форматирование выбранной даты в нужный формат
            let formatter = DateFormatter()
            formatter.dateFormat = "dd.MM.yyyy"
            let dateString = formatter.string(from: sender.date)
            // Установка выбранной даты в текстовое поле
            dateOfBirthTextField.text = dateString
        }
    
    private lazy var genderLabel: UILabel = {
        let label = UILabel.signLowLabel
        label.text = "Gender"
        label.font = Resources.Fonts.plusJakartaSansMedium(with: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var maleButton = GenderCustomButton(type: .male) {
        guard let editUser = self.currentUser?.user else { return }
        StorageManader.shared.editCurrentUser(user: editUser) { user in
            user.gender = "male"
        }
        print("maleButtonTapped")
    }
    
    private lazy var femaleButton = GenderCustomButton(type: .female) {
        guard let editUser = self.currentUser?.user else { return }
        StorageManader.shared.editCurrentUser(user: editUser) { user in
            user.gender = "female"
        }
        print("femaleButtonTapped")
    }
    
    private lazy var locationLabel: UILabel = {
        let label = UILabel.signLowLabel
        label.text = "Location"
        label.font = Resources.Fonts.plusJakartaSansMedium(with: 14)
        label.translatesAutoresizingMaskIntoConstraints = false
        return label
    }()
    
    private lazy var locationTextView: UITextView = {
        let textView = UITextView()
        textView.backgroundColor = .clear
        textView.textColor = .lightGray
        textView.layer.cornerRadius = 24
        textView.layer.borderWidth = 1
        textView.layer.borderColor = #colorLiteral(red: 0.3179999888, green: 0.3059999943, blue: 0.7139999866, alpha: 1).cgColor
        textView.textContainerInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        textView.font = Resources.Fonts.plusJakartaSansSemiBold(with: 16)
        textView.delegate = self
        textView.text = currentUser?.user?.location
        textView.translatesAutoresizingMaskIntoConstraints = false
        return textView
    }()
    
    private lazy var saveButton: UIButton = {
        let button = UIButton(type: .system)
        button.isEnabled = true
        button.setTitle("Save Changes", for: .normal)
        button.titleLabel?.font = Resources.Fonts.plusJakartaSansSemiBold(with: 16)
        button.setTitleColor(button.isEnabled ? .black : .lightGray, for: .normal)
        button.layer.cornerRadius = 24
        button.backgroundColor = button.isEnabled ? #colorLiteral(red: 0.3179999888, green: 0.3059999943, blue: 0.7139999866, alpha: 1) : .gray
        button.addTarget(self, action: #selector(saveButtonPressed), for: .touchUpInside)
        button.translatesAutoresizingMaskIntoConstraints = false
        return button
    }()
    
    private lazy var customAlert = UserPhotoAlert(vc: self)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        setupUI()
        addTaps()
        dateOfBirthTextField.delegate = self
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        setCurrentUser()
    }

    @objc private func backButtonPressed() {
        print("backButtonPressed")
    }
    
    @objc private func saveButtonPressed() {
        guard let editUser = currentUser?.user else { return }
        StorageManader.shared.editCurrentUser(user: editUser) { user in
            user.firstName = firstNameTextField.text
            user.lastName = lastNameTextField.text
            user.email = emailTextField.text
            user.location = locationTextView.text
        }
    }
    
    private func setCurrentUser() {
        firstNameTextField.text = currentUser?.user?.firstName
        lastNameTextField.text = currentUser?.user?.lastName
        emailTextField.text = currentUser?.user?.email
        locationTextView.text = currentUser?.user?.location
        if currentUser?.user?.gender == "male" {
            maleButton.isSelected = true
        }
        if currentUser?.user?.gender == "female" {
            femaleButton.isSelected = true
        }
    }
    
    private func setupUI() {
        view.backgroundColor = UIColor(named: "BackgroundScreenColor")
        view.addSubview(backButton)
        view.addSubview(titleLabel)
        view.addSubview(scrollView)
        scrollView.addSubview(avatarImageView)
        scrollView.addSubview(editAvatar)
        scrollView.addSubview(firstNameLabel)
        scrollView.addSubview(firstNameTextField)
        scrollView.addSubview(lastNameLabel)
        scrollView.addSubview(lastNameTextField)
        scrollView.addSubview(emailLabel)
        scrollView.addSubview(emailTextField)
        scrollView.addSubview(dateOfBirthLabel)
        scrollView.addSubview(dateOfBirthTextField)
        scrollView.addSubview(genderLabel)
        scrollView.addSubview(maleButton)
        scrollView.addSubview(femaleButton)
        scrollView.addSubview(locationLabel)
        scrollView.addSubview(locationTextView)
        scrollView.addSubview(saveButton)
        setupConstraints()
    }
    
    private func setupConstraints() {
        NSLayoutConstraint.activate([
            backButton.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.Spacing.topSpacingForBackButton),
            backButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.Spacing.leadingStandartSpacing),
            
            titleLabel.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor, constant: Constants.Spacing.topSpacingForTitle),
            titleLabel.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            
            scrollView.topAnchor.constraint(equalTo: backButton.bottomAnchor, constant: Constants.Spacing.topSpacingForScrollView),
            scrollView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor),
            scrollView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor),
            scrollView.bottomAnchor.constraint(equalTo: view.safeAreaLayoutGuide.bottomAnchor),
            
            avatarImageView.topAnchor.constraint(equalTo: scrollView.topAnchor),
            avatarImageView.centerXAnchor.constraint(equalTo: view.centerXAnchor),
            avatarImageView.widthAnchor.constraint(equalToConstant: Constants.Size.avatarSize),
            avatarImageView.heightAnchor.constraint(equalToConstant: Constants.Size.avatarSize),
            
            editAvatar.bottomAnchor.constraint(equalTo: avatarImageView.bottomAnchor),
            editAvatar.leadingAnchor.constraint(equalTo: avatarImageView.trailingAnchor, constant: Constants.Spacing.leadingSpacingForEditAvatar.negative),
            editAvatar.widthAnchor.constraint(equalToConstant: Constants.Size.avatarEditSize),
            editAvatar.heightAnchor.constraint(equalToConstant: Constants.Size.avatarEditSize),
            
            firstNameLabel.topAnchor.constraint(equalTo: avatarImageView.bottomAnchor, constant: Constants.Spacing.topStandartSpacing),
            firstNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.Spacing.leadingStandartSpacing),
            
            firstNameTextField.topAnchor.constraint(equalTo: firstNameLabel.bottomAnchor, constant: Constants.Spacing.topStandartSpacing.half),
            firstNameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.Spacing.leadingStandartSpacing),
            firstNameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Constants.Spacing.trailingStandartSpacing.negative),
            firstNameTextField.heightAnchor.constraint(equalToConstant: Constants.Size.standartHeight),
            
            lastNameLabel.topAnchor.constraint(equalTo: firstNameTextField.bottomAnchor, constant: Constants.Spacing.topStandartSpacing),
            lastNameLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.Spacing.leadingStandartSpacing),
            
            lastNameTextField.topAnchor.constraint(equalTo: lastNameLabel.bottomAnchor, constant: Constants.Spacing.topStandartSpacing.half),
            lastNameTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.Spacing.leadingStandartSpacing),
            lastNameTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Constants.Spacing.trailingStandartSpacing.negative),
            lastNameTextField.heightAnchor.constraint(equalToConstant: Constants.Size.standartHeight),
            
            emailLabel.topAnchor.constraint(equalTo: lastNameTextField.bottomAnchor, constant: Constants.Spacing.topStandartSpacing),
            emailLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.Spacing.leadingStandartSpacing),
            
            emailTextField.topAnchor.constraint(equalTo: emailLabel.bottomAnchor, constant: Constants.Spacing.topStandartSpacing.half),
            emailTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.Spacing.leadingStandartSpacing),
            emailTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Constants.Spacing.trailingStandartSpacing.negative),
            emailTextField.heightAnchor.constraint(equalToConstant: Constants.Size.standartHeight),
            
            dateOfBirthLabel.topAnchor.constraint(equalTo: emailTextField.bottomAnchor, constant: Constants.Spacing.topStandartSpacing),
            dateOfBirthLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.Spacing.leadingStandartSpacing),
            
            dateOfBirthTextField.topAnchor.constraint(equalTo: dateOfBirthLabel.bottomAnchor, constant: Constants.Spacing.topStandartSpacing.half),
            dateOfBirthTextField.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.Spacing.leadingStandartSpacing),
            dateOfBirthTextField.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Constants.Spacing.trailingStandartSpacing.negative),
            dateOfBirthTextField.heightAnchor.constraint(equalToConstant: Constants.Size.standartHeight),
            
            genderLabel.topAnchor.constraint(equalTo: dateOfBirthTextField.bottomAnchor, constant: Constants.Spacing.topStandartSpacing),
            genderLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.Spacing.leadingStandartSpacing),
            
            maleButton.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: Constants.Spacing.topStandartSpacing.half),
            maleButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.Spacing.leadingStandartSpacing),
            
            femaleButton.topAnchor.constraint(equalTo: genderLabel.bottomAnchor, constant: Constants.Spacing.topStandartSpacing.half),
            femaleButton.leadingAnchor.constraint(equalTo: maleButton.trailingAnchor, constant: Constants.Spacing.spaceBetweenGenderButtons),
            femaleButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Constants.Spacing.trailingStandartSpacing.negative),
            
            maleButton.widthAnchor.constraint(equalTo: femaleButton.widthAnchor, multiplier: 1, constant: .zero),
          
            locationLabel.topAnchor.constraint(equalTo: maleButton.bottomAnchor, constant: Constants.Spacing.topStandartSpacing),
            locationLabel.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.Spacing.leadingStandartSpacing),
            
            locationTextView.topAnchor.constraint(equalTo: locationLabel.bottomAnchor, constant: Constants.Spacing.topStandartSpacing.half),
            locationTextView.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.Spacing.leadingStandartSpacing),
            locationTextView.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Constants.Spacing.trailingStandartSpacing.negative),
            locationTextView.heightAnchor.constraint(equalToConstant: Constants.Size.locationTextFieldHeight),
            
            saveButton.topAnchor.constraint(equalTo: locationTextView.bottomAnchor, constant: Constants.Spacing.saveButtonTopSpacing),
            saveButton.leadingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.leadingAnchor, constant: Constants.Spacing.leadingStandartSpacing),
            saveButton.trailingAnchor.constraint(equalTo: view.safeAreaLayoutGuide.trailingAnchor, constant: Constants.Spacing.trailingStandartSpacing.negative),
            saveButton.bottomAnchor.constraint(equalTo: scrollView.bottomAnchor, constant: Constants.Spacing.saveButtonBottomSpacing.negative),
            saveButton.heightAnchor.constraint(equalToConstant: Constants.Size.saveButtonHeight),
            
            
        ])
    }
    
    private func addTaps() {
        let tapImage = UITapGestureRecognizer(target: self, action: #selector(editAvatarTapped))
        editAvatar.isUserInteractionEnabled = true
        editAvatar.addGestureRecognizer(tapImage)
    }

    @objc private func editAvatarTapped() {
        customAlert.setupAlert()
    }
}

private extension ProfileSettingsVC {
    enum Constants {
        enum Spacing {
            static let topStandartSpacing: CGFloat = 16
            static let leadingStandartSpacing: CGFloat = 24
            static let trailingStandartSpacing: CGFloat = 24
            static let topSpacingForBackButton: CGFloat = 26
            static let topSpacingForTitle: CGFloat = 37
            static let topSpacingForScrollView: CGFloat = 37
            static let leadingSpacingForEditAvatar: CGFloat = 28
            static let spaceBetweenGenderButtons: CGFloat = 16
            static let saveButtonTopSpacing: CGFloat = 64
            static let saveButtonBottomSpacing: CGFloat = 34
        }
        enum Size {
            static let avatarSize: CGFloat = 100
            static let avatarEditSize: CGFloat = 32
            static let locationTextFieldHeight: CGFloat = 132
            static let saveButtonHeight: CGFloat = 56
            static let standartHeight: CGFloat = 52
        }
    }
}

extension ProfileSettingsVC: UITextViewDelegate {
    func textViewDidBeginEditing(_ textView: UITextView) {
        if textView.text == "Lorem Ipsum is simply dummy text of the printing and typesetting industry." {
            textView.text = ""
            textView.textColor = .black
        }
    }
    
    func textViewDidEndEditing(_ textView: UITextView) {
        if textView.text.isEmpty {
            textView.text = "Lorem Ipsum is simply dummy text of the printing and typesetting industry."
            textView.textColor = .lightGray
        }
    }
}

extension ProfileSettingsVC: UITextFieldDelegate {
    
}

extension ProfileSettingsVC: UIImagePickerControllerDelegate, UINavigationControllerDelegate {
    func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey: Any]) {
        if let image = info[UIImagePickerController.InfoKey.originalImage] as? UIImage {
            self.avatarImageView.image = image
        }
        dismiss(animated: true, completion: nil)
    }
    
    func imagePickerControllerDidCancel(_ picker: UIImagePickerController) {
        dismiss(animated: true, completion: nil)
    }
}
