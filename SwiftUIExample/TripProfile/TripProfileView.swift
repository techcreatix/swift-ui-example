//
//  ContentView.swift
//  SwiftUIExample
//
//  Created by Techcreatix on 6/16/20.
//  Copyright © 2020 Techcreatix. All rights reserved.
//

import SwiftUI

struct TripProfileView: View {
    
    @Binding var isActive: Bool
    
    var body: some View {
        VStack {
            BarView(didTapPop: {
                self.isActive = false
            })
                .frame(height: 60)
                .padding([.leading, .trailing], 16)
            TitleView()
                .padding([.top], 8)
                .padding([.leading, .trailing], 16)
            ImageList()
                .padding([.bottom], 8)
                .frame(height: 300)
            
            BottomView()
                .padding([.trailing, .leading], 16)
            Spacer()
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        TripProfileView(isActive: .constant(true))
    }
}


struct BarView: View {
    
    @State var isShowProfile: Bool = false
    
    var didTapPop: (() -> Void)?
    
    var body: some View {
        HStack {
            Button(action: {
                self.didTapPop?()
            }, label: {
                Image("menu").renderingMode(.original)
            })
            
            Spacer()
            
            Button(action: {
                self.isShowProfile.toggle()
            }, label: {
                Image("avatar").renderingMode(.original)
            }).sheet(isPresented: $isShowProfile, content: {
                DetailProfileView()
            })
        }.padding()
    }
}

struct TitleView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("Light Style")
                    .foregroundColor(Color.black.opacity(0.3))
                    .font(Font.system(size: 20, weight: .bold, design: .default))
                Spacer()
            }
            HStack {
                Text("Dales Personal")
                    .foregroundColor(Color.black)
                    .font(Font.system(size: 35, weight: .bold, design: .default))
                Spacer()
            }.padding(.top, 4)
        }.padding()
    }
}

struct ImageList: View {
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ImageItem(imageName: "image1", icon: "add")
                ImageItem(imageName: "image2", icon: "heart")
                ImageItem(imageName: "image1", icon: "heart")
            }
            .padding(.leading, 32)
            .padding(.trailing, 32)
        }
    }
}

struct ImageItem: View {
    var imageName: String
    var icon: String
    
    var body: some View {
        ZStack {
            Image(imageName)
                .renderingMode(.original)
                .resizable()
                .scaledToFit()
                .padding(.bottom, 16)
            VStack {
                Spacer()
                Image(icon)
                    .renderingMode(.original)
            }
        }
    }
}

struct BottomView: View {
    
    var body: some View {
        ZStack {
            Color(hexString: "#3C49A4")
                .opacity(0.03)
                .cornerRadius(20)
            
            VStack(spacing: 10) {
                Color(hexString: "#3C49A4")
                    .opacity(0.06)
                    .cornerRadius(10)
                    .frame(width: 40, height: 8)
                    .padding(.top, 8)
                
                MenuItem(title: "My total trip", icon: "total")
                MenuItem(title: "Payment setting", icon: "payment")
                MenuItem(title: "Total distance", icon: "distance")
                
                CategoryView()
                Spacer()
            }
            .padding([.leading, .trailing], 16)
        }
    }
}

struct MenuItem: View {
    
    var title: String
    var icon: String
    
    var body: some View {
        HStack {
            Image(icon).renderingMode(.original)
            Text(title)
                .font(Font.system(size: 18, weight: .semibold, design: .default))
                .padding()
            Spacer()
            Image("dot")
                .resizable()
                .renderingMode(.original)
                .frame(width: 30, height: 30)
        }
    }
}

struct CategoryView: View {
    
    var body: some View {
        ScrollView {
            HStack {
                CategoryItem(title: "Traves", isSelect: false)
                CategoryItem(title: "Berserk life", isSelect: true)
                CategoryItem(title: "Badst", isSelect: false)
            }
            .frame(height: 44)
        }.frame(height: 50)
    }
}

struct CategoryItem: View {
    
    var title: String
    var isSelect: Bool
    
    var body: some View {
        ZStack {
            if isSelect {
                Color(hexString: "#84ADAE")
            } else {
                Color.white
            }
            Text(title)
                .foregroundColor(isSelect ? Color.white : Color.black.opacity(0.4))
                .font(Font.system(size: 16, weight: .semibold, design: .default))
        }.cornerRadius(22)
    }
}
