//
//  WorkoutsScreenThree.swift
//  DICleanArchMVVMCSwiftUI
//
//  Created by kaiserdem  on 20.12.2023.
//

import SwiftUI

struct WorkoutsScreenThree: View {
    
    @ObservedObject var coordinator: Coordinator
    @Binding var activeTab: Tab

    var body: some View {
        VStack {
            
            Text("Workouts Three")
                .font(.title)
                Spacer()
            
            Button {
                coordinator.workoutsStack = NavigationPath()
            } label: {
                Text("Go to Workouts first")
            }
            .padding(10)
            .background(Color.white)
            
            Button {
                if coordinator.workoutsStack.count > 0  {
                    coordinator.workoutsStack.removeLast()
                }
            } label: {
                Text("Go to Workouts Two")
            }
            .padding(10)
            .background(Color.white)
            Spacer()
            
            Button {
                activeTab = .nutrition
            } label: {
                Text("Go to Tab Nutrition")
            }
            .padding(10)
            .background(Color.white)
            Spacer()
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.purple.opacity(0.2))
    }
}
