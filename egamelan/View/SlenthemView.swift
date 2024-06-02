//
//  SlenthemView.swift
//  egamelan
//
//  Created by Muhammad David Kurniawan on 08/03/23.
//

import SwiftUI

struct SlenthemView: View {
  var body: some View {
    ZStack {
      Image("patern")
        .resizable()
        .scaledToFill()
        .ignoresSafeArea()
      VStack{
        Text("Slenthem")
          .font(.custom(String(font: .primary), size: 75))
          .padding(.top, 100)
        Spacer()
        GeometryReader{ geo in
          ZStack{
            Image("slenthemPlaceholder")
              .resizable()
              .aspectRatio(16/9, contentMode: .fit)
              .frame(width: geo.size.width)
            HStack{
              ForEach((1...7), id: \.self) { slenthem in
                SlenthemTemplateView(indeksKe: slenthem)
              }
            }
            .aspectRatio(16/10, contentMode: .fit)
            .padding()
          }// end of ZStack
        }// end of GeometryReader
      }// end of VStack
      .padding(.bottom, 50)
    }
  }
}

struct SlenthemTemplateView: View {

  var indeksKe: Int?
  @State private var isEnlarged = false

  var body: some View {
    ZStack {
      Image("selenthem")
        .resizable()
        .padding(.horizontal, 2)
        .padding(.vertical, CGFloat((indeksKe ?? 0) * 3))
        .scaledToFit()
        .padding(.horizontal, 2)
        .scaleEffect(isEnlarged ? 1.1 : 1.0)
        .opacity(isEnlarged ? 0.5 : 1)
        .onTapGesture {
          SoundManager.engine.play( String(instrument: .slenthem) + String((indeksKe ?? 0)))
          withAnimation(.easeInOut(duration: 0.05)) {
            self.isEnlarged.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
              self.isEnlarged = false
            }
          }
        }
      Text("\(indeksKe!)")
        .font(.title)
    }
  }
}
struct SlenthemView_Previews: PreviewProvider {
  static var previews: some View {
    SlenthemView()
      .previewInterfaceOrientation(.landscapeLeft)
  }
}

