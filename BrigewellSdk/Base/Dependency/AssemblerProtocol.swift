//
//  AssemblerProtocol.swift
//  FootballApp
//
//  Created by Nalou Nguyen on 07/01/2024.
//

import Swinject

public protocol AssemblerProtocol: AnyObject {
    var resolver: Resolver { get }
    func apply(assembly: Assembly)
    func apply(assemblies: [Assembly])
}

// MARK: - Assembler

extension Assembler: AssemblerProtocol {}
