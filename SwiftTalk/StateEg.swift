//
//  StateEg.swift
//  SwiftTalk
//
//  Created by Nikhil on 03/05/24.
//

import SwiftUI

struct CounterViewSimple: View {
    @State private var count = 0 // Applicable to value type

    var body: some View {
        VStack {
            Text("Counter: \(count)")
            Button("Increment") {
                // Incrementing the count
                count += 1
            }
        }
    }
}

#Preview {
    CounterViewSimple()
}
