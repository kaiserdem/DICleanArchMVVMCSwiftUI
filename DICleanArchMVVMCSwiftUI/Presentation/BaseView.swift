//
//  ContentView.swift
//  DICleanArchMVVMCSwiftUI
//
//  Created by Yaroslav Golinskiy on 20.12.2023.
//

import SwiftUI

struct BaseView: View {
    
    @ObservedObject var coordinator = Coordinator()
    @State var activeTab = Tab.login
    
    @Dependency(\.features.contentFeature.getWorkoutsUseCase) var getWorkoutsUseCase
    @Dependency(\.features.contentFeature.addWorkoutUseCase) var addWorkoutUseCase


    var body: some View {
            if activeTab == .login {
                LoginScreen(coordinator: coordinator, activeTab: $activeTab)
            } else {
                TabView(selection: $activeTab.onUpdate {
                    coordinator.tabClicked(activeTab)
                }) {
                    WorkoutsScreen(coordinator: coordinator, activeTab: $activeTab)
                        .tabItem {
                            Label("Workouts", systemImage: "figure.run")
                        }
                        .tag(Tab.workouts)
                        .environmentObject(WorkoutsViewModel(getWorkoutsUseCase, addWorkoutUseCase))

                    
                    NutritionScreen(coordinator: coordinator, activeTab: $activeTab)
                        .tabItem {
                            Label("Nutrition", systemImage: "fork.knife.circle.fill")
                        }
                        .tag(Tab.nutrition)
                    
                    SettingsScreen(coordinator: coordinator, activeTab: $activeTab)
                        .tabItem {
                            Label("Settings", systemImage: "person.crop.circle")
                        }
                        .tag(Tab.settings)
                    
                }
                .onChange(of: activeTab) { tab in
                    print(tab)
                }
            }
    }

}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        BaseView()
    }
}

