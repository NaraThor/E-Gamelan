//
//  GongView.swift
//  egamelan
//
//  Created by Hanif Fadillah Amrynudin on 08/03/23.
//

import SwiftUI

struct GongView: View {
  
  var body: some View {
    
    ZStack {
      Image("patern")
        .resizable()
        .scaledToFill()
        .ignoresSafeArea()
      
      VStack (alignment: .center){
        Text("Gong")
          .font(.custom(String(font: .primary), size: 75))
          .padding(.top, 80)
        Spacer()
        Spacer()
        ZStack() {
          Image("gongPlaceholder")
            .resizable()
            .scaledToFit()
          HStack() {
            Grid {
              GridRow {
                ColorSquare(color: .clear)
                  .frame(width: 115, height: 115)
                  .overlay(
                    GongTemplateView(indeksKe: 1,imageName: "gongTengahKananKiri")
                  )
                ColorSquare(color: .clear)
                  .frame(width: 135, height: 135)
                  .overlay(
                    GongTemplateView(indeksKe: 2,imageName: "gongTengah")
                      .padding(.top, 20)
                    
                  )
                ColorSquare(color: .clear)
                  .frame(width: 115, height: 115)
                  .overlay(
                    GongTemplateView(indeksKe: 3,imageName: "gongTengahKananKiri")
                    
                  )
              }
            }
            .padding(.bottom, 250)
          }
          HStack(spacing: 20){
            
            GongTemplateView(indeksKe: 4,imageName: "gongKiri4")
            
            GongTemplateView(indeksKe: 5,imageName: "gongKiri3")
            
            GongTemplateView(indeksKe: 6,imageName: "gongKiri2")
            
            GongTemplateView(indeksKe: 7,imageName: "gongKiri1")
            
            Spacer()
            
            GongTemplateView(indeksKe: 8,imageName: "gongKanan1")
              .padding(.trailing, 5)
            
            GongTemplateView(indeksKe: 9,imageName: "gongKanan2")
              .padding(.trailing, 10)
            
            GongTemplateView(indeksKe: 10,imageName: "gongKanan3")
            
            GongTemplateView(indeksKe: 11,imageName: "gongKanan4")
            
            
          }
          .padding(.horizontal, 70)
          .padding(.bottom, 70)
        }
        .padding(.horizontal)
        Spacer()
      }
      .frame(width: 1133.0)
    }
  }
}

struct GongTemplateView: View {
  
  var  indeksKe: Int?
  var imageName: String?
  @State private var isEnlarged = false
  
  var body: some View {
    ZStack {
      Image(imageName ?? "")
        .resizable()
        .scaledToFit()
        .frame(height: 350)
        .scaleEffect(isEnlarged ? 1.1 : 1.0)
        .opacity(isEnlarged ? 0.8 : 1)
        .onTapGesture {
          SoundManager.engine.play(String(instrument: .gong)+String(indeksKe ?? 0))
          withAnimation(.easeInOut(duration: 0.05)) {
            self.isEnlarged.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
              self.isEnlarged = false
            }
          }
        }
    }
  }
}

struct GongView_Previews: PreviewProvider {
  static var previews: some View {
    GongView()
      .previewInterfaceOrientation(.landscapeLeft)
  }
}
