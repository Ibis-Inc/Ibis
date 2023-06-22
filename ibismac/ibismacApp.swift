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
