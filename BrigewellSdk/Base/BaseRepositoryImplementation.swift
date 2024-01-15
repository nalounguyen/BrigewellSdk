//
//  BaseRepositoryImplementation.swift
//  FootballApp
//
//  Created by Nalou Nguyen on 07/01/2024.
//

import Foundation

public class BaseRepositoryImplementation {
    let networking: NetworkClient

    public init(networking: NetworkClient) {
        self.networking = networking
    }

    deinit {
        print("\(String(describing: type(of: self))) deinit")
    }
}
