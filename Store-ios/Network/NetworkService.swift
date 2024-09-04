//
//  NetworkService.swift
//  Store-ios
//
//  Created by TaeWook Park on 9/2/24.
//

import Foundation

// Error case
enum NetworkError: Error {
    case urlError
    case responseError
    case decodeError
    case serverError(statusCode: Int)
    case unknownError
}

// DB API
class NetworkService {
    static let shared: NetworkService = NetworkService()
    
    // github/ld5ehom
//    let urlString = "https://raw.githubusercontent.com/ld5ehom/data/main/data.json"
    private let hostURL = "https://raw.githubusercontent.com/ld5ehom/data/main"
    
    // url 생성 함수
    private func createURL(withPath path: String) throws -> URL {
        let urlString = "\(hostURL)\(path)"
        guard let url = URL(string: urlString) else {
            throw NetworkError.urlError
        }
        
        return url
    }
    
    // data fetch
    private func fetchData(from url: URL) async throws -> Data {
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkError.responseError
        }
        
        switch httpResponse.statusCode {
        case 200...299:
            return data
        default:
            throw NetworkError.serverError(statusCode: httpResponse.statusCode)
        }
    }
    
    // Home
    func getHomeData() async throws -> HomeResponse {
        let url = try createURL(withPath: "/data.json")
        let data = try await fetchData(from: url)
        do {
            let decodeData = try JSONDecoder().decode(HomeResponse.self, from: data)
            return decodeData
        } catch {
            throw NetworkError.decodeError
        }
    }
    
    
}

