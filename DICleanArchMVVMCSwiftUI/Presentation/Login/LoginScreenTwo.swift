//
//  LoginScreenTwo.swift
//  DICleanArchMVVMCSwiftUI
//
//  Created by kaiserdem  on 20.12.2023.
//

import SwiftUI

struct LoginScreenTwo: View {
    
    @ObservedObject var coordinator: Coordinator
    @Binding var activeTab: Tab

    var body: some View {
        NavigationStack(path: $coordinator.loginsStack) {
            VStack {
                
                Text("Login Screen Two")
                    .font(.title)
                Spacer()
                
            }
            .frame(maxWidth: .infinity)
            .background(Color.yellow.opacity(0.5))
        }
    }
}
