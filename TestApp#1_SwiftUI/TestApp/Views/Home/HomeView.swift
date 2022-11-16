//
//  ContentView.swift
//  TestApp
//
//  Created by Alex Chmal on 16.11.22.
//

import SwiftUI

struct HomeView<Data: HomeViewModelProtocol & ObservableObject>: View {
    @EnvironmentObject var source: Data
    
    var body: some View {
        NavigationView {
            if source.state == .ready {
                ScrollView {
                    ForEach(source.userList) { user in
                        NavigationLink {
                            DetailsView(user: user)
                        } label: {
                            UserView(user: user)
                        }
                    }
                }
                .navigationBarTitle(String(localized: "Users", table: "Localizable"))
                .navigationBarTitleDisplayMode(.inline)
            } else {
                ProgressView()
            }
        }
        
        .onAppear{
            source.loadData()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView<HomeViewModel>()
            .environmentObject(HomeViewModel(interactor: HomeModuleInteractor()))
    }
}
