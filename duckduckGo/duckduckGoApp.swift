//
//  duckduckGoApp.swift
//  duckduckGo
//
//  Created by Satoru Ishii on 5/8/21.
//

import SwiftUI

@main
struct duckduckGoApp: App {
    var body: some Scene {
        WindowGroup {
            let orientationInfo = OrientationInfo()
            let viewModel = CharactersListViewModel()
            CharactersListView(viewModel: viewModel, orientationInfo: orientationInfo)
        }
    }
}
