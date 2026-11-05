//
//  RootView.swift
//  SwiftUISampleLogin1
//
//  Created by Abhinav Parakkal on 05/11/26.
//


import SwiftUI

struct RootView: View {
    var body: some View {
        TabView {
            Tab("Items", systemImage: "list.bullet") {
                ProductListView()
            }
            Tab("About", systemImage: "person.circle.fill") {
                AboutView()
            }
            Tab("Settings", systemImage: "gear") {
                Text("Settings")   // placeholder for now
            }
        }
    }
}
