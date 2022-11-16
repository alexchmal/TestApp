//
//  HomeProtocols.swift
//  TestApp
//
//  Created by Alex Chmal on 15.11.22.
//

import UIKit

protocol HomeModuleInteractorProtocol {
    func getUsers(completion: @escaping (Result<[User], APIErorr>) -> ())
}

protocol HomePresenterProtocol {
    var view: HomeViewProtocol? { get set }
    var itemCount: Int { get }
    
    func loadSource()
    func configure(cell: HomeTableViewCellProtocol, index: Int)
    func showDetails(index: Int)
}

protocol HomeWireframeProtocol {
    static func buildModule() -> UIViewController
}

protocol HomeRouterProtocol {
    var view: UIViewController? { set get }
    func showDetails(user: User)
}

protocol HomeViewProtocol: AnyObject {
    func showActivityIndicator(loading: Bool)
    func reloadSource()
}
