//
//  EnvironmentObjEg.swift
//  SwiftTalk
//
//  Created by Nikhil on 04/05/24.
//

import SwiftUI

// 1. Observable object defined here
class PurchaseViewModel: ObservableObject {
    // 2. Property to observe and write too
    @Published var hasPurchasedSubscription: Bool = false
}

//@main
struct TestProjectApp: App {
    // 3. Instance of source of truth created at the root
    @StateObject var vm = PurchaseViewModel()
    var body: some Scene {
        WindowGroup {
            ContentView()
                .environmentObject(vm) // 4. Modifier to pass in root source of truth to child view
        }
    }
}

struct ContentViews: View {
    // 5. Property wrapper to recieve and accept root source of truth from parent aka (TestProjectApp)
    @EnvironmentObject var purchaselm: PurchaseViewModel
    var body: some View {
        PurchasedView() // 6. No need to inject environment object, since it now is accessible via the parent aka (ContentViews)
    }
}

struct PurchasedView: View {
    // 7. Property wrapper to recieve and accept root source of truth from parent aka (ContentViews)
    @EnvironmentObject var purchasem: PurchaseViewModel
    var body: some View {
        // 8. Read from the source of truth (PurchaseViewModel) from the root (TestProjectApp) and reflect changes in the UI
        Text(purchasem.hasPurchasedSubscription ? "User has purchased" : "User hasn't purchased")
    }
}
