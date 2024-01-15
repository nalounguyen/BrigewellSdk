//
//  PostModel.swift
//  BrigewellSdk
//
//  Created by Nalou Nguyen on 09/01/2024.
//

import Foundation

public struct PostModel: Codable {
    public var userId: Int
    public var id: Int
    public var title: String
    public var body: String
    public var comments: [CommentModel]?
}
