//
//  LoginScreen.swift
//  DICleanArchMVVMCSwiftUI
//
//  Created by kaiserdem  on 20.12.2023.
//

import SwiftUI

struct LoginScreen: View {
    
    @ObservedObject var coordinator: Coordinator
    @Binding var activeTab: Tab

    var body: some View {
        NavigationStack(path: $coordinator.loginsStack) {
            VStack {
                
                Text("Login Screen")
                    .font(.title)
                Spacer()
                
                Button("Go to Login Two") {
                    coordinator.loginsStack.append(Login.loginTwo)
                }
                .foregroundColor(.purple)
                .padding(10)
                .background(Color.white)
                Spacer()
                
                Button("Go to Tab Workouts") {
                    activeTab = .workouts
                }
                .foregroundColor(.purple)
                .padding(10)
                .background(Color.white)
                Spacer()
                
            }
            .navigationDestination(for: Login.self) { screen in
                switch screen {
                case .loginTwo:
                    LoginScreenTwo(coordinator: coordinator, activeTab: $activeTab)
                    
                default:
                    Text("Detail with some view")
                }
            }
            
            .frame(maxWidth: .infinity)
            .background(Color.yellow.opacity(0.5))
        }
    }
}
