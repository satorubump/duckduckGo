//
//  CharactersAPIResponse.swift
//  duckduckGo
//
//  Created by Satoru Ishii on 5/8/21.
//

import Foundation

///
///  Characters Download Data Model
///    API: https://api.duckduckgo.com
///
struct CharactersAPIResponse : Codable {

    let relatedTopics : [CharacterProfile]?
    
    enum CodingKeys : String, CodingKey {
        case relatedTopics = "RelatedTopics"
    }
}

///
///  Characters Data
///
struct CharacterProfile : Codable {
    let firstURL : String
    let icon : Icon
    let result : String
    let text : String
    
    enum CodingKeys : String, CodingKey {
        case firstURL = "FirstURL"
        case icon = "Icon"
        case result = "Result"
        case text = "Text"
    }
}

///
///  Character Image URL
///
struct Icon : Codable {
    let url : String
    enum CodingKeys : String, CodingKey {
        case url = "URL"
    }
}
