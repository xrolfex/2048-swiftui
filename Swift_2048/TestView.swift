//
//  TestView.swift
//  Swift_2048
//
//  Created by e980492 on 7/30/20.
//  Copyright © 2020 Fifth Third Bank. All rights reserved.
//

import SwiftUI

struct ExerciseOne: View {
    var body: some View {
        VStack(alignment: .leading){
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
            Text("Hi").foregroundColor(.red).background(Color.green)
        }.background(Color.blue)
    }
}

struct TestView_Previews: PreviewProvider {
    static var previews: some View {
        ExerciseOne()
    }
}
