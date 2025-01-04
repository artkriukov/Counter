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
    
    private let userName = "Artem"
    private let password = "111"
    
    let nameKey = "nameKey"
    let switchKey = "switchState"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        if let savedSwitchState = UserDefaults.standard.value(forKey: switchKey) as? Bool {
            saveUserNameSwitch.isOn = savedSwitchState
            userNameTF.text = userName
        }
    }
    
    
    @IBAction func switchValueChanged(_ sender: UISwitch) {
        if sender.isOn {
            UserDefaults.standard.set(sender.isOn, forKey: switchKey)
        } else {
            UserDefaults.standard.removeObject(forKey: switchKey)
        }
        
    }
    
}
