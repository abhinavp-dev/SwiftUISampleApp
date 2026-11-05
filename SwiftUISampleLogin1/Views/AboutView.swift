//
//  SwiftUIView.swift
//  SwiftUISampleLogin1
//
//  Created by Abhinav Parakkal on 29/10/26.
//

import SwiftUI

struct AboutView: View {
    var body: some View {
        VStack{
            Image(systemName: "person.fill")
                .imageScale(.large)
                .font(.system(size: 50))
            Text("Abhinav parakkal")
            Text("From parakkal house puthur pallikkal")
            Spacer()
        }
        .toolbarBackground(Color("Navy_blue"), for: .navigationBar)
        .toolbarBackgroundVisibility(.visible, for: .navigationBar)
        .padding(.top, 20)
    }
}

#Preview {
    AboutView()
}
