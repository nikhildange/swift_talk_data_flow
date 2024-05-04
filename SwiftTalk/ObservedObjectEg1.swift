//
//  ObservedObjectEg1.swift
//  SwiftTalk
//
//  Created by Nikhil on 04/05/24.
//

import SwiftUI

// 1. Observable object defined here
class UserData: ObservableObject {
    @Published var username = "Nikhil"
}

// Parent view that holds the UserData object
struct ParentView1: View {
    // 2. Instance of source of truth created inside the relevant view
    @StateObject var userData = UserData()

    var body: some View {
        VStack {
            Text("Parent View \(userData.username)")
            ChildView1(userData: userData)
            // 3. Pass the UserData object to the ChildView
        }
        .padding()
        .background(Color.blue.opacity(0.2))
    }
}

// Child view that observes the UserData object
struct ChildView1: View {
    @ObservedObject var userData: UserData
    // 4. Property wrapper to recieve and accept source of truth from parent View

    var body: some View {
        VStack {
            // 5. Access the VM & update UI based on changes
            Text("Hello, \(userData.username)!")
            TextField("Enter username", text: $userData.username)
                .padding()
                .background(Color.white.opacity(0.2))
        }
        .padding()
        .background(Color.yellow.opacity(0.2))
    }
}

#Preview {
    ParentView1()
}
