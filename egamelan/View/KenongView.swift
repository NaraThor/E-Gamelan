//
//  KenongView.swift
//  egamelan
//
//  Created by Hanif Fadillah Amrynudin on 08/03/23.
//

import SwiftUI

struct KenongView: View {
    var body: some View {
        ZStack {
            Image("patern")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            VStack {
                Text("Kenong")
                    .font(.custom(String(font: .primary), size: 75))
                    .padding(.top, 50)
                Spacer()
                ZStack() {
                    Grid {
                        GridRow {
                            ForEach(0..<4) { i in
                                ColorSquare(color: .clear)
                                    .overlay(
                                        ZStack() {
                                            let kenong = i + 3
                                            KenongTemplateView(indeksKe: kenong)

                                        }
                                    )
                            }
                        }
                        GridRow {
                            ColorSquare(color: .clear)
                                .overlay(
                                    ZStack() {
                                        
                                        let kenong = 2
                                        KenongTemplateView(indeksKe: kenong)

                                    }
                                )
                            Color.clear
                            Color.clear
                            ColorSquare(color: .clear)
                                .overlay(
                                    ZStack() {
                                        let kenong = 7
                                        KenongTemplateView(indeksKe: kenong)
                                    }
                                )
                        }
                        GridRow {
                            ColorSquare(color: .clear)
                                .overlay(
                                    ZStack() {
                                        let kenong = 1
                                        KenongTemplateView(indeksKe: kenong)

                                    }
                                )
                            Color.clear
                            Color.clear
                            ColorSquare(color: .clear)
                                .overlay(
                                    ZStack() {
                                        let kenong = 8
                                        KenongTemplateView(indeksKe: kenong)
                                    }
                                )
                        }
                        GridRow {
                            Color.clear
                            Color.clear
                            ForEach(0..<2) { i in
                                ColorSquare(color: .clear)
                                    .overlay(
                                        ZStack() {
                                            let kenong = i + 9
                                            KenongTemplateView(indeksKe: kenong)
                                        }
                                    )
                            }
                        }
                    }
                }
                .frame(width: 400, height: 400)
                .padding(.bottom, 110)
            }
            Spacer()
        }
    }
}
struct KenongTemplateView: View {

  var  indeksKe: Int?
  @State private var isEnlarged = false

  var body: some View {
    ZStack {
        
        Image("kenongPlaceholder")
            .resizable()
            .aspectRatio(contentMode: .fill)
        Image("kenong")
            .resizable()
            .scaledToFit()
            .scaleEffect(isEnlarged ? 1.1 : 1.0)
            .opacity(isEnlarged ? 0.8 : 1)
            .onTapGesture {
                let kenong = String((indeksKe ?? 0))
                SoundManager.engine.play(String(instrument: .kenong)+kenong)
                withAnimation(.easeInOut(duration: 0.05)) {
                    self.isEnlarged.toggle()
                    DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
                        self.isEnlarged = false
                    }
                }
            }
      VStack{
          Text("\(indeksKe!)")
            .font(.title)
          
          Spacer()
      }
    }
  }
}
struct KenongView_Previews: PreviewProvider {
    static var previews: some View {
        KenongView()
            .previewInterfaceOrientation(.landscapeLeft)
    }
}

struct ColorSquare: View {
    let color: Color
    
    var body: some View {
        color
        .frame(width: 120, height: 120)
    }
}
