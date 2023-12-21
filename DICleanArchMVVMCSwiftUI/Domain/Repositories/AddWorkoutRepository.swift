//
//  AddWorkoutRepository.swift
//  DICleanArchMVVMCSwiftUI
//
//  Created by kaiserdem  on 20.12.2023.
//

import Foundation

protocol AddWorkoutRepository {
    func addWorkout(_ workout: WorkoutModel)
}

class AddWorkoutRepositoryImplementation: AddWorkoutRepository {
    
    private let service: WorkoutService
    
    init(service: WorkoutService) {
        self.service = service
    }

    func addWorkout(_ workout: WorkoutModel) {
        return service.addWorkout(workout)
    }

}
