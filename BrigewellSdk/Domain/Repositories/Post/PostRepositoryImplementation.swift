//
//  PostRepositoryImplementation.swift
//  BrigewellSdk
//
//  Created by Nalou Nguyen on 09/01/2024.
//

import Foundation
import RxSwift

public class PostRepositoryImplementation: BaseRepositoryImplementation , PostRepository {
    public func getAllPost() -> Observable<[PostModel]> {
        let request = GetPostsRequest()
        return networking.executeRequest(request)
    }
    
//    func getPost(id: Int) -> Observable<[PostModel]> {
//        
//    }
    
    public func getCommentBy(postId: [Int]) -> Observable<[CommentModel]> {
        let request = GetCommentRequest(postId: postId)
        return networking.executeRequest(request)
    }
}
