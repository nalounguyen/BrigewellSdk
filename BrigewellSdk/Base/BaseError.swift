//
//  BaseError.swift
//  FootballApp
//
//  Created by Nalou Nguyen on 07/01/2024.
//

import Foundation

public struct BaseError: Error {
    public var errorCode: String = ""
    public var errorMessage: String = ""
    public var errorInfo: [String: String]?

    public init(errorCode: String,
                errorMessage: String,
                errorInfo: [String: String]? = nil) {
        self.errorCode = errorCode
        self.errorMessage = errorMessage
        self.errorInfo = errorInfo
    }

    public init() { }
}
