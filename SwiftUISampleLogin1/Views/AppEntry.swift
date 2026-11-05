//
//  AppEntry.swift
//  SwiftUISampleLogin1
//
//  Created by Abhinav        on 17/03/26.
//
import SwiftUI

struct AppEntry: View {
    @State private var router = AppRouter()

    var body: some View {
        NavigationStack(path: $router.path) {

            LoginView()
                .navigationDestination(for: AppRoute.self) { route in
                    switch route {
                    case .auth(let authRoute):
                        switch authRoute {
                        case .login:
                            LoginView()
                        }
                    case .main(let mainRoute):
                        switch mainRoute {
                        case .home:
                            RootView()
                        case .about:
                            AboutView()
                        }
                    }
                }
        }
        .environment(router)
    }
}
