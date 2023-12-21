//
//  DICleanArchMVVMCSwiftUIApp.swift
//  DICleanArchMVVMCSwiftUI
//
//  Created by Yaroslav Golinskiy on 20.12.2023.
//

import SwiftUI

@main
struct DICleanArchMVVMCSwiftUIApp: App {
    var body: some Scene {
        WindowGroup {
            BaseView()
                .environmentObject(DependencyContainer())

        }
    }
}
