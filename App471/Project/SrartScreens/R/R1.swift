//
//  R1.swift
//  App471
//
//  Created by IGOR on 16/04/2024.
//

import SwiftUI

struct R1: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Image("R1")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            VStack(spacing: 12) {
                
                HStack {
                    
                    Circle()
                        .fill(Color("join"))
                        .frame(width: 8)
                    
                    Circle()
                        .fill(.gray.opacity(0.5))
                        .frame(width: 8)
                    
                    Circle()
                        .fill(.gray.opacity(0.5))
                        .frame(width: 8)
                    
                }
                
                Text("Manage your tasks")
                    .foregroundColor(.white)
                    .font(.system(size: 34, weight: .semibold))
                
                Text("Control how many tasks you have left")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    R2()
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
    R1()
}
