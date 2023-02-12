//
//  TraineeRouter.swift
//  surfTestTask
//
//  Created by Ivan Savkov on 6.02.23.
//  
//

import UIKit

final class TraineeRouter {
    var viewController: UIViewController?
    var moduleDependencies = AppDependency.makeDefault()
}

extension TraineeRouter: TraineeRouterInput {
    
    func showAlert() {
        guard let viewController = viewController else { return }
            let alert = UIAlertController(title: "Поздравляем!",
                                          message: "Ваша заявка успешно отправлена!",
                                          preferredStyle: .alert)
            let action = UIAlertAction(title: "Закрыть", style: .cancel)
            alert.addAction(action)
            viewController.present(alert, animated: true, completion: nil)
    }
}
