//
//  egamelanApp.swift
//  egamelan
//
//  Created by Erlangga Anugrah Arifin on 08/03/23.
//

import SwiftUI

@main
struct E_GamelanApp: App {
  
  @StateObject var viewRouter = ViewRouter()
  var body: some Scene {
    WindowGroup {
      PageController()
        .environmentObject(viewRouter)
    }
  }
}
