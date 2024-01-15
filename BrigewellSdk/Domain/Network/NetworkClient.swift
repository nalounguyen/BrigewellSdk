//
//  NetworkClient.swift
//  FootballApp
//
//  Created by Nalou Nguyen on 06/01/2024.
//

import Foundation
import Combine
import RxSwift

public enum NetworkError: Error {
    case urlResponse
    case urlRequest
    case decode

    public var toBaseError: BaseError {
        switch self {
        case .urlRequest:
            return BaseError(errorCode: "urlRequest", errorMessage: "urlRequest")
        case .decode:
            return BaseError(errorCode: "decode", errorMessage: "decode")
        case .urlResponse:
            return BaseError(errorCode: "urlResponse", errorMessage: "urlResponse")
        }
    }
}

public protocol NetworkClient {
    func executeRequest<T: Codable>(_ apiRequest: ApiRequest) -> Observable<T>
}

public final class NetworkClientImplementation: NetworkClient {
    private var baseUrl: URL
//    private let baseURL = URL(string: "https://jmde6xvjr4.execute-api.us-east-1.amazonaws.com/")!

    public init?(endPoint: String) {
        guard let url = URL(string: endPoint)
            else {
                print("endPoint: \(endPoint) is not an URL")
                return nil
        }
        baseUrl = url
    }

    public func executeRequest<T: Codable>(_ apiRequest: ApiRequest) -> Observable<T> {
        let defaultSession = URLSession(configuration: .default)
        var dataTask: URLSessionDataTask?


        return Single
            .create { [weak self] single -> Disposable in
                var endpoint = self?.baseUrl
                if let urlStr = apiRequest.baseURL,
                   let url = URL(string: urlStr) {
                    endpoint = url
                }

                guard let urlRequest = apiRequest.getUrlRequest(with: endpoint) else {
                    single(.failure(NetworkError.urlRequest))
                    return Disposables.create()
                }
                
                let headerJson = urlRequest.allHTTPHeaderFields?.json ?? [String:String]().json
                let bodyJson = apiRequest.body.json
                let paramsJson = apiRequest.parameters.json
                
                BrigewellLog.log("\n\n ⚡️ ⚡️ ⚡️ REQUEST INFO ⚡️ ⚡️ ⚡️ \n ===[\(type(of: apiRequest))]======[Info]: \n URL: \(urlRequest.url?.absoluteString ?? "") \n Method: \(apiRequest.method.rawValue) \n Header: \(headerJson) \n Parameters:\(paramsJson) \n Body: \(bodyJson)")

                dataTask = URLSession.shared.dataTask(with: urlRequest) { (data, _, error) in
                    guard let data = data else {
                        if let error = error {
                            single(.failure(NetworkError.urlResponse))
                        }
                        return
                    }
                    do {
                        let result = try JSONDecoder().decode(T.self, from: data)
                        single(.success(result))
                    } catch {
                        single(.failure(NetworkError.decode))
                    }
                }
                dataTask?.resume()
                return Disposables.create {
                    dataTask?.cancel()
                }
            }
            .asObservable()
    }
}


public struct BrigewellLog {
    public static func log(_ str: String) {
    #if DEBUG
        print(str)
    #endif
    }
}


public extension Dictionary {
    var json: String {
        let invalidJson = "Not a valid JSON"
        do {
            let jsonData = try JSONSerialization.data(withJSONObject: self, options: .prettyPrinted)
            return String(bytes: jsonData, encoding: String.Encoding.utf8) ?? invalidJson
        } catch {
            return invalidJson
        }
    }
    
    func jsonPresentation() {
        BrigewellLog.log(json)
    }
}
