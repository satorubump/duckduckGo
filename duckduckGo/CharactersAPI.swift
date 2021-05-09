//
//  CharactersAPI.swift
//  duckduckGo
//
//  Created by Satoru Ishii on 5/8/21.
//

import Foundation
import Combine

///  API Error
///
enum APIError: Error {
    case network(description: String)
    case decoding(description: String)
}

///
/// CharactersConnectable Protocol
///
/// - Functions:
///   - fetchAnimeList(title: String) return success; CharacterAPIResponse, fail: APIError
///
protocol CharactersConnectable {
    func fetchCharactersList(target: String) -> AnyPublisher<CharactersAPIResponse, APIError>
}
///
///  Characters Fetcher
///
class CharactersConnector : CharactersConnectable {
    ///
    /// Fetch Characters List from Title
    ///
    /// - Parameters:
    ///   - paramA: title is key of query
    ///
    /// - Returns: AnyPublisher Success: CharactersAPIResponse Publish, Falise: APIError
    ///
    func fetchCharactersList(target: String) -> AnyPublisher<CharactersAPIResponse, APIError> {
        let urlComponents = self.makeCharactersListRequestUrl(target: target)
        return publishConnector(components: urlComponents)
    }
    ///
    /// Create the Characters List Request URL
    ///
    /// - Parameters:
    ///   - paramA: Search Key - String
    /// - Returns: URLComponents -- URL Request
    ///
    private func makeCharactersListRequestUrl(target: String) -> URLComponents {
        var urlComp = URLComponents()
        urlComp.scheme = Constants.Scheme
        urlComp.host = Constants.Host
        
        urlComp.queryItems = [
            URLQueryItem(name: Constants.Q, value: Constants.CharactersReq),
            URLQueryItem(name: Constants.Format, value: Constants.Json)
        ]
        return urlComp
    }
    
    ///
    /// Private Connect Service API, Downloading and Publish the data (Combine)
    ///
    /// - Parameters:
    ///  - paramA: URLRequest : URLCompnents
    ///
    /// - Returns:  Any Publisher Success: CharactersAPIResponse Publsh, Fail: APIError
    ///
    private func publishConnector(components: URLComponents) -> AnyPublisher<CharactersAPIResponse, APIError> {
        guard let url = components.url else {
            let error = APIError.network(description: "Can't create URL")
            return Fail(error: error).eraseToAnyPublisher()
        }
        return URLSession.shared.dataTaskPublisher(for: URLRequest(url: url))
          .mapError { error in
            .network(description: error.localizedDescription)
          }
          .flatMap(maxPublishers: .max(1)) { pair in
                self.decode(pair.data)
          }
          .eraseToAnyPublisher()
    }
    
    ///
    /// Decode json data to CharactersAPIResponse codable struct data
    ///
    /// - Parameters:
    ///   - paramA: download json data
    /// - Returns: Decode success: CharactersAPIResponse Publish, fails: APIError
    ///
    private func decode(_ data: Data) -> AnyPublisher<CharactersAPIResponse, APIError> {
        let decoder = JSONDecoder()
        decoder.dateDecodingStrategy = .secondsSince1970
        return Just(data)
            .decode(type: CharactersAPIResponse.self, decoder: decoder)
            .mapError { error in
                .decoding(description: error.localizedDescription)
            }
          .eraseToAnyPublisher()
    }
}
