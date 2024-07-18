//
//  HomeView.swift
//  SwiftUIExample
//
//  Created by Techcreatix 6/16/20.
//  Copyright © 2020 Techcreatix. All rights reserved.
//

import SwiftUI

struct HomeView: View {
    
    @State var isActiveTrip: Bool = false
    @State var isActiveBook: Bool = false
    
    var body: some View {
        NavigationView {
            ScrollView(.vertical, showsIndicators: false) {
                VStack {
                    NavigationLink("Trip Profile View", destination: TripProfileView(isActive: $isActiveTrip), isActive: $isActiveTrip).padding(.bottom, 16)
                    
                    NavigationLink("Book store view", destination: BookStoreView(isActive: $isActiveBook), isActive: $isActiveBook)
                }.padding()
            }.navigationBarTitle("SwiftUI Example")
            .padding()
        }
    }
}

struct HomeView_Previews: PreviewProvider {
    static var previews: some View {
        HomeView()
    }
}
