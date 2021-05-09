//
//  CharacterDetailsView.swift
//  duckduckGo
//
//  Created by Satoru Ishii on 5/8/21.
//

import SwiftUI

///
///  Display Character Profile
///   - Image & Description
///
struct CharacterDetailsView: View {
    /// Observed Device Orientation
    @EnvironmentObject var orientationInfo : OrientationInfo
    /// Character Profile Data
    var character : CharacterProfile?

    init(character: CharacterProfile?) {
        self.character = character
    }
    
    var body: some View {
        VStack {
            if self.character == nil {
                Text("Character isn't choosed")
            }
            /// Device orientation is portrait
            else if orientationInfo.orientation == .portrait {
                VStack {
                        VStack {
                            /// Characters Image
                            if self.character != nil && character!.icon.url.count > 0 {
                                self.characterIconSection
                            }
                            /// Name Section
                            self.characterNameSection
                        }
                }
                /// Description Section
                self.characterDescriptionSection
                Spacer()
            }
            /// Device orientation is Landscape
            else if orientationInfo.orientation == .landscape {
                HStack {
                    VStack {
                        /// Characters Image
                        if character != nil && character!.icon.url.count > 0 {
                            self.characterIconSection
                        }
                        Spacer()
                    }
                    VStack {
                        /// Name Section
                        self.characterNameSection
                        /// Description Section
                        self.characterDescriptionSection
                        Spacer()
                    }.padding()
                }
            }
        }
        .navigationBarTitle(Constants.CharacterDetails, displayMode: .inline)
        .navigationViewStyle(StackNavigationViewStyle())
    }
}

///
/// Display Each View Sections
///
private extension CharacterDetailsView {
    /// Character Image Section
    var characterIconSection : some View {
        URLImage(url: character!.icon.url.getIconUrl()!, height: orientationInfo.iconHeight * Constants.LandscapeIconSizeRatio)
            .padding(.top, 20)
    }
    /// Character Name Section
    var characterNameSection : some View {
        Text(character!.text.getCharacterName())
            .font(.system(size: Constants.TitleFont))
            .frame(height: 30)
    }
    /// Character Description Section
    var characterDescriptionSection : some View {
        Text(character!.text.getDescription())
        .font(.system(size: Constants.BodyFont))
        .foregroundColor(Color.gray)
            .padding(.leading, 10)
            .padding(.trailing, 10)
            .padding(.top, 10)
    }
}
