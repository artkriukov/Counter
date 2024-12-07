//
//  ViewController.swift
//  Counter
//
//  Created by Artem on 12/6/24.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var counterUILabel: UILabel!
    @IBOutlet weak var incrementUIButton: UIButton!
    @IBOutlet weak var decrementUIButton: UIButton!
    @IBOutlet weak var resetUIButton: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    
    var count = 0
    var history = "История изменений: \n"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        incrementUIButton.layer.cornerRadius = 10
        decrementUIButton.layer.cornerRadius = 10
        resetUIButton.layer.cornerRadius = 10
        historyTextView.text = history
    }

    @IBAction func increment(_ sender: UIButton) {
        count += 1
        logHistory(message: "значение изменено на +1 \n")
        updateCount()
    }

    @IBAction func decrement(_ sender: UIButton) {
        if count > 0 {
            count -= 1
            logHistory(message: "значение изменено на -1 \n")
            updateCount()
        } else {
            logHistory(message: "попытка уменьшить значение счётчика ниже 0 \n")
        }
    }
    @IBAction func reset(_ sender: UIButton) {
        count = 0
        logHistory(message: "значение сброшено \n")
        updateCount()
    }
    
    func updateCount() {
        counterUILabel.text = "Значение счётчика: \(count)"
    }
    
    func logHistory(message: String) {
        let date = DateFormatter()
        date.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let timestamp = date.string(from: Date())
        
        history += "[\(timestamp)]: \(message)"
        updateHistory()
    }
    
    func updateHistory() {
        historyTextView.text = history
    }
}

