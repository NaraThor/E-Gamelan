//
//  HomeScreenView.swift
//  egamelan
//
//  Created by Hanif Fadillah Amrynudin on 08/03/23.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        NavigationView {
            ZStack {
                Image("patern")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                VStack {
                    HStack(spacing: 50) {
                        Button(action: {
                                
                        }) {
                            NavigationLink(destination: DeveloperView()) {
                                ZStack {
                                    Rectangle()
                                        .fill(Color(.primaryYellow))
                                        .frame(width: 100, height: 100)
                                        .edgesIgnoringSafeArea(.top)
                                        .cornerRadius(radius: 20.0, corners: [.bottomRight, .bottomLeft])
                                        .padding(.bottom, 105)
                                    Image(systemName: "person.3.fill")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.black)
                                        .frame(width: 50, height: 50)
                                        .padding(.bottom, 105)
                                }
                            }
                        }
                        
                        Rectangle()
                            .fill(Color(.primaryYellow))
                            .frame(width: 600, height: 205)
                            .edgesIgnoringSafeArea(.top)
                            .cornerRadius(radius: 100.0, corners: [.bottomRight, .bottomLeft])
                        
                        Button(action: {
                                
                            }) {
                            NavigationLink(destination: InformationView()) {
                                ZStack {
                                    Rectangle()
                                        .fill(Color(.primaryYellow))
                                        .frame(width: 100, height: 100)
                                        .edgesIgnoringSafeArea(.top)
                                        .cornerRadius(radius: 20.0, corners: [.bottomRight, .bottomLeft])
                                        .padding(.bottom, 105)
                                    Image(systemName: "info.circle")
                                        .resizable()
                                        .scaledToFit()
                                        .foregroundColor(.black)
                                        .frame(width: 50, height: 50)
                                        .padding(.bottom, 105)
                                }
                            }
                        }
                    }
                    Spacer()
                }
                VStack {
                    Text("E-GamelanKu")
                        .font(.custom(String(font: .primary), size: 75))
                        .padding(.top, 50)
                    Spacer()
                    ScrollView(.horizontal, showsIndicators: false) {
                        HStack(spacing: 0) {
                            VStack{
                                Text("self.data.name")
                                    .font(.system(size: 28))
                                    .padding(.vertical)
                                    .foregroundColor(.gray.opacity(0))
                                Image("icon_bonang_barung")
                                    .resizable()
                                    .frame(width: 310, height: 250)
                                    .cornerRadius(20)
                                    .opacity(0)
                            }
                            .padding(.horizontal, 20)
                            .background(Color.mint.opacity(0))
                            .cornerRadius(20)
                            
                            ForEach(data) { item in
                                NavigationLink(destination: item.view) {
                                    GeometryReader { geometry in
                                        Card(width: geometry.frame(in: .global).width, data: item)
                                            .rotation3DEffect(Angle(degrees: (Double(geometry.frame(in: .global).minX) - 350) / -20), axis: (x: 0, y: 1.0, z: 0))
                                    }
                                }
                            }
                            .frame(width: 400, height: 450)
                            
                            
                            VStack{
                                Text("self.data.name")
                                    .font(.system(size: 28))
                                    .padding(.vertical)
                                    .foregroundColor(.gray.opacity(0))
                                Image("icon_bonang_barung")
                                    .resizable()
                                    .frame(width: 30, height: 250)
                                    .cornerRadius(20)
                                    .opacity(0)
                            }
                            .padding(.horizontal, 25)
                            .background(Color.mint.opacity(0))
                            .cornerRadius(20)
                        }
                        .padding()
                    }
                }
            }
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

struct HomeScreenView_Previews: PreviewProvider {
    static var previews: some View {
        HomeScreenView()
    }
}


struct Card : View {
    var width : CGFloat
    var data : Type
    var body: some View {
        ZStack{
            Rectangle()
                .fill(Color.black)
                .frame(width: 310, height: 430)
                .cornerRadius(80)
            VStack{
                Text(self.data.name)
                    .font(.custom(String(font: .primary), size: 36))
                    .foregroundColor(Color(.black))
                    .padding(.vertical)
                Image(self.data.image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 250, height: 250)
            }
            .padding(.horizontal, 25)
            .padding(.vertical, 25)
            .background(Color(.primaryYellow))
            .cornerRadius(80)
        }
    }
}

struct Type: Identifiable {
    var id : Int
    var name : String
    var image : String
    var view : AnyView
}

var data = [
    Type(id: 1, name: "Bonang\nBarung", image: "icon_bonang_barung", view: AnyView(BonangBarungView())),
    Type(id: 2, name: "Bonang\nPenerus", image: "icon_bonang_penerus", view: AnyView(BonangPenerusView())),
    Type(id: 3, name: "Demung\n", image: "icon_demung", view: AnyView(DemungView())),
    Type(id: 4, name: "Gong\n", image: "icon_gong", view: AnyView(GongView())),
    Type(id: 5, name: "Kenong\n", image: "icon_kenong", view: AnyView(KenongView())),
    Type(id: 6, name: "Kethuk\nKempyang", image: "icon_kethuk_kempyang", view: AnyView(KethukKempyangView())),
    Type(id: 7, name: "Saron\nBarung", image: "icon_saron_barung", view: AnyView(SaronBarungView())),
    Type(id: 8, name: "Saron\nPenerus", image: "icon_saron_penerus", view: AnyView(SaronPenerusView())),
    Type(id: 9, name: "Slenthem\n", image: "icon_slenthem", view: AnyView(SlenthemView())),
]

struct CornerRadiusShape: Shape {
    var radius = CGFloat.infinity
    var corners = UIRectCorner.allCorners
    
    func path(in rect: CGRect) -> Path {
        let path = UIBezierPath(roundedRect: rect, byRoundingCorners: corners, cornerRadii: CGSize(width: radius, height: radius))
        return Path(path.cgPath)
    }
}

struct CornerRadiusStyle: ViewModifier {
    var radius: CGFloat
    var corners: UIRectCorner
    
    func body(content: Content) -> some View {
        content
            .clipShape(CornerRadiusShape(radius: radius, corners: corners))
    }
}

extension View {
    func cornerRadius(radius: CGFloat, corners: UIRectCorner) -> some View {
        ModifiedContent(content: self, modifier: CornerRadiusStyle(radius: radius, corners: corners))
    }
}
