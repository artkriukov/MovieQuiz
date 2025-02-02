//
//  AlertPresenter.swift
//  MovieQuiz
//
//  Created by Artem on 12/31/24.
//

import UIKit

class AlertPresenter {
    private weak var viewController: UIViewController?
    private let presenter = MovieQuizPresenter()
    init(viewController: UIViewController) {
        self.viewController = viewController
    }
    
    func showAlert(model: AlertModel) {
        let alert = UIAlertController(
            title: model.title,
            message: model.message,
            preferredStyle: .alert
        )
        
        let action = UIAlertAction(
            title: model.buttonText,
            style: .default
        ) { [weak self] _ in
            guard let self else { return }
            self.presenter.resetQuestionIndex()
        }
        
        alert.addAction(action)
        viewController?.present(alert, animated: true, completion: nil)
    }
}
