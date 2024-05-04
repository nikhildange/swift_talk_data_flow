//
//  BindingEg.swift
//  SwiftTalk
//
//  Created by Nikhil on 03/05/24.
//

import SwiftUI

struct ChildView: View {
    @Binding var value: Int // Binding in Child View

    var body: some View {
        Text("Child Value: \(value)")
        Button("Increment") {
            value += 1
        }
    }
}

struct ParentView: View {
    @State private var value = 0

    var body: some View {
        Text("Parent Value: \(value)")
        ChildView(value: $value)
    }
}

#Preview {
    ParentView()
}
