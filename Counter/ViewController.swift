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
    
    var count = 0
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        incrementUIButton.layer.cornerRadius = 20
    }

    @IBAction func increment(_ sender: UIButton) {
        count += 1
        counterUILabel.text = "Значение счётчика: \(count)"
    }

}

