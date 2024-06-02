//
//  SaronBarungView.swift
//  egamelan
//
//  Created by Muhammad David Kurniawan on 08/03/23.
//

import SwiftUI

struct SaronBarungView: View {
  @State private var isPressed = false
  var body: some View {
    ZStack {
      Image("patern")
        .resizable()
        .scaledToFill()
        .ignoresSafeArea()
      VStack{
        Text("Saron Barung")
          .font(.custom(String(font: .primary), size: 75))
          .padding(.top, 50)
        Spacer()
        ZStack{
          Image("saronBarungPlaceholder")
            .resizable()
            .scaledToFit()
          VStack(spacing: 0){
            HStack{
              ForEach(0..<7, id: \.self){ Tunggal in
                SaronTemplateView(indeksKe: Tunggal, instrumentType: .saronBarung)
              }
            }
          }
        }
        .padding(.horizontal, 20)
        Spacer()
      }
    }
  }
}

struct SaronTemplateView: View {

  var  indeksKe: Int?
  @State private var isEnlarged = false
  var instrumentType: Instrument

  var body: some View {
    ZStack {
      Image("saron")
        .resizable()
        .scaledToFit()
        .padding([.top, .bottom], 10 * CGFloat(indeksKe ?? 0))
        .frame(height: 500)
        .padding(.horizontal, 5)
        .scaleEffect(isEnlarged ? 1.1 : 1.0)
        .opacity(isEnlarged ? 0.8 : 1)
        .onTapGesture {
          let saronBarung = String((indeksKe ?? 0) + 1)
          SoundManager.engine.play(String(instrument: instrumentType)+saronBarung)
          withAnimation(.easeInOut(duration: 0.05)) {
            self.isEnlarged.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
              self.isEnlarged = false
            }
          }
        }
      Text("\(indeksKe!+1)")
        .font(.title)
    }
  }
}

struct SaronBarungView_Previews: PreviewProvider {
  static var previews: some View {
    SaronBarungView()
      .previewInterfaceOrientation(.landscapeLeft)
  }
}
