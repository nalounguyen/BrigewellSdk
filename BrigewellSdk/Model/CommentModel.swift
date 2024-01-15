//
//  CommentModel.swift
//  BrigewellSdk
//
//  Created by Nalou Nguyen on 09/01/2024.
//

import Foundation

public struct CommentModel: Codable {
    public var postId: Int
    public var id: Int
    public var name: String
    public var email: String
    public var body: String
}
