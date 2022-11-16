//
//  HomePresenter.swift
//  TestApp
//
//  Created by Alex Chmal on 15.11.22.
//

import UIKit

class HomePresenter: HomePresenterProtocol {
    let interactor: HomeModuleInteractorProtocol
    
    weak var view: HomeViewProtocol?
    var router: HomeRouterProtocol?
    
    private var dataSource: [User] = []
    
    var itemCount: Int {
        return dataSource.count
    }
    
    init(interactor: HomeModuleInteractorProtocol) {
        self.interactor = interactor
    }
    
    
    func loadSource() {
        view?.showActivityIndicator(loading: true)
        interactor.getUsers { [weak  self] result in
            
            guard let self = self else { return }
            
            self.view?.showActivityIndicator(loading: false)
            switch result {
            case .success(let albums):
                self.dataSource = albums
                self.view?.reloadSource()
            case .failure(let error):
                debugPrint(error.localizedDescription)
            }
        }
    }
    
    func configure(cell: HomeTableViewCellProtocol, index: Int) {
        let model = dataSource[index]
        cell.updateAvatar(urlString: model.shortInfo.thumbnailURL)
        cell.updateNameLabel(text: model.shortInfo.name)
        cell.updatePhotoCountLabel(text: "Post count: \(model.posts.count)")
    }
    
    func showDetails(index: Int) {
        let model = dataSource[index]
        router?.showDetails(user: model)
    }
}
