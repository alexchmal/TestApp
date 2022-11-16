//
//  DetailsPresenter.swift
//  TestApp
//
//  Created by Alex Chmal on 16.11.22.
//

import Foundation

class DetailsPresenter: DetailsPresenterProtocol {
    let model: User
    weak var view: DetailsViewProtocol?
    
    init(user: User) {
        self.model = user
    }
    
    var itemCount: Int {
        model.posts.count
    }
    
    func prepareContent() {
        view?.updateHeaderImage(model.shortInfo.url)
    }
    
    func configure(cell: DetailsTableViewCellProtocol, index: Int) {
        let model = model.posts[index]
        cell.updateTitleLabel(text: model.title)
        cell.updateBodyCountLabel(text: model.body)
    }
}
