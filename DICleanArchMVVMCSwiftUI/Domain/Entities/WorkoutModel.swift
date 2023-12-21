//
//  WorkoutModel.swift
//  DICleanArchMVVMCSwiftUI
//
//  Created by kaiserdem  on 20.12.2023.
//

import Foundation

struct WorkoutModel: Identifiable, Codable, Hashable {
    var id = UUID().uuidString
    let name: String
    let date: Date
    let reps: Int
    let sets: Int
    let weight: Float
}
