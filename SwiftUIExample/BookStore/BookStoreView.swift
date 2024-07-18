//
//  BookStoreView.swift
//  SwiftUIExample
//
//  Created by Techcreatix on 6/17/20.
//  Copyright © 2020 Techcreatix. All rights reserved.
//

import SwiftUI

struct BookStoreView: View {
    
    @Binding var isActive: Bool
    @State var bookDatas: [BookSlideData] = BookSlideData.bookDatas
    
    @State var isPresented: Bool = false
    @State var selectedBook: BestSellerData = BestSellerData.datas[0]
    
    var body: some View {
        ZStack {
            Color(hexString: "0E0824").edgesIgnoringSafeArea(.all)
            
            ScrollView {
                VStack {
                    HStack {
                        Button(action: { self.isActive = false }, label: {
                            Image("b_logo")
                        })
                        Spacer()
                        Button(action: {}, label: {
                            Image("b_search")
                        })
                    }.padding(.bottom, 30).padding([.leading, .trailing], 8)
                    
                    BookSlideView(datas: $bookDatas, didTapItem: { imageName in
                        self.isPresented = true
                        self.selectedBook = BestSellerData.datas.first(where: { $0.imageName == imageName }) ?? BestSellerData.datas[0]
                    })
                        .frame(height: 224)
                        .sheet(isPresented: $isPresented, content: {
                            BookDetailView(isActive: self.$isPresented, data: self.selectedBook)
                        })
                    
                    HStack {
                        Text("Best Seller")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .bold, design: .default))
                        
                        Spacer()
                    }.padding([.top, .bottom], 20)
                    
                    BestSellerView()
                    
                    Spacer()
                }.padding(.leading, 16)
            }
            
            VStack {
                Spacer()
                
                TabView()
                    .frame(width: 238, height: 50)
                    .cornerRadius(25)
            }
        }
        .navigationBarTitle("")
        .navigationBarHidden(true)
    }
}

struct BookStoreView_Previews: PreviewProvider {
    static var previews: some View {
        BookStoreView(isActive: .constant(true))
    }
}
