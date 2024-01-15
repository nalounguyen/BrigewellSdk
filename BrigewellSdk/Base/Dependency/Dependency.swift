//
//  Dependency.swift
//  FootballApp
//
//  Created by Nalou Nguyen on 07/01/2024.
//

import Foundation
import Swinject

open class Dependency {
    open var assembler: AssemblerProtocol
    open var resolver: Resolver {
        return assembler.resolver
    }
    public init(assembler: AssemblerProtocol = Assembler()) {
        self.assembler = assembler
        setup()
    }
    public init(parent: Dependency) {
        if let assembler = parent.assembler as? Assembler {
            self.assembler = Assembler(parentAssembler: assembler)
        } else {
            self.assembler = Assembler()
        }
        setup()
    }
    open func setup() {}
    open func resolve<T>(_ type: T.Type) -> T {
        guard let instance = resolver.resolve(T.self)
            else { fatalError("cannot resolve \(T.self)") }
        return instance
    }
    open func resolve<T, Arg>(_ type: T.Type, argument: Arg) -> T {
        guard let instance = resolver.resolve(T.self, argument: argument)
            else { fatalError("cannot resolve \(T.self)") }
        return instance
    }
    open func resolve<T, Arg1, Arg2>(_ type: T.Type, argument1: Arg1, argument2: Arg2) -> T {
        guard let instance = resolver.resolve(T.self, arguments: argument1, argument2)
            else { fatalError("cannot resolve \(T.self)") }
        return instance
    }
}
