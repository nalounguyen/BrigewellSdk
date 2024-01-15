//
//  APIRequest.swift
//  FootballApp
//
//  Created by Nalou Nguyen on 06/01/2024.
//

import Foundation

/// Rest API methods (GET/PUT/POST/DELETE)
public enum ApiMethod: String {
    case get = "GET", put = "PUT", post = "POST", delete = "DELETE"
}

/// Rest API protocol
public protocol ApiRequest {
    var baseURL: String? { get }
    var method: ApiMethod { get }
    var path: String { get }
    var parameters: [String : String] { get }
    var body: [String: Any] { get }
}

extension ApiRequest {
    func getUrlRequest(with baseURL: URL?) -> URLRequest? {
        guard let baseURL = baseURL else {
            return nil
        }

        guard var components = URLComponents(url: baseURL.appendingPathComponent(path), resolvingAgainstBaseURL: true) else {
            fatalError("Unable to create URL components")
        }

        components.queryItems = parameters.map {
            URLQueryItem(name: String($0), value: String($1))
        }

        guard let urlStr = components.url?.absoluteString.replacingOccurrences(of: "%3F", with: "?"),
              let url = URL(string: urlStr) else {
            return nil
        }
        
        
        
        var request = URLRequest(url: url)
        
        
        request.httpMethod = method.rawValue
        if method == .post || method == .put {
            request.httpBody = try? JSONSerialization.data(withJSONObject: body)
        }

        return request
    }
}
