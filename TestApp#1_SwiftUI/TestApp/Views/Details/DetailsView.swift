//
//  DetailsView.swift
//  TestApp
//
//  Created by Alex Chmal on 16.11.22.
//

import SwiftUI

struct CornerRadiusShape: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct DetailsView: View {
    var user: User
    var body: some View {
        VStack {
            AsyncImage(url: URL(string: user.shortInfo.url),
                       content: { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 200)
                    .clipShape(CornerRadiusShape(radius: 30, corners: [.bottomLeft, .bottomRight]))
                
            }, placeholder: {
                ProgressView()
            })
            ScrollView {
                ForEach(user.posts) { post in
                    PostView(post: post)
                }
            }
            Spacer()
            
        }
    }
}

struct DetailsView_Previews: PreviewProvider {
    static var previews: some View {
        DetailsView(user: stubUser)
    }
}
