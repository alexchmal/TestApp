//
//  UserInfo.swift
//  TestApp
//
//  Created by Alex Chmal on 16.11.22.
//

import Foundation

struct UserInfo: Codable, Hashable {
    let albumID, userID: Int
    let name: String
    let url, thumbnailURL: String

    enum CodingKeys: String, CodingKey {
        case albumID = "albumId"
        case userID = "userId"
        case name, url
        case thumbnailURL = "thumbnailUrl"
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(userID)
    }
}
