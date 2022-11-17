//
//  UserView.swift
//  TestApp
//
//  Created by Alex Chmal on 16.11.22.
//

import SwiftUI

let stubUser = User(shortInfo: UserInfo(albumID: 1, userID: 1, name: "Alex", url: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png", thumbnailURL: "https://upload.wikimedia.org/wikipedia/commons/thumb/b/b6/Image_created_with_a_mobile_phone.png/640px-Image_created_with_a_mobile_phone.png"), posts: [Post(userID: 1, id: 1, title: "test", body: "test")])

struct UserView: View {
    let user: User
    var body: some View {
        HStack {
            AsyncImage(url: URL(string: user.shortInfo.thumbnailURL),
                       content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(width: 60, height: 60)
                    .cornerRadius(30)
                
            }, placeholder: {
                ProgressView()
            })
            .padding()
            
            VStack(spacing: 8) {
                HStack {
                    Text(user.shortInfo.name)
                        .font(.title2)
                        .foregroundColor(.blue)
                    Spacer()
                }
                HStack {
                    Text("Post count: \(user.posts.count)")
                        .foregroundColor(.blue)
                    Spacer()
                }
                
            }
            Spacer()
        }
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.blue, lineWidth: 1)
        }
        .padding([.top, .bottom], 4)
        .padding([.leading, .trailing], 8)
    }
}

struct UserView_Previews: PreviewProvider {
    static var previews: some View {
        UserView(user: stubUser)
    }
}

