//
//  Constants.swift
//  duckduckGo
//
//  Created by Satoru Ishii on 5/8/21.
//

import SwiftUI

///
///  Constants Value Table
///
struct Constants {
    // API
    static let Scheme = "https"
    static let Host = "api.duckduckgo.com"
    static let Q = "q"
    
    #if simpsonsChara
        static let CharactersReq = "simpsons+characters"
    #elseif theWireChara
        static let CharactersReq = "the+wire+characters"
    #endif
    
    static let Format = "format"
    static let Json = "json"
    
    // Label & Name Table
    static let PlaceholderImage = "icloud.and.arrow.down"

    #if simpsonsChara
        static let CharactersListViewTitle = "Simpsons Characters"
    #elseif theWireChara
        static let CharactersListViewTitle = "The Wire Characters"
    #endif
    
    static let CharacterDetails = "Character Details"
    
    // View Layout Value
    static let TitleFont : CGFloat = 22.0
    static let ListFont : CGFloat = 22.0
    static let BodyFont : CGFloat = 22.0
    static let ImageWidth : CGFloat = 300.0
    #if simpsonsChara
        static let ImageAspectRatio : CGFloat = 0.7
        static let PortraitIconSizeRatio : CGFloat = 0.8
        static let LandscapeIconSizeRatio : CGFloat = 0.65
    #elseif theWireChara
        static let ImageAspectRatio : CGFloat = 1.67
        static let PortraitIconSizeRatio : CGFloat = 1.67
        static let LandscapeIconSizeRatio : CGFloat = 0.5
    #endif

}
