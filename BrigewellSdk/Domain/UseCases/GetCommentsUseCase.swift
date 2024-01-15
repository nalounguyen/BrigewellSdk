//
//  GetCommentsUseCase.swift
//  BrigewellSdk
//
//  Created by Nalou Nguyen on 15/01/2024.
//

import Foundation
import RxSwift

public protocol GetCommentsUseCase {
    func execute(listPostId: [Int]) -> Observable<[CommentModel]>
}

public final class GetCommentsUseCaseImplementation: GetCommentsUseCase {
    private let postRepository: PostRepository

    public init(postRepository: PostRepository) {
        self.postRepository = postRepository
    }

    public func execute(listPostId: [Int]) -> Observable<[CommentModel]> {
        guard !listPostId.isEmpty else {
            return Observable.just([])
        }
        
        return postRepository.getCommentBy(postId: listPostId)
    }


}
