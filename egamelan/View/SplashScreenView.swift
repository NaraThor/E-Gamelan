//
//  SplashScreenView.swift
//  E-Gamelan
//
//  Created by Erlangga Anugrah Arifin on 01/03/23.
//

import SwiftUI

struct SplashScreenView: View {
    
    @EnvironmentObject var viewRouter: ViewRouter
    @State private var timeSplashscreen = false
    @State private var isScaled = false
    @State private var offset = CGSize.zero
    @State private var isImageMoved = false
    
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                VStack(spacing: 0) {
                    RoundedRectangle(cornerRadius: 1000)
                        .foregroundColor(.yellow)
                        .frame(width: 300, height: 850)
                        .padding(.top, -300)
                        .scaleEffect(isScaled ? 10 : 1)
                        .animation(.easeInOut(duration: 2.8))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                self.isScaled = true
                            }
                        }
                }
                
                VStack {
                    Text("E-GamelanKu")
                        .font(.custom(String(font: .primary), size: 40))
                        .fontWeight(.bold)
                        .scaleEffect(isScaled ? 1.5 : 1)
                        .animation(.easeInOut(duration: 2.3))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1.5) {
                                self.isScaled = true
                            }
                        }
                    Image("splashScreen")
                        .resizable()
                        .frame(width: 100, height: 100)
                        .scaleEffect(isScaled ? 1.3 : 1)
                        .offset(y: offset.height)
                        .animation(.linear(duration: 1.8))
                        .onAppear {
                            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                                self.isScaled = true
                                offset = CGSize(width: 0, height: 75)
                            }
                        }
                }
                .padding(.top, 150)
            }
            Spacer()
            HStack {
                Circle()
                    .foregroundColor(.black)
                    .frame(width: 50, height: 50)
                Text("InsysLab")
                .font(.custom(String(font: .secondary), size: 30))
            }
            .padding(.bottom, 20)
        }
        .ignoresSafeArea()
        .task(delaySplashScreen)
    }
    
    private func delaySplashScreen() async {
        try? await Task.sleep(nanoseconds: 3_000_000_000)
        timeSplashscreen = true
        withAnimation {
            viewRouter.currentPage = .home
        }
        
    }
}
