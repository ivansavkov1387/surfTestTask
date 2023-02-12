//
//  TraineePresenter.swift
//  surfTestTask
//
//  Created by Ivan Savkov on 6.02.23.
//  
//

import Foundation

final class TraineePresenter {
	weak var view: TraineeViewInput?
    weak var moduleOutput: TraineeModuleOutput?
    
	private let router: TraineeRouterInput
	private let interactor: TraineeInteractorInput
    
    private var courses = Course.CourseModel()
    
    init(router: TraineeRouterInput, interactor: TraineeInteractorInput) {
        self.router = router
        self.interactor = interactor
    }
}

extension TraineePresenter: TraineeModuleInput {
}

extension TraineePresenter: TraineeViewOutput {
    func alert() {
        self.router.showAlert()
    }
    
    func viewDidLoad() {
        self.interactor.loadCourses()
    }
    
}

extension TraineePresenter: TraineeInteractorOutput {
    func didLoad(_ courses: Course.CourseModel) {
        self.view?.set(viewModels: makeViewModels(courses: courses))
    }
    
}

private extension TraineePresenter {
    func makeViewModels(courses: Course.CourseModel) -> [CourseViewModel] {
        return courses.map { course in
            CourseViewModel(name: course.name,
                            isPicked: false)
        }
    }
    
}
