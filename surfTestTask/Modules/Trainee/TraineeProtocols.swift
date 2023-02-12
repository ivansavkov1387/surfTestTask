//
//  TraineeProtocols.swift
//  surfTestTask
//
//  Created by Ivan Savkov on 6.02.23.
//  
//

import UIKit

protocol TraineeModuleInput {
	var moduleOutput: TraineeModuleOutput? { get }
}

protocol TraineeModuleOutput: AnyObject {
}

protocol TraineeViewsToController: AnyObject {
    func tappedButton()

}

protocol TraineeControllerToViews: AnyObject {
    func reloadData()
    
}

protocol TraineeViewInput: AnyObject {
    func set(viewModels: [CourseViewModel])
}

protocol TraineeViewOutput: AnyObject {
    func viewDidLoad()
    func alert()
}

protocol TraineeInteractorInput: AnyObject {
    func loadCourses()
}

protocol TraineeInteractorOutput: AnyObject {
    func didLoad(_ courses: Course.CourseModel)
}

protocol TraineeRouterInput: AnyObject {
    func showAlert()
}
