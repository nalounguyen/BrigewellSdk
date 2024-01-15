//
//  Coordinator.swift
//  FootballApp
//
//  Created by Nalou Nguyen on 07/01/2024.
//

import Foundation
import RxCocoa

public protocol Coordinator {
    associatedtype ResultType

    var identifier: UUID { get }
    func start() -> Driver<ResultType>
}
