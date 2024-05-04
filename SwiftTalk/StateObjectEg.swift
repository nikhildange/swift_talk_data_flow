//
//  StateObjectEg.swift
//  SwiftTalk
//
//  Created by Nikhil on 03/05/24.
//

import SwiftUI

// 1. Simple counter view - update count from VM

// 2. VM that conform Obersvable Obj & count property
class CounterViewModel: ObservableObject {
    @Published var count: Int = 0

    func updateCount() {
        count += 1
//        objectWillChange.send()
    }
}

struct CounterView: View {
    // 3. Initialised VM inside view, it persist view's life cycle

    @StateObject var vm = CounterViewModel()

    var body: some View {
        // 4. Accesing VM
        Text("Count: \(vm.count)")
        Button {
            vm.updateCount()
        } label: {
            Text("Update Count")
        }
    }
}

#Preview {
    CounterView()
}
