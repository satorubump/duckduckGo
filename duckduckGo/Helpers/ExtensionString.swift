//
//  StringParser.swift
//  duckduckGo
//
//  Created by Satoru Ishii on 5/8/21.
//

import Foundation

///
///  Parsing & retreaving the Characters data
///
extension String {

    func getCharacterName() -> String {
        let arChar = [Character](self)
        var i = 0
        for _ in 0..<arChar.count {
            if arChar[i] == "-" {
                break
            }
            i += 1
        }
        return String(arChar.prefix(i - 1))
    }

    func getDescription() -> String {
        let arChar = [Character](self)
        var i = 0
        for _ in 0..<arChar.count {
            if arChar[i] == "-" {
                break
            }
            i += 1
        }
        return String(arChar.dropFirst(i + 2))
    }
    
    func getIconUrl() -> String? {
        if self.count < 1 {
            return nil
        }
        let uri = Constants.Scheme + "://" + Constants.Host
        return uri + self
    }
}
