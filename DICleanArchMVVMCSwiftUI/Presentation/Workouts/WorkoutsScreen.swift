//
//  WorkoutsScreen.swift
//  DICleanArchMVVMCSwiftUI
//
//  Created by kaiserdem  on 20.12.2023.
//

import SwiftUI

struct WorkoutsScreen: View {
    
    @EnvironmentObject private var viewModel: WorkoutsViewModel
    
    @ObservedObject var coordinator: Coordinator
    @Binding var activeTab: Tab
    
    var body: some View {
        NavigationStack(path: $coordinator.workoutsStack) {
            VStack {
                
                Text("Workouts")
                    .font(.title)
                Spacer()
                
                Button {
                    coordinator.workoutsStack.append(Workouts.workoutsTwo)
                } label: {
                    Text("Go to Workouts Screen Two")
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(.purple)
                .padding(10)
                .background(Color.white)
                
                Button {
                    coordinator.workoutsStack.append(Workouts.workoutsTwo)
                    coordinator.workoutsStack.append(Workouts.workoutsThree)
                } label: {
                    Text("Go to Workouts Screen Three")
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(.purple)
                .padding(10)
                .background(Color.white)
                
                Button {
                    activeTab = .nutrition
                } label: {
                    Text("Go to Tab Nutition Screen")
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(.green)
                .padding(10)
                .background(Color.white)

                
                Button {
                    activeTab = .nutrition
                    coordinator.nutritionStack.append(Nutition.nutitionTwo)
                } label: {
                    Text("Go to Tab Nutition Screen 2")
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(.green)
                .padding(10)
                .background(Color.white)

                Button {
                    activeTab = .login
                } label: {
                    Text("Back to Login screen")
                }
                .frame(maxWidth: .infinity)
                .foregroundColor(.yellow)
                .padding(10)
                .background(Color.white)
                
                
                Button("Add workout to list") {
                    viewModel.addWorkout()
                }
                
                .frame(maxWidth: .infinity)
                .font(.title3)
                .foregroundColor(.black)
                .padding(10)
                
                List {
                    ForEach(viewModel.workouts) { workout in
                        Text("\(workout.name!), sets: \(workout.sets), reps:\(workout.reps), weight: \(workout.weight) kg")
                            .listRowInsets(.init(top: 10, leading: 0, bottom: 0, trailing: 10))
                            .onTapGesture {
                                coordinator.nutritionStack.append(Nutition.nutitionTwo)
                            }
                    }
                }
                .listStyle(PlainListStyle())
                
                .navigationDestination(for: Workouts.self) { screen in
                    
                    switch screen {
                    case .workoutsTwo:
                        WorkoutsScreenTwo(coordinator: coordinator, activeTab: $activeTab)
                        
                    case .workoutsThree:
                        WorkoutsScreenThree(coordinator: coordinator, activeTab: $activeTab)
                        
                    default:
                        Text("Detail with some view")
                    }
                }
                
                .navigationDestination(for: Nutition.self) { screen in
                    
                    switch screen {
                    case .nutitionTwo:
                        NutritionScreenTwo(coordinator: coordinator, activeTab: $activeTab)
                        
                    default:
                        Text("Detail with some view")
                    }
                }
                
                
            }
            .frame(maxWidth: .infinity)
            .background(Color.purple.opacity(0.7))
        }
    }
}
