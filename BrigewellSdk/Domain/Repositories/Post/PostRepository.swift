//
//  PostRepository.swift
//  BrigewellSdk
//
//  Created by Nalou Nguyen on 09/01/2024.
//

import Foundation
import RxSwift

public protocol PostRepository {
    func getAllPost() -> Observable<[PostModel]>
    func getCommentBy(postId: [Int]) -> Observable<[CommentModel]>
}
