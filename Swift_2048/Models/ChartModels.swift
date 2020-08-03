//
//  ChartModels.swift
//  Swift_2048
//
//  Created by Rolf, Eric on 8/14/19.
//  Copyright © 2019 Fifth Third Bank. All rights reserved.
//

import SwiftUI

/// Used to describe a legend item.
struct Legend: Hashable {

    /// Color for the legend item.
    let color: Color

    /// Text value to describe the `Legend ` struct.
    let label: String
}

/// Used to describe bar item.
struct Bar: Identifiable {

    /// Unique identifier for the `Bar` struct.
    let id: UUID

    /// Value that is being described.
    let value: Double

    /// Text value to describe the `Bar` struct.
    let label: String

    /// `Legend` struct that is the counter part display for the bar.
    let legend: Legend
}
