//
//  LoginView.swift
//  SwiftUISampleLogin1
//
//  Created by Abhinav        on 26/02/26.
//

import SwiftUI


struct LoginView: View {
    
    @State private var userName = "test@swiftui.in"
    @State private var password = "123456"
    @State private var isNameValid = true
    @State private var isPasswordValid = true
    @State private var vm: LoginVM = LoginVM()
    @Environment(AppRouter.self) var router
    
    var body: some View {
        
        VStack(alignment: .center) {
            Text("Welcome back!")
                .font(.system(size: 40, weight: .bold))
            
            Text("Enter your credentials for login")
                .font(.caption)
            
            Spacer()
                .frame(height: 90)
            
            VStack {
                HStack {
                    Image(systemName: "person.fill")
                        .padding()
                        .foregroundStyle(isNameValid ? Color.black : Color.red)
                    
                    TextField("Username", text: $userName)
                        .frame(height: 50)
                        .onChange(of: userName) { oldValue, newValue in
                            if newValue.count > 6 {
                                isNameValid = true
                            } else {
                                isNameValid = false
                            }
                        }
                }
                .background(Color.yellow)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isNameValid ? Color.yellow : Color.red, lineWidth: 3)
                )
                
                HStack {
                    Image(systemName: "lock.fill")
                        .padding()
                        .foregroundStyle(isPasswordValid ? Color.black : Color.red)
                    
                    TextField("Password", text: $password)
                        .frame(height: 50)
                        .onChange(of: password) { oldValue, newValue in
                            if newValue.count > 5 {
                                isPasswordValid = true
                            } else {
                                isPasswordValid = false
                            }
                        }
                }
                .background(Color.yellow)
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
                .overlay(
                    RoundedRectangle(cornerRadius: 10)
                        .stroke(isPasswordValid ? Color.yellow : Color.red, lineWidth: 3)
                )
                
                VStack {
                    Button("Login Now"){
                        if vm.onValidate(userName: userName, password: password) {
                            router.setRoot(.main(.home))
                        }
                    }
                    .frame( maxWidth: .infinity)
                    .frame(height: 50)
                    .background(Color.red)
                    .tint(.white)
                    .font(.headline)
                    .disabled(userName.isEmpty)
                    .disabled(password.isEmpty)
                    .disabled(!isNameValid)
                    .disabled(!isPasswordValid)
                }
                .clipShape(RoundedRectangle(cornerRadius: 10, style: .circular))
            }
            .padding(.horizontal,30)
            
            Spacer()
                .frame(height: 90)
            
            Text("Forgot Password?")
                .font(.system(.subheadline, weight: .bold))
                .foregroundStyle(.red)
            
            Spacer()
                .frame(height: 140)
            
            HStack {
                Text("Don't have an account?")
                    .underline()
                
                Text("Sign Up")
                    .font(.system(.subheadline, weight: .bold))
                    .foregroundStyle(.red)
                    .underline()
            }
        }
        .padding()
    }
}

#Preview {
    LoginView()
}
