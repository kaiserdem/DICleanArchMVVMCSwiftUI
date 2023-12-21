//
//  GetWorkoutsRepository.swift
//  DICleanArchMVVMCSwiftUI
//
//  Created by kaiserdem  on 20.12.2023.
//

import Foundation

protocol GetWorkoutsRepository {
    func getWorkouts() -> Published<[Workout]>.Publisher?
}

class GetWorkoutsRepositoryImplementation: GetWorkoutsRepository {
    
    private let service: WorkoutService
    
    init(service: WorkoutService) {
        self.service = service
    }

    func getWorkouts() -> Published<[Workout]>.Publisher? {
        return service.workoutPublisher
    }

}
