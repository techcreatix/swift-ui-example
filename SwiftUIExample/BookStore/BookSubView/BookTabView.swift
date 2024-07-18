//
//  BookTabView.swift
//  SwiftUIExample
//
//  Created by Techcreatix on 6/17/20.
//  Copyright © 2020 Techcreatix. All rights reserved.
//

import SwiftUI

struct VisualEffectView: UIViewRepresentable {
    var effect: UIVisualEffect?
    func makeUIView(context: UIViewRepresentableContext<Self>) -> UIVisualEffectView { UIVisualEffectView() }
    func updateUIView(_ uiView: UIVisualEffectView, context: UIViewRepresentableContext<Self>) { uiView.effect = effect }
}

struct TabView: View {
    
    @State var selectedTab = 0
    
    var body: some View {
        ZStack {
            Color(hexString: "FFFFFF")?.opacity(0.6)
            VisualEffectView(effect: UIBlurEffect(style: .dark)).opacity(0.8)
            
            HStack {
                Button(action: { self.selectedTab = 0 }, label: {
                    Image("b_book_icon")
                        .renderingMode(.template)
                        .scaleToFitSize(size: CGSize(width: 25, height: 25))
                        .foregroundColor(selectedTab == 0 ? .white : .gray)
                })
                
                Spacer()
                
                Button(action: { self.selectedTab = 1 }, label: {
                    Image("b_bookmark")
                        .renderingMode(.template)
                        .scaleToFitSize(size: CGSize(width: 25, height: 25))
                        .foregroundColor(selectedTab == 1 ? .white : .gray)
                })
                
                Spacer()
                
                Button(action: { self.selectedTab = 2 }, label: {
                    Image("b_music")
                        .renderingMode(.template)
                        .scaleToFitSize(size: CGSize(width: 25, height: 25))
                        .foregroundColor(selectedTab == 2 ? .white : .gray)
                })
                
                Spacer()
                
                Button(action: {}, label: {
                    Image("b_avatar")
                        .scaleToFitSize(size: CGSize(width: 25, height: 25))
                })
            }.padding()
        }
    }
}

struct BookTabView_Previews: PreviewProvider {
    static var previews: some View {
        ZStack {
            Color.black
            
            VStack {
                Spacer()
                TabView()
                    .frame(width: 238, height: 50)
                    .cornerRadius(25)
                .padding()
            }
        }
    }
}
