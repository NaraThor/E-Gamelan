//
//  DemungView.swift
//  egamelan
//
//  Created by Hanif Fadillah Amrynudin on 08/03/23.
//

import SwiftUI

struct DemungView: View {

  var body: some View {
    ZStack {
      Image("patern")
        .resizable()
        .scaledToFill()
        .ignoresSafeArea()
      VStack {
        Text("Demung")
          .font(.custom(String(font: .primary), size: 75))
          .padding(.top, 50)
        Spacer()
        ZStack() {
          Image("demungPlaceholder")
            .resizable()
            .scaledToFit()
          VStack(spacing: 0) {
            HStack{
              ForEach(0..<7) { i in
                SaronTemplateView(indeksKe: i, instrumentType: .saronPenerus)
              }
            }
            .padding(.bottom, 50)
          }
        }
        .padding(.horizontal)
        Spacer()
      }
    }
  }
}

struct DemungView_Previews: PreviewProvider {
  static var previews: some View {
    DemungView()
      .previewInterfaceOrientation(.landscapeLeft)
  }
}
