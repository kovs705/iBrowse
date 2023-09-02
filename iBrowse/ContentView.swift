//
//  ContentView.swift
//  iBrowse
//
//  Created by Eugene Kovs on 02.09.2023.
//

import SwiftUI
import Combine
import WebKit
import UIKit

struct ContentView: View {
    @ObservedObject var viewModel = ViewModel()
    @State var isLoaderVisible = false
    var body: some View {
        ZStack {
            VStack(spacing: 0) {
                WebNavigationView(viewModel: viewModel)
                WebView(type: .public, url: "https://google.com", viewModel: viewModel)
                
            }.onReceive(self.viewModel.isLoaderVisible.receive(on: RunLoop.main)) { value in
                self.isLoaderVisible = value
            }
            if isLoaderVisible {
                LoaderView()
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}

