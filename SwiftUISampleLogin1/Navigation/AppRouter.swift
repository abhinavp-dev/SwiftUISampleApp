//
//  AppRouter.swift
//  SwiftUISampleLogin1
//
//  Created by Abhinav        on 17/03/26.
//


import SwiftUI

@Observable
class AppRouter {
    
    var path = NavigationPath()

    func push(_ route: AppRoute) {
        path.append(route)
    }

    func pop() {
        path.removeLast()
    }

    func reset() {
        path = NavigationPath()
    }

    func setRoot(_ route: AppRoute) {
        path = NavigationPath()
        path.append(route)
    }
}
