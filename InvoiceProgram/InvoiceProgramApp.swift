//
//  InvoiceProgramApp.swift
//  InvoiceProgram
//
//  Created by Ernesto Carocca on 2023-01-18.
//

import SwiftUI
import Firebase
import FirebaseAuth

@main
struct InvoiceProgramApp: App{
        
    @UIApplicationDelegateAdaptor(AppDelagate.self) var appDelegate
   
    var body: some Scene {
        WindowGroup {
            let viewLoginUser = LoginUser()
            ContentView()
                .environmentObject(viewLoginUser)
        }
    }
}

class AppDelagate:NSObject ,UIApplicationDelegate {
    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey : Any]? = nil) -> Bool {
        FirebaseApp.configure()
        return true
    }
}
