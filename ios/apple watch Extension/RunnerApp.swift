//
//  RunnerApp.swift
//  apple watch Extension
//
//  Created by Beyazıt Bestami Sarıkaya on 16.01.2021.
//

import SwiftUI

@main
struct RunnerApp: App {
    @SceneBuilder var body: some Scene {
        WindowGroup {
            NavigationView {
                ContentView()
            }
        }

        WKNotificationScene(controller: NotificationController.self, category: "myCategory")
    }
}
