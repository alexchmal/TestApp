//
//  HomeRouter.swift
//  TestApp
//
//  Created by Alex Chmal on 16.11.22.
//

import UIKit

class HomeRouter: HomeRouterProtocol {
    weak var view: UIViewController?
    
    func showDetails(user: User) {
        view?.navigationController?.pushViewController(DetailsWireframe.buildModule(user: user), animated: true)
    }
}
