//
//  SaronPenerusView.swift
//  egamelan
//
//  Created by Muhammad David Kurniawan on 08/03/23.
//

import SwiftUI

struct SaronPenerusView: View {
  var body: some View {
    ZStack {
      Image("patern")
        .resizable()
        .scaledToFill()
        .ignoresSafeArea()
      VStack{
        Text("Saron Penerus")
          .font(.custom(String(font: .primary), size: 75))
          .padding(.top, 50)
        Spacer()
        ZStack{
          Image("saronPenerusPlaceholder")
            .resizable()
            .scaledToFit()
          VStack(spacing: 0){
            HStack{
              ForEach(0..<7, id: \.self){ Tunggal in
                  
                  SaronTemplateView(indeksKe: Tunggal, instrumentType: .saronPenerus)

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

struct SaronPenerusView_Previews: PreviewProvider {
  static var previews: some View {
    SaronPenerusView()
      .previewInterfaceOrientation(.landscapeLeft)
  }
}
