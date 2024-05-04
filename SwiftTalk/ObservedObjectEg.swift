//
//  ObservedObjectEg.swift
//  SwiftTalk
//
//  Created by Nikhil on 03/05/24.
//

import SwiftUI

class UserSettings: ObservableObject {
    @Published var themeColor: Color = .blue
}

struct ObservedObjectEg: View {
    @ObservedObject var userSettings: UserSettings

    var body: some View {
        VStack {
            Text("Theme Color: \(userSettings.themeColor.description)")
                .foregroundColor(userSettings.themeColor)

            Button("Change Theme Color") {
                userSettings.themeColor = .red
            }
        }
    }
}

#Preview {
    ObservedObjectEg(userSettings: UserSettings())
}
