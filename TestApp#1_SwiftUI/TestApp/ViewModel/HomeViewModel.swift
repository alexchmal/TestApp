//
//  HomeViewModel.swift
//  TestApp
//
//  Created by Alex Chmal on 16.11.22.
//

import SwiftUI

protocol HomeViewModelProtocol {
    var userList: [User] { get }
    var state: HomeViewModel.AppState { get }
    func loadData()
}

class HomeViewModel: HomeViewModelProtocol & ObservableObject {
    
    enum AppState: Int {
        case loading, ready
    }
    
    let interactor: HomeModuleInteractorProtocol
    
    @Published var userList: [User] = []
    @Published var state: AppState = .ready
    
    init(interactor: HomeModuleInteractorProtocol) {
        self.interactor = interactor
    }
    
    func loadData() {
        state = .loading
        interactor.getUsers { result in
            switch result {
            case .success(let list):
                self.userList = list
            default:
                break
            }
            self.state = .ready
        }
    }
}
