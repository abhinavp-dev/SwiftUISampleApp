//
//  LoginViewModel.swift
//  SwiftUISampleLogin1
//
//  Created by Abhinav        on 26/02/26.
//

import Foundation

@Observable
class LoginVM  {
    
    var isLoading: Bool = false
    var showSuccess: Bool = false
    
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

