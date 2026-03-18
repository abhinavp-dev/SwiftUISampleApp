//
//  AppEntry.swift
//  SwiftUISampleLogin1
//
//  Created by Abhinav        on 17/03/26.
//
import SwiftUI

struct AppEntry: View {
    @StateObject private var router = AppRouter()

    var body: some View {
        NavigationStack(path: $router.path) {

            // Initial screen
            LoginView()
                

                .navigationDestination(for: AppRoute.self) { route in
                    switch route {

                    // AUTH FLOW
                    case .auth(let authRoute):
                        switch authRoute {
                        case .login:
                            LoginView()
                        }

                    // MAIN FLOW
                    case .main(let mainRoute):
                        switch mainRoute {
                        case .home:
                            ProductListView()
                                
                        }
                    }
                }
        }
        .environmentObject(router)
    }
}
