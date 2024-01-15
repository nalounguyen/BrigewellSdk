//
//  PostRepositoryRequests.swift
//  BrigewellSdk
//
//  Created by Nalou Nguyen on 09/01/2024.
//

import Foundation

struct GetPostsRequest: ApiRequest {
    var baseURL: String?
    var method: ApiMethod = .get
    var path = "posts"
    var parameters: [String: String] = [:]
    var body: [String: Any] = [:]

    init() { }
}

struct GetCommentRequest: ApiRequest {
    var baseURL: String?
    var method: ApiMethod = .get
    var path = "comments"
    var parameters: [String: String] = [:]
    var body: [String: Any] = [:]

    init(postId: [Int]) {
        for item in postId.enumerated() {
            if item.offset == 0 {
                path.append("?postId=\(item.element)")
            }else {
                path.append("&postId=\(item.element)")
            }
            
        }
        
    }
}


