//
//  LoadingView.swift
//  App471
//
//  Created by IGOR on 16/04/2024.
//

import SwiftUI

struct LoadingView: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Image("llogo")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
                    .frame(width: 250)
            }
            
            VStack {
                
                Spacer()
                
                ProgressView()
                    .padding()
            }
        }
    }
}

#Preview {
    LoadingView()
}
