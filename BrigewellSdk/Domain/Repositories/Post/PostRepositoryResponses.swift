//
//  PostRepositoryResponses.swift
//  BrigewellSdk
//
//  Created by Nalou Nguyen on 09/01/2024.
//

import Foundation

struct GetPostsResponse: Codable {
    let teams: [PostModel]
}
