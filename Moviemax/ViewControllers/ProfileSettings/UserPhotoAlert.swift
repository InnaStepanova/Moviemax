//
//  UserPhotoAlert.swift
//  Moviemax
//
//  Created by Эдгар Исаев on 09.04.2023.
//

import AVFoundation
import UIKit

class UserPhotoAlert {
    
    var delegate: UserPhotoAlertDelegate?
    
    let viewController: UIViewController
    
    let blurBackground: UIVisualEffectView = {
        let blurEffect = UIBlurEffect(style: .dark)
        let view = UIVisualEffectView(effect: blurEffect)
        view.alpha = 0
        return view
    }()
    
    let alertView: UIView = {
       let view = UIView()
        view.layer.cornerRadius = 10
        view.backgroundColor = .white
        return view
    }()
    
    let alertTitle: UILabel = {
       let label = UILabel()
        label.text = "Change your picture"
        label.textAlignment = .center
        label.textColor = .black
        label.font = UIFont(descriptor: UIFontDescriptor(name: "PlusJakartaSans-VariableFont_wght", size: 20), size: 20)
        return label
    }()
    
    let lineView: UIView = {
       let view = UIView()
        view.backgroundColor = #colorLiteral(red: 0.9607843757, green: 0.9607843757, blue: 0.9607843757, alpha: 1)
        return view
    }()
    
    let takePhotoButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.9607843757, green: 0.9607843757, blue: 0.9607843757, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("Take a photo", for: .normal)
        button.titleLabel?.font = UIFont(descriptor: UIFontDescriptor(name: "PlusJakartaSans-VariableFont_wght", size: 14), size: 14)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -120, bottom: 0, right: 0)
        button.titleLabel?.tintColor = .black
        button.setImage(UIImage(named: "Camera")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -160, bottom: 0, right: 0)
        return button
    }()
    
    let chooseFromFileButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.9607843757, green: 0.9607843757, blue: 0.9607843757, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("Choose from your file", for: .normal)
        button.titleLabel?.font = UIFont(descriptor: UIFontDescriptor(name: "PlusJakartaSans-VariableFont_wght", size: 14), size: 14)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -65, bottom: 0, right: 0)
        button.titleLabel?.tintColor = .black
        button.setImage(UIImage(named: "File")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -105, bottom: 0, right: 0)
        return button
    }()
    
    let deleteButton: UIButton = {
        let button = UIButton(type: .system)
        button.backgroundColor = #colorLiteral(red: 0.9607843757, green: 0.9607843757, blue: 0.9607843757, alpha: 1)
        button.layer.cornerRadius = 10
        button.setTitle("Delete photo", for: .normal)
        button.titleLabel?.font = UIFont(descriptor: UIFontDescriptor(name: "PlusJakartaSans-VariableFont_wght", size: 14), size: 14)
        button.titleEdgeInsets = UIEdgeInsets(top: 0, left: -115, bottom: 0, right: 0)
        button.titleLabel?.tintColor = .red
        button.setImage(UIImage(named: "Delete")?.withRenderingMode(.alwaysOriginal), for: .normal)
        button.imageEdgeInsets = UIEdgeInsets(top: 0, left: -160, bottom: 0, right: 0)
        return button
    }()
    
    
    
    var mainView: UIView?
    
    init(vc: UIViewController) {
        self.viewController = vc
    }
    
    func setupAlert() {
        
        guard let parentView = self.viewController.view else { return }
        blurBackground.frame = parentView.frame
        mainView = parentView
        
        alertView.frame = CGRect(x: 25,
                                 y: -340,
                                 width: parentView.frame.width - 50,
                                 height: 340)
        
        alertTitle.frame = CGRect(x: 20,
                                  y: 30,
                                  width: alertView.frame.width - 40,
                                  height: 30)
        
        lineView.frame = CGRect(x: 0,
                                y: alertTitle.frame.maxY + 20,
                                width: alertView.frame.width,
                                height: 1)
        
        takePhotoButton.frame = CGRect(x: 16,
                                       y: lineView.frame.maxY + 20,
                                       width: alertView.frame.width - 32,
                                       height: 60)
        takePhotoButton.addTarget(self, action: #selector(takePhotoButtonTapped), for: .touchUpInside)
        
        chooseFromFileButton.frame = CGRect(x: 16,
                                            y: takePhotoButton.frame.maxY + 20,
                                            width: alertView.frame.width - 32,
                                            height: 60)
        chooseFromFileButton.addTarget(self, action: #selector(chooseFromFileButtonTapped), for: .touchUpInside)
        
        deleteButton.frame = CGRect(x: 16,
                                    y: chooseFromFileButton.frame.maxY + 20,
                                    width: alertView.frame.width - 32,
                                    height: 60)
        deleteButton.addTarget(self, action: #selector(deleteButtonTapped), for: .touchUpInside)
        
        parentView.addSubview(blurBackground)
        parentView.addSubview(alertView)
        alertView.addSubview(alertTitle)
        alertView.addSubview(lineView)
        alertView.addSubview(takePhotoButton)
        alertView.addSubview(chooseFromFileButton)
        alertView.addSubview(deleteButton)
        
        //Animation for alert
        
        UIView.animate(withDuration: 0.4) {
            self.blurBackground.alpha = 1
        } completion: { done in
            if done {
                UIView.animate(withDuration: 0.4) {
                    self.alertView.center = parentView.center
                }
            }
        }
        
        addTaps()
    }
    
    func addTaps() {
        let backgroundTap = UITapGestureRecognizer(target: self, action: #selector(blurBackgroundTapped))
        blurBackground.isUserInteractionEnabled = true
        blurBackground.addGestureRecognizer(backgroundTap)
    }
    
    @objc func blurBackgroundTapped() {
        guard let targetView = mainView else { return }
        
        UIView.animate(withDuration: 0.4) {
            self.alertView.frame = CGRect(x: 25,
                                     y: targetView.frame.height,
                                     width: targetView.frame.width - 50,
                                     height: 340)
        } completion: { _ in
            UIView.animate(withDuration: 0.4) {
                self.blurBackground.alpha = 0
            } completion: { done in
                if done {
                    self.alertView.removeFromSuperview()
                    self.blurBackground.removeFromSuperview()
                }
            }

        }

    }
    
    @objc func takePhotoButtonTapped() {
        AVCaptureDevice.requestAccess(for: .video) { granted in
            DispatchQueue.main.async {
                if granted {
                    let imagePicker = UIImagePickerController()
                    imagePicker.sourceType = .camera
                    imagePicker.delegate = self.viewController as? any UIImagePickerControllerDelegate & UINavigationControllerDelegate
                    self.viewController.present(imagePicker, animated: true, completion: nil)
                } else {
                    let alertController = UIAlertController(title: "Доступ к камере запрещен",
                                                            message: "Чтобы использовать камеру, разрешите доступ к ней в настройках устройства",
                                                            preferredStyle: .alert)
                    let cancelAction = UIAlertAction(title: "Ok", style: .cancel, handler: nil)
                    alertController.addAction(cancelAction)
                    self.viewController.present(alertController, animated: true, completion: nil)
                }
            }
        }
        self.alertView.removeFromSuperview()
        self.blurBackground.removeFromSuperview()
    }
    
    @objc func chooseFromFileButtonTapped() {
        let imagePicker = UIImagePickerController()
        imagePicker.sourceType = .photoLibrary
        imagePicker.delegate = self.viewController as? any UIImagePickerControllerDelegate & UINavigationControllerDelegate
        self.viewController.present(imagePicker, animated: true, completion: nil)
        self.alertView.removeFromSuperview()
        self.blurBackground.removeFromSuperview()
    }
    
    @objc func deleteButtonTapped() {
        delegate?.deletePhoto()
        print("delete button")
        self.alertView.removeFromSuperview()
        self.blurBackground.removeFromSuperview()
    }
}
