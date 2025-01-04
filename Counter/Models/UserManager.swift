//
//  UserManager.swift
//  Counter
//
//  Created by Artem on 1/4/25.
//

import Foundation

struct UserManager {
    
    let userName = "Artem"
    private let password = "111"
    
    private let switchStateKey = UserDefaultsKey.switchStateKey.rawValue
    
    func saveSwitchState(_ isOn: Bool) {
        UserDefaults.standard.set(isOn, forKey: switchStateKey)
    }
    
    func loadSwitchState() -> Bool {
        return UserDefaults.standard.bool(forKey: switchStateKey)
    }
    
    func removeSwitchState() {
        UserDefaults.standard.removeObject(forKey: switchStateKey)
    }
    
    func validateCredentials(userName: String?, password: String?) -> Bool {
        return userName == self.userName && password == self.password
    }
}
