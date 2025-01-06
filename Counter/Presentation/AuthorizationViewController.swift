//
//  AuthorizationViewController.swift
//  Counter
//
//  Created by Artem on 1/4/25.
//

import UIKit

final class AuthorizationViewController: UIViewController {
    
    @IBOutlet private weak var userNameTF: UITextField!
    @IBOutlet private weak var passwordTF: UITextField!
    @IBOutlet private weak var saveUserNameSwitch: UISwitch!
    
    private let userManager = UserManager()
    private var alertPresenter: AlertPresenter?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveUserNameSwitch.isOn = userManager.loadSwitchState()
        if saveUserNameSwitch.isOn {
            userNameTF.text = userManager.userName
        }
        
        alertPresenter = AlertPresenter(viewController: self)
    }
    
    
    @IBAction private func switchValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            userManager.saveSwitchState(true)
        } else {
            userManager.removeSwitchState()
        }
    }
    
    override func shouldPerformSegue(withIdentifier identifier: String, sender: Any?) -> Bool {
        
        if userManager.validateCredentials(
                userName: userNameTF.text,
                password: passwordTF.text
        ) {
            return true
        } else {
            alertPresenter?.showAlert(message: "Введен неверный логин или пороль")
            userNameTF.text = ""
            passwordTF.text = ""
            return false
        }
    }
    
    @IBAction private func didTapForgotButton(_ sender: UIButton) {
        sender.tag == 1
            ? alertPresenter?.showAlert(message: "Ваш логин Artem")
            : alertPresenter?.showAlert(message: "Ваш пароль 123")
    }

    
    
}
