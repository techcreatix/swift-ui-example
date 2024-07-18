//
//  DetailProfileView.swift
//  SwiftUIExample
//
//  Created by Techcreatix on 6/16/20.
//  Copyright © 2020 Techcreatix. All rights reserved.
//

import SwiftUI

struct DetailProfileView: View {
    var body: some View {
        ZStack {
            Color(hexString: "F7F8FC").edgesIgnoringSafeArea(.all)
            
            VStack {
                Image("creditcard")
                    .renderingMode(.original)
                    .shadow(radius: 10)
                    .padding(.top, 16)
                
                BalanceView()
                    .padding(.top, 10)
                    .padding([.leading], 32)
                
                ListPositionView()
                    .padding([.leading], 16)
                    .padding(.top, 40)
                
                Spacer()
            }
            
        }
    }
}

struct DetailProfileView_Previews: PreviewProvider {
    static var previews: some View {
        DetailProfileView()
    }
}

struct BalanceView: View {
    
    var body: some View {
        VStack(spacing: 8) {
            HStack {
                Text("Current banalce")
                    .font(Font.system(size: 20, weight: .bold, design: .default))
                    .foregroundColor(Color.gray)
                Spacer()
            }
            
            MoneyView().padding(.trailing, 16)
            
            TransactionView()
        }
    }
}

struct TransactionView: View {
    
    var body: some View {
        HStack {
            ZStack {
                HStack {
                    Text("Last transaction: ")
                    Text("+ $1100.49").fontWeight(.bold)
                }
                .background(
                    GeometryReader(content: { geo in
                        Color.white
                            .frame(width: geo.size.width + 16, height: 35)
                            .cornerRadius(10)
                    })
                )
                    .padding([.leading, .trailing], 8)
            }
            Spacer()
        }
    }
}

struct MoneyView: View {
    
    var body: some View {
        HStack {
            Text("10200.49")
                .font(Font.system(size: 30, weight: .bold, design: .default))
                .foregroundColor(Color.black)
            
            Image("dropdown")
                .resizable()
                .frame(width: 10, height: 10)
                .scaledToFit()
                .padding(.leading, 16)
            
            Text("23,54%")
                .foregroundColor(Color(hexString: "FFB6B6"))
                .fontWeight(.bold)
                .font(.system(size: 17))
            Spacer()
            
            Image("chart")
        }
    }
}

struct ListPositionView: View {
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 20) {
                ProfileItemView(isShowEdit: true).frame(width: 280, height: 360, alignment: .leading)
                
                ProfileItemView(isShowEdit: false).frame(width: 280, height: 360, alignment: .leading)
            }.padding(.leading, 8)
        }
    }
}

struct ProfileItemView: View {
    
    var isShowEdit: Bool
    
    var body: some View {
        ZStack {
            Color.white.cornerRadius(10)
            
            VStack {
                HStack {
                    Image("close")
                    Spacer()
                }.padding()
                
                Spacer()
            }
            
            HStack {
                Spacer()
                
                VStack {
                    Image("avatar2")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 210, height: 210)
                    
                    Spacer()
                }
                .padding(.top, 40)
                .padding(.trailing, 20)
            }
            
            VStack {
                Spacer()
                PositionView().padding(.trailing, 30)
            }.padding(.bottom, 30)
            
            if isShowEdit {
                VStack {
                    ZStack {
                        HStack {
                            Color(hexString: "F7F8FA")?.frame(width: 54, height: 44)
                                .cornerRadius(22, corners: [.topRight, .bottomRight])
                            Spacer()
                        }
                        
                        HStack {
                            Image("Edit")
                                .resizable()
                                .scaledToFit()
                                .frame(width: 54, height: 30)
                            Spacer()
                        }
                    }
                }
            }
        }
    }
}

struct PositionView: View {
    
    var body: some View {
        VStack {
            HStack {
                Spacer()
                Text("Art Director")
                    .font(Font.system(size: 20, weight: .bold, design: .default))
                .foregroundColor(Color(hexString: "84ADAE"))
            }
            
            HStack {
                Spacer()
                Text("Jone Connor")
                    .font(Font.system(size: 30, weight: .bold, design: .default))
                .foregroundColor(Color(hexString: "545B70"))
            }
        }
    }
}
