//
//  ibismacApp.swift
//  ibismac
//
//  Created by Ethan Eswaran on 22/6/2023.
//

import SwiftUI
import SwiftData

@main
struct ibismacApp: App {

    var body: some Scene {
        WindowGroup {
            ContentView()
        }
        .modelContainer(for: Item.self)
    }
}
