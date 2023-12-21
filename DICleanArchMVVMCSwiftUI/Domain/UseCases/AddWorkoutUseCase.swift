//
//  AddWorkoutUseCase.swift
//  DICleanArchMVVMCSwiftUI
//
//  Created by kaiserdem  on 20.12.2023.
//

import Foundation

class AddWorkoutUseCase {
    
    private let repository: AddWorkoutRepository

    public init(repository: AddWorkoutRepository) {
        self.repository = repository
    }
    
    public func execute(_ workout: WorkoutModel) {
        return repository.addWorkout(workout)
    }
    
}
