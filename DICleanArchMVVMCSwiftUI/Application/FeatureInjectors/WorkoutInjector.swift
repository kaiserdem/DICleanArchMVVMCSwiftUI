//
//  WorkoutInjector.swift
//  DICleanArchMVVMCSwiftUI
//
//  Created by kaiserdem  on 20.12.2023.
//

class WorkoutInjector {
    
    //MARK: - Datasources
    lazy var workoutService: WorkoutServiceProtocol = {
        WorkoutService()
    }()
    
    //MARK: - Repositories
    lazy var getWorkoutsRepository: GetWorkoutsRepository = {
        GetWorkoutsRepositoryImplementation(service: workoutService as! WorkoutService)
    }()
    
    lazy var addWorkoutRepository: AddWorkoutRepository = {
        AddWorkoutRepositoryImplementation(service: workoutService as! WorkoutService)
    }()
    
    
    //MARK: - UseCases
    lazy var getWorkoutsUseCase: GetWorkoutsUseCase = {
        GetWorkoutsUseCase(repository: getWorkoutsRepository)
    }()
    
    lazy var addWorkoutUseCase: AddWorkoutUseCase = {
        AddWorkoutUseCase(repository: addWorkoutRepository)
    }()
}
