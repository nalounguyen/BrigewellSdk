//
//  BaseViewController.swift
//  FootballApp
//
//  Created by Nalou Nguyen on 07/01/2024.
//

import Foundation
import UIKit
import RxSwift

open class BaseViewController<ViewModel>: UIViewController {
    public var viewModel: ViewModel!
    public var disposeBag = DisposeBag()

    public convenience init(viewModel: ViewModel) {
        self.init()
        initViewModel(viewModel: viewModel)
    }

    open func initViewModel(viewModel: ViewModel) {
        self.viewModel = viewModel
    }

    open override func viewDidLoad() {
        bindingData()
    }

    open func bindingData() { }
}
