//
//  SwiftUIExampleApp.swift
//  SwiftUIExample
//
//  Created by Techcreatix on 26/11/2022.
//

import SwiftUI

@main
struct SwiftUIExampleApp: App {
    @StateObject var viewModel: SwiftUIExampleViewModel = SwiftUIExampleViewModel()
    
    var body: some Scene {
        WindowGroup {
            ContentView().environmentObject(viewModel)
        }
    }
}
