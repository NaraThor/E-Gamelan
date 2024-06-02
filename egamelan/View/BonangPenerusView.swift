//
//  BonangPenerusView.swift
//  egamelan
//
//  Created by Muhammad David Kurniawan on 08/03/23.
//

import SwiftUI

struct BonangPenerusView: View {
  var body: some View {
    ZStack {
      Image("patern")
        .resizable()
        .scaledToFill()
        .ignoresSafeArea()
      VStack{
        Text("Bonang Penerus")
          .font(.custom(String(font: .primary), size: 75))
          .padding(.top, 100)
        Spacer()
        ZStack(alignment: .top){
          Image("bonangPlaceholder")
            .resizable()
            .scaledToFit()
          VStack(spacing: 0){
            HStack(spacing: 0){
              Rectangle()
                .frame(width: 25, height: 150)
                .foregroundColor(Color(.darkRed))
              ForEach(0..<7, id: \.self){ Tunggal in
                BonangTemplateView(indeksKe: Tunggal, imageName: "bonangBelakang", rowHeight: 150, paddingTop: 25, octave: "i", instrumentType: .bonangPenerus)
              }
            }
            .padding(.horizontal, 60)
            .padding(.top, 18)
            HStack(spacing: 0){
              Rectangle()
                .frame(width: 25, height: 165)
                .foregroundColor(Color(.darkRed))
              ForEach(0..<7, id: \.self) { Tunggal in
                BonangTemplateView(indeksKe: Tunggal, imageName: "bonangDepan", rowHeight: 165, paddingTop: -7, instrumentType: .bonangPenerus)
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
struct BonangPenerusView_Previews: PreviewProvider {
  static var previews: some View {
    BonangPenerusView()
      .previewInterfaceOrientation(.landscapeLeft)
  }
}
