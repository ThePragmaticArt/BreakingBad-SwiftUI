//
//  Character+Request.swift
//  BreakingBad
//
//  Created by Brandon Levasseur on 10/11/21.
//

import Foundation
import Combine

extension Character {
    static func request() -> AnyPublisher<[Character], Error> {
        let url = URL(string: "https://breakingbadapi.com/api/characters")!
        let decoder = JSONDecoder()
        let session = URLSession.shared
        let request = URLRequest(url: url, cachePolicy: .reloadIgnoringCacheData)
        return session.dataTaskPublisher(for: request)
            .map { $0.data }
            .decode(type: [Character].self, decoder: decoder)
            .eraseToAnyPublisher()
    }
}
