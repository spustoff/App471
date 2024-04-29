//
//  Not.swift
//  App471
//
//  Created by IGOR on 16/04/2024.
//

import SwiftUI

struct Not: View {
    
    @AppStorage("status") var status: Bool = false
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Image("Not")
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
                .opacity(0)
                
                Text("Don’t miss anything")
                    .foregroundColor(.white)
                    .font(.system(size: 34, weight: .semibold))
                
                Text("Don’t miss the most userful information")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                    .multilineTextAlignment(.center)
                    .padding(.horizontal)
                
                Spacer()
                
                Button(action: {
                    
//                    OneSignal.Notifications.requestPermission({ accepted in
//                      print("User accepted notifications: \(accepted)")
//                        status = true
//                    }, fallbackToSettings: true)
                    
                    status = true
                    
                }, label: {
                    
                    Text("Enable notification")
                        .foregroundColor(.black)
                        .font(.system(size: 15, weight: .medium))
                        .frame(maxWidth: .infinity)
                        .frame(height: 50)
                        .background(RoundedRectangle(cornerRadius: 15).fill(Color("prim")))
                        .padding(.horizontal, 40)
                    
                })
            }
            .padding()
            
            VStack {
                
                Button(action: {
                    
                    status = true
                    
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
    Not()
}
