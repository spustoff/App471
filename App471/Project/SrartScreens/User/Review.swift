//
//  Review.swift
//  App471
//
//  Created by IGOR on 16/04/2024.
//

import SwiftUI
import StoreKit

struct Review: View {
    
    let telegram: URL
    let isTelegram: Bool
    
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Spacer()
                
                Image("Reviews")
                    .resizable()
                    .aspectRatio(contentMode: .fit)
            }
            
            VStack(spacing: 8) {
                
                HStack {
                    
                    Circle()
                        .fill(.gray.opacity(0.5))
                        .frame(width: 8)

                    Circle()
                        .fill(Color("join"))
                        .frame(width: 8)
                }
                
                Text("Rate our app in the AppStore")
                    .foregroundColor(.white)
                    .font(.system(size: 28, weight: .semibold))
                    .multilineTextAlignment(.center)
                
                Text("Help make the app even better")
                    .foregroundColor(.gray)
                    .font(.system(size: 16, weight: .regular))
                
                Spacer()
                
                NavigationLink(destination: {
                    
                    if isTelegram == true {
                        
                        Join(telegram: telegram)
                            .navigationBarBackButtonHidden()
                        
                    } else if isTelegram == false {
                        
                        Not()
                            .navigationBarBackButtonHidden()
                    }
                    
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
        .onAppear{
            
            SKStoreReviewController.requestReview()
        }
    }
}

#Preview {
    Review(telegram: URL(string: "h")!, isTelegram: false)
}
