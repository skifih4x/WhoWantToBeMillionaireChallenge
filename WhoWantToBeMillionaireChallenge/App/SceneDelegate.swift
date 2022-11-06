//
//  SceneDelegate.swift
//  WhoWantToBeMillionaireChallenge
//
//  Created by Артем Орлов on 30.10.2022.
//

import UIKit

class SceneDelegate: UIResponder, UIWindowSceneDelegate {

    var window: UIWindow?

    func scene(_ scene: UIScene, willConnectTo session: UISceneSession, options connectionOptions: UIScene.ConnectionOptions) {

        guard let windowScene = (scene as? UIWindowScene) else { return }
        window = UIWindow(windowScene: windowScene)
        let viewController = StartViewController()
        let navigationcontroller = UINavigationController(rootViewController: viewController)
        window?.rootViewController = navigationcontroller
        window?.makeKeyAndVisible()
    }
}
