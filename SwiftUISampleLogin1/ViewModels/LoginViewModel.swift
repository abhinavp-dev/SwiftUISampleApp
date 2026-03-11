//
//  LoginViewModel.swift
//  SwiftUISampleLogin1
//
//  Created by Abhinav        on 26/02/26.
//

import SwiftUI
internal import Combine

class LoginVM : ObservableObject {
    
    @Published var isLoading: Bool = false
    @Published var showSuccess: Bool = false
    
    let userName: String = "test@swiftui.in"
    let password: String = "123456"
    
    func onValidate(userName: String, password:String) -> Bool {
        if self.userName == userName && self.password == password  {
            return true
        } else {
            return false
        }
    }
}

