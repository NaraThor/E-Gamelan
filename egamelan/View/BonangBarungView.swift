//
//  BonangBarungView.swift
//  egamelan
//
//  Created by Erlangga Anugrah Arifin on 08/03/23.
//

import SwiftUI

struct BonangBarungView: View {
  var body: some View {
    ZStack {
      Image("patern")
        .resizable()
        .scaledToFill()
        .ignoresSafeArea()
      VStack {
        Text("Bonang Barung")
          .font(.custom(String(font: .primary), size: 75))
          .padding(.top, 100)
        Spacer()
        ZStack(alignment: .top) {
          Image("bonangPlaceholder")
            .resizable()
            .scaledToFit()
          VStack(spacing: 0) {
            HStack(spacing: 0) {
              Rectangle()
                .frame(width: 25, height: 150)
                .foregroundColor(Color(.darkRed))
              ForEach(0..<7, id: \.self) { Tunggal in
                BonangTemplateView(indeksKe: Tunggal, imageName: "bonangBelakang", rowHeight: 150, paddingTop: 25, octave: "i", instrumentType: .bonangBarung)
              }
            }
            .padding(.horizontal, 60)
            .padding(.top, 18)
            HStack(spacing: 0) {
              Rectangle()
                .frame(width: 25, height: 165)
                .foregroundColor(Color(.darkRed))
              ForEach(0..<7, id: \.self) { Tunggal in
                BonangTemplateView(indeksKe: Tunggal, imageName: "bonangDepan", rowHeight: 165, paddingTop: -7, instrumentType: .bonangBarung)
              }
            }
            .padding(.horizontal, 60)
          }
        }
        Spacer()
      }
    }
  }
}

struct BonangTemplateView: View {
  
  var indeksKe: Int?
  var imageName: String?
  var rowHeight: Int?
  var paddingTop: Int?
  var octave: String = "" // higher octave use "i"
  var instrumentType: Instrument
  @State private var isEnlarged = false
  
  var body: some View {

    ZStack {
      Image("\(imageName ?? "")")
        .resizable()
        .scaledToFit()
        .padding(.top, CGFloat(paddingTop ?? 0))
        .scaleEffect(isEnlarged ? 1.1 : 1.0)
        .opacity(isEnlarged ? 0.5 : 1)
        .onTapGesture {
          let bonang = String((indeksKe ?? 0) + 1) + "\(octave)"
          SoundManager.engine.play( String(instrument: instrumentType) + bonang)
          withAnimation(.easeInOut(duration: 0.05)) {
            self.isEnlarged.toggle()
            DispatchQueue.main.asyncAfter(deadline: .now() + 0.05) {
              self.isEnlarged = false
            }
          }
        }
      Text("\(indeksKe!+1)\(octave)")
        .font(.title)
        .padding(.top, -45)
    }
    Rectangle()
      .frame(width: 25, height:  CGFloat(rowHeight ?? 0))
      .foregroundColor(Color(.darkRed))
  }
}

struct BonangBarungView_Previews: PreviewProvider {
  static var previews: some View {
    BonangBarungView()
      .previewInterfaceOrientation(.landscapeLeft)
  }
}
