//
//  ViewController.swift
//  Counter
//
//  Created by Artem on 1/2/25.
//

import UIKit

final class CounterViewController: UIViewController {
    @IBOutlet private weak var counterUILabel: UILabel!
    @IBOutlet private weak var incrementUIButton: UIButton!
    @IBOutlet private weak var decrementUIButton: UIButton!
    @IBOutlet private weak var resetUIButton: UIButton!
    @IBOutlet weak var historyTextView: UITextView!
    
    private var count = 0
    private var history = "История изменений: \n"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        incrementUIButton.layer.cornerRadius = 10
        decrementUIButton.layer.cornerRadius = 10
        resetUIButton.layer.cornerRadius = 10
        
        historyTextView.text = history
    }
    
    @IBAction func didTapIncrement() {
        count += 1
        updatedCounterLabel()
        logHistory(message: "значение изменено на +1 \n")
    }

    @IBAction func didTapDecrement() {
        if count > 0 {
            count -= 1
            updatedCounterLabel()
            logHistory(message: "значение изменено на -1 \n")
        } else {
            logHistory(message: "попытка уменьшить значение счётчика ниже 0 \n")
        }
    }
    
    @IBAction func didTapReset() {
        count = 0
        updatedCounterLabel()
        logHistory(message: "значение сброшено \n")
    }
    
    private func updatedCounterLabel () {
        counterUILabel.text = "Значение счетчика: \(count)"
    }
    
    private func logHistory (message: String) {
        let date = DateFormatter()
        date.dateFormat = "dd-MM-yyyy HH:mm:ss"
        let timestamp = date.string(from: Date())
        
        history += "[\(timestamp)]: \(message)"
        updateHistory()
    }
    
    private func updateHistory() {
        historyTextView.text = history
    }
}

