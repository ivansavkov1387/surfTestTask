//
//  SceneDelegate.swift
//  surfTestTask
//
//  Created by Ivan Savkov on 6.02.23.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {
    
    var window: UIWindow?
    
    let appDependency: AppDependency = AppDependency.makeDefault()

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {
        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let context = TraineeContext(moduleDependencies: appDependency)
        let container = TraineeContainer.assemble(with: context)
        window?.rootViewController = container.viewController
        window?.makeKeyAndVisible()
        
    }



}

