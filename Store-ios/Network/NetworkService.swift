//
//  NetworkService.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/2/24.
//

import Foundation

class NetworkService {
    static let shared: NetworkService = NetworkService()
    
    func getHomeData() async throws -> HomeResponse {
        
        // github/ld5ehom 
        let urlString = "https://raw.githubusercontent.com/ld5ehom/data/main/data.json"
        guard let url = URL(string: urlString) else {
            throw URLError(.badURL)
        }
        
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode == 200 else {
            throw URLError(.badServerResponse)
        }
        
        let decodeData = try JSONDecoder().decode(HomeResponse.self, from: data)
        return decodeData
    }
}

