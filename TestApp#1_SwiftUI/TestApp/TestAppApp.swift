//
//  TestAppApp.swift
//  TestApp
//
//  Created by Alex Chmal on 16.11.22.
//

import SwiftUI

@main
struct TestAppApp: App {
    @StateObject var state: HomeViewModel = HomeViewModel(interactor: HomeModuleInteractor())
    var body: some Scene {
        WindowGroup {
            HomeView<HomeViewModel>()
                .environmentObject(state)
                .environment(\.locale, Locale(identifier: "ar"))
                .environment(\.layoutDirection, .rightToLeft)
        }
    }
}
