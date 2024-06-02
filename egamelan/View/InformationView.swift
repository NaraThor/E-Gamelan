//
//  InformationView.swift
//  egamelan
//
//  Created by Muhammad David Kurniawan on 08/03/23.
//

import SwiftUI

struct InformationView: View {
    var body: some View {
        ScrollView{
            ZStack{
                VStack{
                    Text("E-GamelanKu")
                        .font(.custom(String(font: .primary), size: 50))
                        .foregroundColor(Color(.brownCustom))
                        .padding([.top, .bottom], 40)
                    ZStack{
                        Circle()
                            .frame(width: 200, height: 200)
                            .foregroundColor(Color(.primaryYellow))
                        Image("splashScreen")
                            .resizable()
                            .frame(width: 100, height: 100)
                    }
                    .padding(20)
                    VStack{
                        Text("E-Gamelan adalah sebuah aplikasi musik digital yang tersedia untuk iPad. Aplikasi ini menghadirkan nuansa musik tradisional Indonesia dengan instrumen gamelan yang terkenal di seluruh dunia. Pengguna dapat memilih berbagai jenis gamelan jawa didalam aplikasi kami.")
                            .font(.custom(String(font: .primary), size: 30))
                            .foregroundColor(Color(.brownCustom))
                            .padding(45)
                    }
                }
            }
            
        }
        .background(
            Image("patern")
                .resizable()
                .edgesIgnoringSafeArea(.all)
                .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        )
    }
    
    struct InformationView_Previews: PreviewProvider {
        static var previews: some View {
            InformationView()
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}

