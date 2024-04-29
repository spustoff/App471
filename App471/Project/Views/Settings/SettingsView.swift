//
//  SettingsView.swift
//  App471
//
//  Created by IGOR on 16/04/2024.
//

import SwiftUI
import StoreKit

struct SettingsView: View {
    var body: some View {

        ZStack {
            
            Color.black
                .ignoresSafeArea()
            
            VStack {
                
                Text("Settings")
                    .foregroundColor(.white)
                    .font(.system(size: 18, weight: .semibold))
                    .padding(.bottom, 30)
                
                ScrollView(.vertical, showsIndicators: false) {
                    
                    VStack(spacing: 15) {
                        
                        Button(action: {
                            
                            guard let url = URL(string: DataManager().usagePolicy) else { return }
                            
                            UIApplication.shared.open(url)
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "doc.text.fill")
                                    .foregroundColor(Color("join"))
                                    .font(.system(size: 16, weight: .regular))
                                    .padding(7)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.1)))
                                
                                Text("Usage Policy")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .semibold))
                            }
                        })
                        
                        Rectangle()
                            .fill(.gray.opacity(0.5))
                            .frame(maxWidth: .infinity)
                            .frame(height: 1)
                        
                        Button(action: {
                                                            
                                SKStoreReviewController.requestReview()
                            
                        }, label: {
                            
                            HStack {
                                
                                Image(systemName: "star.fill")
                                    .foregroundColor(Color("join"))
                                    .font(.system(size: 16, weight: .regular))
                                    .padding(7)
                                    .background(RoundedRectangle(cornerRadius: 10).fill(.white.opacity(0.1)))
                                
                                Text("Rate the app")
                                    .foregroundColor(.white)
                                    .font(.system(size: 18, weight: .semibold))
                                
                                Spacer()
                                
                                Image(systemName: "chevron.right")
                                    .foregroundColor(.gray)
                                    .font(.system(size: 16, weight: .semibold))
                            }
                        })
                    }
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 25.0).fill(Color("bg2")))
                }
            }
            .padding()
        }
    }
}

#Preview {
    SettingsView()
}
