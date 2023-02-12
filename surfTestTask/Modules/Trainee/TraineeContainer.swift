//
//  TraineeContainer.swift
//  surfTestTask
//
//  Created by Ivan Savkov on 6.02.23.
//  
//

import UIKit

final class TraineeContainer {
    let input: TraineeModuleInput
	let viewController: UIViewController
	private(set) weak var router: TraineeRouterInput!

	static func assemble(with context: TraineeContext) -> TraineeContainer {
        let router = TraineeRouter()
        let interactor = TraineeInteractor(ds: context.moduleDependencies.dataStore)
        let presenter = TraineePresenter(router: router, interactor: interactor)
		let viewController = TraineeViewController(output: presenter)
        
        router.viewController = viewController
        
		presenter.view = viewController
		presenter.moduleOutput = context.moduleOutput

		interactor.output = presenter

        return TraineeContainer(view: viewController, input: presenter, router: router)
	}

    private init(view: UIViewController, input: TraineeModuleInput, router: TraineeRouterInput) {
		self.viewController = view
        self.input = input
		self.router = router
	}
}

struct TraineeContext {
	weak var moduleOutput: TraineeModuleOutput?
    let moduleDependencies: ModuleDependencies
}

typealias ModuleDependencies = HasDependencies
