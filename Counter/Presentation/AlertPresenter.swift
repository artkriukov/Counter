//
//  AlertPresenter.swift
//  Counter
//
//  Created by Artem on 1/6/25.
//

import UIKit

final class AlertPresenter{
    
    private weak var viewController: UIViewController?
    
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func showAlert(
            title: String = "Ooops",
            message: String,
            titleButtonText: String = "Закрыть"
    ) {
        let alert = UIAlertController(
            title: title,
            message: message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(title: titleButtonText, style: .default)
        
        alert.addAction(action)
        viewController?.present(alert, animated: true, completion: nil)
    }
}
