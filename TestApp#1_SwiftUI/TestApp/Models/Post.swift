//
//  Post.swift
//  TestApp
//
//  Created by Alex Chmal on 16.11.22.
//

struct Post: Codable, Identifiable {
    let userID, id: Int
    let title, body: String

    enum CodingKeys: String, CodingKey {
        case userID = "userId"
        case id, title, body
    }
}
