//
//  DeveloperView.swift
//  egamelan
//
//  Created by Muhammad David Kurniawan on 12/03/23.
//

import SwiftUI

struct DeveloperView: View {
    var body: some View {
        ScrollView(showsIndicators: false){
            ZStack{
                VStack{
                    Text("Our team")
                        .font(.custom(String(font: .primary), size: 50))
                        .foregroundColor(Color(.brownCustom))
                    VStack{
                        Image("angga")
                            .resizable()
                            .frame(width: 200, height: 200)
                            .cornerRadius(100)
                        Text("Erlangga Anugrah A")
                            .font(.custom(String(font: .primary), size: 30))
                            .foregroundColor(Color(.brownCustom))
                        Text("Tech Lead")
                            .font(.custom(String(font: .primary), size: 25))
                            .foregroundColor(Color(.darkRed))
                    }
                    .padding(.bottom, 80)
                    HStack(spacing: 100){
                        VStack{
                            Image("david")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .cornerRadius(100)
                            Text("Muhammad David K")
                                .font(.custom(String(font: .primary), size: 30))
                                .foregroundColor(Color(.brownCustom))
                            Text("Developer")
                                .font(.custom(String(font: .primary), size: 25))
                                .foregroundColor(Color(.darkRed))
                            
                        }
                        VStack{
                            Image("rakha")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .cornerRadius(100)
                            Text("Muhammad Rakha' N")
                                .font(.custom(String(font: .primary), size: 30))
                                .foregroundColor(Color(.brownCustom))
                            Text("Designer")
                                .font(.custom(String(font: .primary), size: 25))
                                .foregroundColor(Color(.darkRed))
                        }
                    }
                    .padding(.bottom, 80)
                    HStack(spacing: 200){
                        VStack{
                            Image("hanif")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .cornerRadius(100)
                            Text("Hanif Fadillah A")
                                .font(.custom(String(font: .primary), size: 30))
                                .foregroundColor(Color(.brownCustom))
                            Text("Developer")
                                .font(.custom(String(font: .primary), size: 25))
                                .foregroundColor(Color(.darkRed))
                        }
                        VStack{
                            Image("rifqi")
                                .resizable()
                                .frame(width: 200, height: 200)
                                .cornerRadius(100)
                            Text("Rifqi Triginandri")
                                .font(.custom(String(font: .primary), size: 30))
                                .foregroundColor(Color(.brownCustom))
                            Text("Developer")
                                .font(.custom(String(font: .primary), size: 25))
                                .foregroundColor(Color(.darkRed))
                        }
                    }
                    .padding(.bottom, 80)
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
    
    struct DeveloperView_Previews: PreviewProvider {
        static var previews: some View {
            DeveloperView()
                .previewInterfaceOrientation(.landscapeLeft)
        }
    }
}

