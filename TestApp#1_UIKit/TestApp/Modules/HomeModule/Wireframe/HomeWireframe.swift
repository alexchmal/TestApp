//
//  HomeWireframe.swift
//  TestApp
//
//  Created by Alex Chmal on 15.11.22.
//

import UIKit

struct HomeWireframe: HomeWireframeProtocol {
    static func buildModule() -> UIViewController {
        let homeView = HomeViewController()
        let presenter = HomePresenter(interactor: HomeModuleInteractor())
        
        let router = HomeRouter()
        router.view = homeView
        
        presenter.router = router
        
        homeView.presenter = presenter
        presenter.view = homeView
        
        return UINavigationController(rootViewController: homeView)
    }
}
