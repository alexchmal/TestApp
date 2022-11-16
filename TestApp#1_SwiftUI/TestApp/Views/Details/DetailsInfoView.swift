//
//  DetailsInfoView.swift
//  TestApp
//
//  Created by Alex Chmal on 16.11.22.
//

import SwiftUI

struct PostView: View {
    let post: Post
    var body: some View {
        VStack(spacing: 0) {
            HStack {
                Text(post.title)
                    .font(.title3)
                    .foregroundColor(.blue)
                Spacer()
            }
            .padding([.leading, .trailing, .top], 10)
            HStack {
                Text(post.body)
                    .foregroundColor(.blue)
                Spacer()
            }
            .padding(.all, 10)
        }
        .overlay {
            RoundedRectangle(cornerRadius: 20)
                .stroke(Color.blue, lineWidth: 1)
        }
        .padding([.leading, .trailing, .top], 10)
    }
}

struct PostView_Previews: PreviewProvider {
    static var previews: some View {
        PostView(post:Post(userID: 1, id: 1, title: "test", body: "test"))
    }
}
