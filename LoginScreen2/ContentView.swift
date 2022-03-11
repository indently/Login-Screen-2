//
//  ContentView.swift
//  LoginScreen2
//
//  Created by Federico on 11/03/2022.
//

import SwiftUI

struct ContentView: View {
    @StateObject var vm = ViewModel()
    
    var body: some View {
        if vm.authenticated {
            // Show the view you want users to see when logged on
            
            VStack {
                Text("Welcome back **\(vm.username.lowercased())**!")
                    .padding()
                Button("Log out", action: vm.logOut)
                    .tint(.red)
                    .buttonStyle(.bordered)
            }
        } else {
            // Show a login screen
            
            ZStack {
                Circle()
                    .foregroundColor(.indigo.opacity(0.90))
                    .frame(height: 300)
                    .offset(x: -100, y: 0)
                Circle()
                    .foregroundColor(.red.opacity(0.90))
                    .frame(height: 300)
                    .offset(x: 100, y: 0)
                Circle()
                    .foregroundColor(.blue.opacity(0.90))
                    .frame(height: 400)
                
                VStack(spacing: 20) {
                    Spacer()
                    Text(vm.introMessage)
                        .foregroundColor(.white)
                    TextField("Username", text: $vm.username)
                        .textFieldStyle(.roundedBorder)
                        .cornerRadius(10)
                    SecureField("Password", text: $vm.password)
                        .textFieldStyle(.roundedBorder)
                        .cornerRadius(10)
                    Button("Log on", action: vm.authenticate)
                        .buttonStyle(.bordered)
                        .tint(.white)
                    
                    Spacer()
                }
                .padding()
            }
            .padding(5)
            .transition(.move(edge: .bottom))
            .ignoresSafeArea()
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
