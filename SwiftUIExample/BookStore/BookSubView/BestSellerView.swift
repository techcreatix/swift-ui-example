//
//  BestSellerView.swift
//  SwiftUIExample
//
//  Created by Techcreatix on 6/17/20.
//  Copyright © 2020 Techcreatix. All rights reserved.
//

import SwiftUI

struct BestSellerView: View {
    
    var body: some View {
        VStack {
            ForEach(BestSellerData.datas) { data in
                BestSellerItemView(data: data)
                    .frame(height: 120)
            }
        }
    }
}

struct BestSellerView_Previews: PreviewProvider {
    static var previews: some View {
        BestSellerView().background(Color.black)
    }
}

struct BestSellerItemView: View {
    
    var data: BestSellerData
    
    var body: some View {
        GeometryReader { geo in
            HStack {
                Image(self.data.imageName)
                    .scaleToFitSize(size: CGSize(width: 70, height: geo.size.height - 10))
                    .padding(.trailing, 16)
                
                VStack(spacing: 8) {
                    HStack {
                        Text(self.data.name)
                            .foregroundColor(.white)
                            .font(.system(size: 20, weight: .bold, design: .default))
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text(self.data.author)
                            .foregroundColor(.white).opacity(0.7).font(.system(size: 17, weight: .semibold, design: .default))
                        
                        Spacer()
                    }
                    
                    HStack {
                        Text("\(self.data.price) €")
                            .foregroundColor(.white)
                            .font(.system(size: 17, weight: .bold, design: .default))
                        
                        Spacer()
                        
                        Image("b_start")
                        
                        Text(self.data.rating).foregroundColor(.white)
                            .font(.system(size: 17, weight: .bold, design: .default))
                        Text("(\(self.data.comment))").foregroundColor(.white)
                            .font(.system(size: 17, weight: .regular, design: .default))
                        Spacer()
                    }
                }
            }
        }
    }
}
