//
//  DetailsProtocols.swift
//  TestApp
//
//  Created by Alex Chmal on 16.11.22.
//

import UIKit

protocol DetailsWireframeProtocol {
    static func buildModule() -> UIViewController
}

protocol DetailsPresenterProtocol {
    var itemCount: Int { get }
    func prepareContent()
    func configure(cell: DetailsTableViewCellProtocol, index: Int)
}

protocol DetailsViewProtocol: AnyObject {
    func updateHeaderImage(_ image: String)
}
