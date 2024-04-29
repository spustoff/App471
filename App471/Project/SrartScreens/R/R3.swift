//
//  R3.swift
//  App471
//
//  Created by IGOR on 16/04/2024.
//

import SwiftUI

struct R3: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Image("R3")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            VStack(spacing: 12) {
                
                HStack {

                    Circle()
                        .fill(.gray.opacity(0.5))
                        .frame(width: 8)

                    Circle()
                        .fill(.gray.opacity(0.5))
                        .frame(width: 8)
                    
                    Circle()
                        .fill(Color("join"))
                        .frame(width: 8)
                    
                }
                
                Text("Data editing")
                    .foregroundColor(.white)
                    .font(.system(size: 34, weight: .semibold))
                
                Text("All on one screen")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    
                    status = true
                    
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
    R3()
}
