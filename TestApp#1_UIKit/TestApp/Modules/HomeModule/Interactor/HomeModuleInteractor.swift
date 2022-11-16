//
//  HomeModuleInteractor.swift
//  TestApp
//
//  Created by Alex Chmal on 16.11.22.
//

import Foundation

class HomeModuleInteractor: HomeModuleInteractorProtocol {
    var apiManager = APIManager()
    
    func getUsers(completion: @escaping (Result<[User], APIErorr>) -> ()) {
        guard let usersURL = URL(string: baseURL + APIEndpoint.users.rawValue),
              let postURL = URL(string: baseURL + APIEndpoint.posts.rawValue) else {
            return
        }
        var errorList: [APIErorr] = []
        var userInfoList: [UserInfo] = []
        
        let groupe = DispatchGroup()
        
        groupe.enter()
        apiManager.get(url: usersURL, parameters: nil) { result in
            switch result {
            case .success(let data):
                guard let data = data else {
                    errorList.append(APIErorr.custome(message: "Wrong JSON format"))
                    groupe.leave()
                    return
                }
                do {
                    let infoList = try JSONDecoder().decode([UserInfo].self, from: data)
                    userInfoList = infoList
                    groupe.leave()
                    
                } catch let error {
                    errorList.append(APIErorr.custome(message: error.localizedDescription))
                    groupe.leave()
                }
                
            case .failure(let error):
                errorList.append(APIErorr.custome(message: error.localizedDescription))
                groupe.leave()
            }
        }
        
        var postList: [Post] = []
        
        groupe.enter()
        apiManager.get(url: postURL, parameters: nil) { result in
            switch result {
            case .success(let data):
                guard let data = data else {
                    errorList.append(APIErorr.custome(message: "Wrong JSON format"))
                    groupe.leave()
                    return
                }
                do {
                    let list = try JSONDecoder().decode([Post].self, from: data)
                    postList = list
                    groupe.leave()
                    
                } catch let error {
                    errorList.append(APIErorr.custome(message: error.localizedDescription))
                    groupe.leave()
                }
                
            case .failure(let error):
                errorList.append(APIErorr.custome(message: error.localizedDescription))
                groupe.leave()
            }
        }
       
        groupe.notify(queue: .main) {
            var users: [User] = []
            for info in userInfoList {
                users.append(User(shortInfo: info, posts: postList.filter({ $0.userID == info.userID})))
            }
            completion(.success(users))
        }
    }
}
