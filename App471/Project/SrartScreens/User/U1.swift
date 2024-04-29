//
//  U1.swift
//  App471
//
//  Created by IGOR on 16/04/2024.
//

import SwiftUI

struct U1: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Image("U1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            VStack(spacing: 8) {
                
                HStack {
                    
                    Circle()
                        .fill(Color("join"))
                        .frame(width: 8)
                    
                    Circle()
                        .fill(.gray.opacity(0.5))
                        .frame(width: 8)

                }
                
                Text("Make money without risks")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .semibold))
                
                Text("A money-making tool for you")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    Review(telegram: telegram, isTelegram: isTelegram)
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Text("Next")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        .padding(.horizontal, 40)
                    
                })
            }
            .padding()
        }
    }
}

#Preview {
    U1(telegram: URL(string: "h")!, isTelegram: false)
}
