//
//  DetailsWireframe.swift
//  TestApp
//
//  Created by Alex Chmal on 16.11.22.
//

import UIKit

struct DetailsWireframe {
    static func buildModule(user: User) -> UIViewController {
        let detailsView = DetailsViewController()
        let presenter = DetailsPresenter(user: user)

        detailsView.presenter = presenter
        presenter.view = detailsView
        
        return detailsView
    }
}
