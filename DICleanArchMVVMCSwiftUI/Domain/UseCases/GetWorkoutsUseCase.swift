//
//  GetWorkoutsUseCase.swift
//  DICleanArchMVVMCSwiftUI
//
//  Created by kaiserdem  on 20.12.2023.
//

import Foundation

class GetWorkoutsUseCase {
    
    private let repository: GetWorkoutsRepository

    public init(repository: GetWorkoutsRepository) {
        self.repository = repository
    }
    
    public func execute() -> Published<[Workout]>.Publisher? {
        return repository.getWorkouts()
    }
    
}
