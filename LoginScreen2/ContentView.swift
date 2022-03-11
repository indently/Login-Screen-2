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
            VStack(spacing: 20) {
                Text("Welcome back **\(vm.username.lowercased())**!")
                Text("Today is: **\(Date().formatted(.dateTime))**")
                Button("Log out", action: vm.logOut)
                    .tint(.red)
                    .buttonStyle(.bordered)
            }
        } else {
            // Show a login screen
            ZStack {
                Image("sky")
                    .resizable()
                    .cornerRadius(20)
                    .ignoresSafeArea()
              
                VStack(alignment: .leading, spacing: 20) {
                    Spacer()
                    Text("Log in")
                        .foregroundColor(.white)
                        .font(.system(size: 40, weight: .medium, design: .rounded))
                        .underline()

                    TextField("Username", text: $vm.username)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                    SecureField("Password", text: $vm.password)
                        .textFieldStyle(.roundedBorder)
                        .textInputAutocapitalization(.never)
                        .privacySensitive()
                    HStack {
                        Spacer()
                        Button("Forgot password?", action: vm.logPressed)
                            .tint(.red.opacity(0.80))
                        Spacer()
                        Button("Log on",role: .cancel, action: vm.authenticate)
                            .buttonStyle(.bordered)
                        Spacer()
                    }
                    Spacer()
                }
                .alert("Access denied", isPresented: $vm.invalid) {
                    Button("Dismiss", action: vm.logPressed)
                }
                .frame(width: 300)
                .padding()
            }
            .transition(.offset(x: 0, y: 850))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
