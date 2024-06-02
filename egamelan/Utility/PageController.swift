//
//  PageController.swift
//  E-Gamelan
//
//  Created by Erlangga Anugrah Arifin on 07/03/23.
//

import SwiftUI

struct PageController: View {
  
  @EnvironmentObject var viewRouter: ViewRouter
  
  var body: some View {
    switch viewRouter.currentPage {
    case .splashScreen:
      SplashScreenView()
    case .home:
      // Please change to MainMenuView() once it's done! ⬇️
      HomeScreenView()
        .transition(.opacity)
    }
  }
}

struct PageController_Previews: PreviewProvider {
  static var previews: some View {
    PageController()
      .environmentObject(ViewRouter())
  }
}
