//
//  ViewController.swift
//  Counter
//
//  Created by Artem on 12/6/24.
//

import UIKit

final class ViewController: UIViewController {
    @IBOutlet private weak var counterUILabel: UILabel!
    @IBOutlet private weak var incrementUIButton: UIButton!
    @IBOutlet private weak var decrementUIButton: UIButton!
    @IBOutlet private weak var resetUIButton: UIButton!
    @IBOutlet private weak var historyTextView: UITextView!
    
    private var count = 0
    private var history = "История изменений: \n"
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        incrementUIButton.layer.cornerRadius = 10
        decrementUIButton.layer.cornerRadius = 10
        resetUIButton.layer.cornerRadius = 10
        historyTextView.text = history
    }

    @IBAction private func didTapIncrement(_ sender: UIButton) {
        count += 1
        logHistory(message: "значение изменено на +1 \n")
        updateCounterLabel()
    }

    @IBAction private func didTapDecrement(_ sender: UIButton) {
        if count > 0 {
            count -= 1
            logHistory(message: "значение изменено на -1 \n")
            updateCounterLabel()
        } else {
            logHistory(message: "попытка уменьшить значение счётчика ниже 0 \n")
        }
    }
    @IBAction private func didTapReset(_ sender: UIButton) {
        count = 0
        logHistory(message: "значение сброшено \n")
        updateCounterLabel()
    }
    
    private func updateCounterLabel() {
        counterUILabel.text = "Значение счётчика: \(count)"
    }
    
    private func logHistory(message: String) {
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

