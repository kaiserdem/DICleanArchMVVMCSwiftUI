//
//  FeaturesContainer.swift
//  DICleanArchMVVMCSwiftUI
//
//  Created by kaiserdem  on 20.12.2023.
//

class FeaturesContainer {
    
    lazy var contentFeature: WorkoutInjector = {
        WorkoutInjector()
    }()
}
