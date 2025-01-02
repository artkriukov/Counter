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
    
    private var count = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        incrementUIButton.layer.cornerRadius = 10
        decrementUIButton.layer.cornerRadius = 10
        resetUIButton.layer.cornerRadius = 10
    }
    
    @IBAction func didTapIncrement() {
        count += 1
        updatedCounterLabel()
    }

    @IBAction func didTapDecrement() {
        if count > 0 {
            count -= 1
            updatedCounterLabel()
        }
    }
    
    @IBAction func didTapReset() {
        count = 0
        updatedCounterLabel()
    }
    
    private func updatedCounterLabel () {
        counterUILabel.text = "Значение счетчика: \(count)"
    }
}

