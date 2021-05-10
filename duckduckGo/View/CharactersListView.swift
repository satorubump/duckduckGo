//
//  CharactersListView.swift
//  duckduckGo
//
//  Created by Satoru Ishii on 5/8/21.
//

import SwiftUI

///
///  Characters List View
///
struct CharactersListView: View {

    /// Observed ViewModel for Downloading Characters List
    @ObservedObject var viewModel : CharactersListViewModel
    
    /// Observed Device Orientation
    @ObservedObject var orientationInfo : OrientationInfo

    /// Initializer
    init(viewModel: CharactersListViewModel, orientationInfo: OrientationInfo) {
        self.viewModel = viewModel
        self.orientationInfo = orientationInfo
    }
    
    ///  View Body
    var body: some View {
        /// for iPad Split View Navigation
        if UIDevice.current.userInterfaceIdiom == .pad {
            self.iPadNavigationView
        }
        /// for iPhone 2 Pages Navigation
        else {
            self.iPhoneNavigationView
        }
    }
}

///
/// View Section for CharactersListView
///
private extension CharactersListView {

    ///
    ///  Navigation View for iPad Split View
    ///
    var iPadNavigationView : some View {
        NavigationView {
            VStack {
                charactersListSection
            }
            .navigationBarTitle(Constants.CharactersListViewTitle, displayMode: .inline)
        }
        /// Split View Setting
        .navigationViewStyle(DoubleColumnNavigationViewStyle())
        .padding()
        .onAppear() {
            ///  Start the Characters Data Downloading
            viewModel.getCharactersList(target: Constants.CharactersReq)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    ///
    ///  Navigation View for iPhone 2 Pages List & Details
    ///
    var iPhoneNavigationView : some View {
        NavigationView {
            VStack {
                charactersListSection
            }
            .navigationBarTitle(Constants.CharactersListViewTitle, displayMode: .inline)
        }
        .onAppear() {
            ///  Start the Characters Data Downloading
            viewModel.getCharactersList(target: Constants.CharactersReq)
        }
        .navigationViewStyle(StackNavigationViewStyle())
    }

    ///
    ///  Characters List
    ///
    var charactersListSection : some View {
        List {
            if self.viewModel.charactersAPIResponse != nil && self.viewModel.charactersAPIResponse!.relatedTopics != nil {
                ///
                ///  Characters Name List of Characters API Response
                ///
                ForEach(self.viewModel.charactersAPIResponse!.relatedTopics!, id: \.firstURL) { character in
                    // Navigation Link to Detail Page with Character
                    NavigationLink(destination: CharacterDetailsView(character: character)
                                    .environmentObject(self.orientationInfo)) {
                        HStack(alignment: .top) {
                            Text(character.text.getCharacterName())
                                .accessibility(identifier: "character name")
                            .font(.system(size: Constants.ListFont))
                            .foregroundColor(Color.gray)
                        }
                    }
                }
            }
        }
        .accessibility(identifier: "characersList")
    }
}

struct CharactersListView_Previews: PreviewProvider {
    static var previews: some View {
        CharactersListView(viewModel: CharactersListViewModel(), orientationInfo: OrientationInfo())
    }
}
