//
//  CardModel.swift
//  Learn by Doing
//
//  Created by Drashti on 21/12/23.
//

import SwiftUI

// MARK: - Card Model

struct Card: Identifiable {
    var id = UUID()
    var title: String
    var headLine: String
    var imageName: String
    var callToAction: String
    var message: String
    var gradientColors: [Color]
}
