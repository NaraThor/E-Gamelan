//
//  KethukKempyangView.swift
//  egamelan
//
//  Created by Erlangga Anugrah Arifin on 08/03/23.
//

import SwiftUI

struct KethukKempyangView: View {
  var body: some View {
    ZStack {
      Image("patern")
        .resizable()
        .scaledToFill()
        .ignoresSafeArea()
      GeometryReader{ geo in
        VStack{
          Text("Kethuk Kempyang")
            .font(.custom(String(font: .primary), size: 75))
            .padding(.top, 100)
          Spacer()
          ZStack(){
            HStack{
              ForEach((1...2), id: \.self) {_ in
                Image("kkPlaceholder")
                  .resizable()
                  .padding()
                  .scaledToFit()
              }
            }.padding([.top, .leading, .trailing], geo.size.width / 10)
            HStack{
              ForEach((1...2), id: \.self) { kk in
                KethukTemplateView(indeksKe: kk)
              }
            }.padding([.top, .leading, .trailing], geo.size.width / 10)
          }
        }
      }
    }
    .padding(.bottom, 80)
  }
}

struct KethukTemplateView: View {

  var  indeksKe: Int?
  @State private var isEnlarged = false

  var body: some View {
    ZStack {
      Image( indeksKe == 1 ? "kethuk" : "kempyang")
        .resizable()
        .padding()
        .scaledToFit()
        .scaleEffect(isEnlarged ? 1.1 : 1.0)
        .opacity(isEnlarged ? 0.8 : 1)
        .onTapGesture {
          SoundManager.engine.play( String(instrument: .kethukKempyang) + String(indeksKe ?? 0))
          withAnimation(.easeInOut(duration: 0.05)) {
            self.isEnlarged.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
              self.isEnlarged = false
            }
          }
        }
      Text("\(indeksKe ?? 0)")
        .font(.title)
    }
  }
}

struct KethukKempyangView_Previews: PreviewProvider {
  static var previews: some View {
    KethukKempyangView()
      .previewInterfaceOrientation(.landscapeLeft)
  }
}
