//
//  Counter.swift
//  Counter
//
//  Created by Artem on 1/4/25.
//

import Foundation

final class Counter {
    
    private(set) var count: Int {
        didSet {
            saveState()
        }
    }
    
    private(set) var history: String {
            didSet {
                saveState()
            }
        }
    
    init() {
        // Загружаем сохранённое состояние при создании объекта
        self.count = UserDefaults.standard
            .integer(forKey: UserDefaultsKey.countKey.rawValue)
        self.history = UserDefaults.standard
            .string(forKey: UserDefaultsKey.historyKey.rawValue) ?? "История изменений: \n"
    }
    
    func increment() {
        count += 1
        logHistory(message: "значение изменено на +1")
    }
    
    func decrement() {
        if count > 0 {
            count -= 1
            logHistory(message: "значение изменено на -1")
        } else {
            logHistory(message: "попытка уменьшить значение счётчика ниже 0")
        }
    }
    
    func reset() {
        count = 0
        logHistory(message: "значение сброшено")
    }
    
    private func logHistory(message: String) {
        let date = DateFormatter()
        date.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let timestamp = date.string(from: Date())
        history += "[\(timestamp)]: \(message) \n"
    }
    
    private func saveState() {
        UserDefaults.standard.set(count, forKey: UserDefaultsKey.countKey.rawValue)
        UserDefaults.standard.set(history, forKey: UserDefaultsKey.historyKey.rawValue)
    }
}
