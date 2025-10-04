//
//  ShoeAppAssignment.swift
//  ShoeAppAssignment
//
//  Created by Zhen Wai on 22/02/2024.
//

import SwiftUI
import FirebaseAuth
import FirebaseFirestore
import FirebaseCore


class AppDelegate: NSObject, UIApplicationDelegate {
  func application(_ application: UIApplication,
                   didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
    FirebaseApp.configure()

    return true
  }
}

@main
struct ShoeAppAssignmentApp: App {
    
    // register app delegate for Firebase setup
      @UIApplicationDelegateAdaptor(AppDelegate.self) var delegate

    var body: some Scene {
        WindowGroup {
            Onboard()
                .environmentObject(CartViewModel())
                .environmentObject(favouriteViewModel())
                .environmentObject(ordersViewModel())
        }
    }
}
