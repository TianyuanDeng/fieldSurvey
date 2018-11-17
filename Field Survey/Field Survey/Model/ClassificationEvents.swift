//
//  ClassificationEvents.swift
//  Field Survey
//
//  Created by Deng tianyuan on 11/16/18.
//  Copyright © 2018 Deng tianyuan. All rights reserved.
//

import Foundation

enum Classification: String, Codable {
    case amphibian
    case bird
    case fish
    case insect
    case mammal
    case plant
    case reptile
}

struct ClassificationEvent: Codable {
    var classification: Classification
    var title: String
    var description: String
    var date: Date
}

struct ClassificationEvents: Codable {
    var status: String
    var observations: [ClassificationEvent]
}

