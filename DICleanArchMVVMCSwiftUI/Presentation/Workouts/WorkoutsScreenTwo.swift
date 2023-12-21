//
//  WorkoutsScreenTwo.swift
//  DICleanArchMVVMCSwiftUI
//
//  Created by kaiserdem  on 20.12.2023.
//

import SwiftUI

struct WorkoutsScreenTwo: View {
    
    @ObservedObject var coordinator: Coordinator
    @Binding var activeTab: Tab

       var body: some View {
           VStack {
               
               Text("Workouts Two")
                   .font(.title)
               Spacer()
               
               Button {
                   coordinator.workoutsStack.append(Workouts.workoutsThree)
                   
               } label: {
                   Text("Go to Workouts Screen Three")
               }
               .padding(10)
               .background(Color.white)
               Spacer()
               
               Button {
                   activeTab = .nutrition
               } label: {
                   Text("Go to Tab Nutition Screen first")
               }
               .padding(10)
               .background(Color.white)
               
               Button {
                   activeTab = .nutrition
                   coordinator.nutritionStack.append(Nutition.nutitionTwo)

               } label: {
                   Text("Go to Tab Nutition Screen Two")
               }
               .padding(10)
               .background(Color.white)
               Spacer()
               
                   .navigationDestination(for: Workouts.self) { screen in
                       
                       switch screen {
                       case .workoutsThree:
                           WorkoutsScreenThree(coordinator: coordinator, activeTab: $activeTab)
                           
                       default:
                           Text("Detail with some view")
                       }
                   }
               
               
           }
           .frame(maxWidth: .infinity, maxHeight: .infinity)
           .background(Color.purple.opacity(0.4))
       }
}
