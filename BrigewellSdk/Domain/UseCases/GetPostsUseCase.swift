//
//  GetPostsUseCase.swift
//  BrigewellSdk
//
//  Created by Nalou Nguyen on 09/01/2024.
//

import Foundation
import RxSwift

public protocol GetPostsUseCase {
    func execute() -> Observable<[PostModel]>
}

public final class GetPostsUseCaseImplementation: GetPostsUseCase {
    private let postRepository: PostRepository

    public init(postRepository: PostRepository) {
        self.postRepository = postRepository
    }

    public func execute() -> Observable<[PostModel]> {
        return postRepository.getAllPost()
    }


}
