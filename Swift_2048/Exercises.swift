//
//  Exercises.swift
//  Swift_2048
//
//  Created by e980492 on 7/30/20.
//  Copyright © 2020 Fifth Third Bank. All rights reserved.
//

import SwiftUI

// ------------------------------- TWO -------------------------------------

struct ExerciseOne: View {
    
    //Put two labels.
    // Make one label red
    // Make the other blue, with green background
    // Set the background to orange
    
    var body: some View {
        Text("FixMe")
    }
}

struct ExerciseOne_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseOne().previewLayout(.sizeThatFits)
    }
}

// ------------------------------- TWO -------------------------------------

struct ExerciseTwo: View {
    
    //make a rectangle
    //make the corners rounded any radius
    // HINT - RoundedRectangle
    //make text in the rectangle
    // HINT - ZStack
    
    var body: some View {
      Text("FixMe")
    }
}

struct ExerciseTwo_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseTwo().previewLayout(.sizeThatFits).padding()
    }
}

// ------------------------------- THREE -------------------------------------

struct ExerciseThree: View {
    
    //display a list of text for do, re, mi, fa, sol, la, ti, do
    
    var soundOfMusic = ["do", "re", "mi", "fa", "sol", "la", "ti", "do"]
    
    var body: some View {
       Text("FixMe")
    }
}

struct ExerciseThree_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseThree().previewLayout(.sizeThatFits)
    }
}

// ------------------------------- FOUR -------------------------------------

struct ExerciseFour: View {
    
    // Make Simon Says layout using the PiShape below.
    
    var body: some View {
       Text("FixMe")
    }

}

struct ExerciseFour_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseFour().previewLayout(.fixed(width: 340, height: 350))
    }
}


private struct PiShape: Shape {
    enum Position {
        case topLeft
        case topRight
        case bottomRight
        case bottomLeft
    }
    
    private var position: Position
    
    func path(in rect: CGRect) -> Path {
        let legLength = min(rect.height, rect.width)
        var start = CGPoint.zero
        var firstLeg = CGPoint.zero
        var controlPoint = CGPoint.zero
        var secondLeg = CGPoint.zero
        
        switch position {
        case .bottomLeft:
            start = CGPoint(x: rect.width, y: 0)
            firstLeg = CGPoint(x: 0, y: 0)
            secondLeg = CGPoint(x: legLength, y: legLength)
            controlPoint = CGPoint(x: 0, y: legLength)
        case .bottomRight:
            start = CGPoint.zero
            firstLeg = CGPoint(x: legLength, y: 0)
            secondLeg = CGPoint(x: 0, y: legLength)
            controlPoint = CGPoint(x: legLength, y: legLength)
        case .topLeft:
            start = CGPoint(x: rect.width, y: rect.height)
            firstLeg = CGPoint(x: 0, y: rect.height)
            secondLeg = CGPoint(x: rect.width, y: rect.height - legLength)
            controlPoint = CGPoint(x:0, y: rect.height-legLength)
        case .topRight:
            start = CGPoint(x: 0, y: rect.height)
            firstLeg = CGPoint(x: rect.width, y: rect.height)
            secondLeg = CGPoint(x: 0, y: rect.height - legLength)
            controlPoint = CGPoint(x: rect.width, y: rect.height - legLength)
        }
        
        var path = Path()
        path.move(to: start)
        path.addLine(to: firstLeg)
        path.addQuadCurve(to: secondLeg, control: controlPoint)
        path.addLine(to: secondLeg)
        return path
    }
    
    init(_ position: Position) {
        self.position = position
    }
}
