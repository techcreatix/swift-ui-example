//
//  BookDetailView.swift
//  SwiftUIExample
//
//  Created by Techcreatix on 6/18/20.
//  Copyright © 2020 Techcreatix. All rights reserved.
//

import SwiftUI

struct BookDetailView: View {
    
    @Binding var isActive: Bool
    var data: BestSellerData
    
    var body: some View {
        VStack {
            ZStack {
                Color(hexString: "0E0824").edgesIgnoringSafeArea(.all)
                
                VStack {
                    Image(data.imageName)
                        .resizable()
                        .renderingMode(.original)
                        .edgesIgnoringSafeArea(.top)
                        .frame(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height * 2 / 3)
                    
                    Spacer()
                }
                
                VStack {
                    HStack {
                        Button(action: { self.isActive = false }) {
                            Image("b_close").renderingMode(.template).foregroundColor(.black)
                        }.padding()
                        
                        Spacer()
                    }
                    
                    Spacer()
                }
                
                VStack {
                    ButtonPlayView()
                        .frame(width: 50, height: 50).padding(.top, UIScreen.main.bounds.height * 2 / 3 - 25)
                    
                    Spacer()
                }
                
                VStack(spacing: 8) {
                    
                    HStack {
                        Text(data.name)
                            .foregroundColor(.white)
                            .font(.system(size: 25, weight: .bold, design: .default))
                        
                        Spacer()
                    }.padding(.top, UIScreen.main.bounds.height * 2 / 3 + 35)
                    
                    HStack {
                        Text(data.author)
                            .foregroundColor(.gray)
                            .font(.system(size: 16, weight: .semibold, design: .default))
                        
                        Spacer()
                    }
                    
                    HStack {
                        Image("b_start")
                        
                        Text("4.8").foregroundColor(.white)
                            .font(.system(size: 17, weight: .bold, design: .default))
                        Text("(2390)").foregroundColor(.white)
                            .font(.system(size: 17, weight: .regular, design: .default))
                        Spacer()
                    }
                    
                    VStack {
                        Slider(value: .constant(0.8)).frame(height: 10)
                        
                        HStack {
                            Text("00:00").foregroundColor(.white)
                            
                            Spacer()
                            
                            Text("34:51").foregroundColor(.white)
                        }
                    }.padding(.top, 16)
                    
                    Spacer()
                }.padding([.leading, .trailing], 16)
                
                
            }
        }
    }
}

struct BookDetailView_Previews: PreviewProvider {
    static var previews: some View {
        BookDetailView(isActive: .constant(false), data: BestSellerData.datas[1])
    }
}

struct ButtonPlayView: View {
    
    var body: some View {
        ZStack {
            Color.black.cornerRadius(25).opacity(0.8)
            Image("b_play").resizable().renderingMode(.original)
        }
    }
}
