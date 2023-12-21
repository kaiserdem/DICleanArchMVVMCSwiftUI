//
//  WorkoutServiceProtocol.swift
//  DICleanArchMVVMCSwiftUI
//
//  Created by kaiserdem  on 20.12.2023.
//

import Foundation

protocol WorkoutServiceProtocol {
    var workoutPublisher: Published<[Workout]>.Publisher? { get }
    func addWorkout(_ workout: WorkoutModel)
}
