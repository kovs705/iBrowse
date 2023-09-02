//
//  VM.swift
//  iBrowse
//
//  Created by Eugene Kovs on 02.09.2023.
//

import SwiftUI

import Foundation
import Combine

enum URLType {
    case local, `public`
}


enum WebViewNavigationAction {
    case backward, forward, reload
}

class ViewModel: ObservableObject {
    var isLoaderVisible = PassthroughSubject<Bool, Never>();
    var webTitle = PassthroughSubject<String, Never>()
    var webViewNavigationPublisher = PassthroughSubject<WebViewNavigationAction, Never>()
}
