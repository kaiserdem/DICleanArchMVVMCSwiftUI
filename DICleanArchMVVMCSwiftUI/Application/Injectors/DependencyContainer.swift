//
//  DependencyContainer.swift
//  DICleanArchMVVMCSwiftUI
//
//  Created by kaiserdem  on 20.12.2023.
//

import Foundation

class DependencyContainer: ObservableObject {
    var features: FeaturesContainer
    
    init() {
        self.features = FeaturesContainer()
    }
}
