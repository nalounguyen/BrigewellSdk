//
//  BaseCoordinator.swift
//  FootballApp
//
//  Created by Nalou Nguyen on 07/01/2024.
//

import Foundation
import RxSwift
import UIKit
import RxCocoa

open class BaseCoordinator<CoordinatorResult, T: Dependency>: NSObject, Coordinator {
    public typealias ResultType = CoordinatorResult

    public var identifier = UUID()
    public var disposeBag = DisposeBag()
    public var dependency: T

    private var childCoordinators = [UUID: Any]()

    public init(
        dependency: T
    ) {
        self.dependency = dependency
        super.init()
        viewModelBinding()
    }

    private func store<C: Coordinator>(coordinator: C) {
        childCoordinators[coordinator.identifier] = coordinator
    }

    private func release<C: Coordinator>(coordinator: C) {
        childCoordinators.removeValue(forKey: coordinator.identifier)
    }

    open func start() -> Driver<CoordinatorResult> {
        fatalError("This method must be overridden")
    }

//    open func getBaseViewModel() -> BaseViewModel? {
//        fatalError("This method getBaseViewModel() must be overridden in child class")
//        return nil
//    }

    open func viewModelBinding() {

    }

    func getScreenClassName(vcClass: AnyClass? = nil) -> String {
        return String(describing: (vcClass as AnyObject))
    }
}
