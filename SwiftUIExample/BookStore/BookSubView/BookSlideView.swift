//
//  BookSlideView.swift
//  SwiftUIExample
//
//  Created by Techcreatix on 6/17/20.
//  Copyright © 2020 Techcreatix. All rights reserved.
//

import SwiftUI

struct BookSlideView: View {
    
    @State var selectedItem = 0
    @Binding var datas: [BookSlideData]
    
    var didTapItem: ((String) -> Void)?
    
    var body: some View {
        ScrollView(.horizontal) {
            HStack(spacing: 16) {
                ForEach(0..<datas.count) { i in
                    Button(action: { self.didTapItem?(self.datas[i].imageName) }, label: {
                        BookSlideItem(bookData: self.datas[i])
                    })
                }
            }
        }
    }
}

struct BookSlideItem: View {
    
    var bookData: BookSlideData
    
    var body: some View {
        ZStack {
            Image(bookData.imageName)
                .resizable()
                .scaledToFit()
                .cornerRadius(20)
            
            VStack {
                Spacer()
                
                HStack {
                    Spacer()
                    ButtonPlayView().frame(width: 30, height: 30)
                }.padding(.trailing, 16).padding(.bottom, 16)
            }
        }
    }
}

struct BookSlideView_Previews: PreviewProvider {
    static var previews: some View {
        BookSlideView(datas: .constant(BookSlideData.bookDatas), didTapItem: { _ in } ).frame(height: 230)
    }
}
