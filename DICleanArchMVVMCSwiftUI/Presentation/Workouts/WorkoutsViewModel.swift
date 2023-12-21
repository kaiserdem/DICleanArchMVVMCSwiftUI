//
//  WorkoutsViewModel.swift
//  DICleanArchMVVMCSwiftUI
//
//  Created by kaiserdem  on 20.12.2023.
//

import Combine
import Foundation

class WorkoutsViewModel: ObservableObject {
    
    private let getWorkoutsUseCase: GetWorkoutsUseCase
    private let addWorkoutUseCase: AddWorkoutUseCase

    var workoutPublisher: Published<[Workout]>.Publisher? { $workouts }
    @Published var workouts: [Workout] = []
    
    private var cancellables = Set<AnyCancellable>()
    
    init(_ getWorkoutsUseCase: GetWorkoutsUseCase, _ addWorkoutUseCase: AddWorkoutUseCase) {
        self.getWorkoutsUseCase = getWorkoutsUseCase
        self.addWorkoutUseCase = addWorkoutUseCase
        
        addSubscribers()
        
        print("___ init WorkoutsViewModel")
    }

    func addSubscribers()  {
        getWorkoutsUseCase.execute()?
            .sink { [weak self] newWorkouts in
                guard let self = self else { return }
                self.workouts = newWorkouts
            }
            .store(in: &cancellables)
    }
    
    func addWorkout() {
        addWorkoutUseCase.execute(WorkoutModel(name: "Push",
                                               date: Date.now,
                                               reps: 4,
                                               sets: 10,
                                               weight: 50))
    }
    
}
