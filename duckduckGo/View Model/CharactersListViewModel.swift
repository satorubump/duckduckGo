//
//  CharactersViewModel.swift
//  simpsonsChara
//
//  Created by Satoru Ishii on 5/8/21.
//

import Foundation
import SwiftUI
import Combine

///
///  Observable Characters View Model
///
class CharactersListViewModel : ObservableObject {
    /// Published Codable Response Data Model
    @Published var charactersAPIResponse : CharactersAPIResponse?
    
    /// Data download fetcher class
    let charactersConnector = CharactersConnector()
    private var disposables = Set<AnyCancellable>()

    ///
    ///  Get Characters List Data from API Fetcher : Subscribe the Published data
    ///  - Parameters:
    ///    - paramA: Target Name (simplsons chara  /  the wire chara)
    ///
    func getCharactersList(target: String) -> Void {
        /// Call Characters Fetcher
        charactersConnector.fetchCharactersList(target: target)
            /// Receive on Main Thread
            .receive(on: DispatchQueue.main)
            /// Received Data in A Sincronize
            .sink(
                /// Get the Failure / Success
                receiveCompletion: { [weak self] value in
                    guard let self = self else { print("sink guard nil"); return }
                    switch value {
                    /// Error
                    case .failure:
                        self.charactersAPIResponse = nil
                    /// Success
                    case .finished:
                        break
                    }
                },
                /// Receive Response Data
                receiveValue: { [weak self] charactersResponse in
                    self!.charactersAPIResponse = charactersResponse
                })
            .store(in: &disposables)
    }
}
