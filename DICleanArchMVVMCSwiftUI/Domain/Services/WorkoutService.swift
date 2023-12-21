//
//  WorkoutService.swift
//  DICleanArchMVVMCSwiftUI
//
//  Created by kaiserdem  on 20.12.2023.
//

import Combine
import CoreData

class WorkoutService: WorkoutServiceProtocol {
    
    private let container: NSPersistentContainer
    private let containerName: String = "WorkoutsContainer"
    private let workoutEntityName: String = "Workout"
    
    var workoutPublisher: Published<[Workout]>.Publisher? { $workouts }
    @Published var workouts: [Workout] = []
    
    private var cancellables = Set<AnyCancellable>()
        
    init() {
        print("___ init ProductDataService")

        container = NSPersistentContainer(name: containerName)
        container.loadPersistentStores { _, error in
            
            if let error = error {
                print("Error loading Core Data! \(error)")
            }
            
            self.getWorkouts()
        }
    }
    
    private func getWorkouts() {
        let request = NSFetchRequest<Workout>(entityName: workoutEntityName)
        
        do {
            workouts = try container.viewContext.fetch(request)

        } catch let error {
            print("Error fetching my products Entities. \(error)")
        }
    }
    
    func addWorkout(_ workout: WorkoutModel) {
        add(workout: workout)
    }
    
    private func add(workout: WorkoutModel) {
        let entity = Workout(context: container.viewContext)
        entity.name = workout.name
        entity.sets = Int16(workout.sets)
        entity.weight = Float(workout.reps)
        entity.weight = workout.weight
        applyChanges()
    }
   
    private func save() {
        do {
            try container.viewContext.save()
        } catch let error {
            print("Error saving to Core Data. \(error)")
        }
    }
    
    private func applyChanges() {
        save()
        getWorkouts()

    }
}
