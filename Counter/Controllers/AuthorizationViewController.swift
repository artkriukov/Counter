//
//  AuthorizationViewController.swift
//  Counter
//
//  Created by Artem on 1/4/25.
//

import UIKit

class AuthorizationViewController: UIViewController {
    
    @IBOutlet weak var userNameTF: UITextField!
    @IBOutlet weak var passwordTF: UITextField!
    @IBOutlet weak var saveUserNameSwitch: UISwitch!
    
    let userManager = UserManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        saveUserNameSwitch.isOn = userManager.loadSwitchState()
        if saveUserNameSwitch.isOn {
            userNameTF.text = userManager.userName
        }
    }
    
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
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
            print("Введенное имя не валидно")
            return false
        }
    }
    
}
