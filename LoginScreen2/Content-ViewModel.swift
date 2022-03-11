//
//  Content-ViewModel.swift
//  LoginScreen2
//
//  Created by Federico on 11/03/2022.
//

import Foundation
import SwiftUI

extension ContentView {
    class ViewModel: ObservableObject {
        @AppStorage("AUTH_KEY") var authenticated = false {
            willSet { objectWillChange.send() }
        }
        @Published var username = "codepalace2022" // Keep filled ONLY for debugging
        @Published var password = "youtube123" // Keep filled ONLY for debugging
        @Published var introMessage = "Log on to your account:"
        
        init() {
            // Debugging
            print("Currently logged on: \(authenticated)")
        }
        
        func toggleAuthentication() {
            // Make sure that the password does not save.
            self.password = ""
            self.introMessage = "Log on to your account:"
            
            withAnimation(.spring()) {
                authenticated.toggle()
            }
        }

        func authenticate() {
            // Check for user
            guard self.username.lowercased() == "codepalace2022" else {
                self.introMessage = "Username not found..."
                return }
            
            // Check for password
            guard self.password.lowercased() == "youtube123" else {
                self.introMessage = "Password is incorrect..."
                return }
            
            toggleAuthentication()
        }
        
        func logOut() {
            toggleAuthentication()
        }
    }
}
