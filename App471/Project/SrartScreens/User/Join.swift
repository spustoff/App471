//
//  Join.swift
//  App471
//
//  Created by IGOR on 16/04/2024.
//

import SwiftUI

struct Join: View {
    
    let telegram: URL
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Image("Join")
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
                .opacity(0)
                
                Text("Join and earn")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .semibold))
                
                Text("Join our Telegram group trade with our team")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                    .multilineTextAlignment(.center)
                
                Spacer()
                
                Button(action: {
                    
                    UIApplication.shared.open(telegram)
                    
                }, label: {
                    
                    Text("Join")
                        .foregroundColor(.white)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("join")))
                        .padding(.horizontal, 40)
                    
                })
            }
            .padding()
            
            VStack {
                
                NavigationLink(destination: {
                    
                    Not()
                        .navigationBarBackButtonHidden()
                    
                }, label: {
                    
                    Image(systemName: "xmark")
                        .foregroundColor(.gray)
                        .font(.system(size: 13, weight: .semibold))
                        .padding(5)
                        .background(Circle().fill(.white.opacity(0.2)))
                        .frame(maxWidth: .infinity, alignment: .trailing)
                        .padding()
                })
                
                Spacer()
            }
        }
    }
}

#Preview {
    Join(telegram: URL(string: "h")!)
}
