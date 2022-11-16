//
//  User.swift
//  TestApp
//
//  Created by Alex Chmal on 16.11.22.
//

import SwiftUI

struct User: Identifiable {
    var id: Int {
        self.shortInfo.userID
    }
    
    let shortInfo: UserInfo
    let posts: [Post]
}
