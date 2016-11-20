//
//  HelpCoordinator.swift
//  BeyondViewControllers
//
//  Created by Joshua Sullivan on 11/4/16.
//  Copyright © 2016 Josh Sullivan. All rights reserved.
//

import UIKit

class HelpCoordinator: TaskCoordinator {
    
    var task: Task { return .help }
    
    /// The actual view controller we use. This task only has 1 step/view.
    fileprivate let viewController: UIViewController
    
    var rootViewController: UIViewController {
        return viewController
    }
    
    var isModalTask: Bool { return true }
    
    weak var delegate: TaskCoordinatorDelegate?
    
    init() {
        guard let vc = UIStoryboard(name: "Help", bundle: nil).instantiateInitialViewController() as? HelpViewController else {
            preconditionFailure("Help storyboard is misconfigured.")
        }
        viewController = vc
    }
    
    /// This class has no setup or teardown, so we're just providing empty implementations.
    func begin() {}
    
    /// This class has no setup or teardown, so we're just providing empty implementations.
    func prepareForRemoval() {}
}

extension HelpCoordinator: HelpViewControllerDelegate {
    func helpViewController(didTapBlog helpController: HelpViewController) {
        debugPrint("Launch blog.")
    }
    
    func helpViewController(didTapTwitter helpController: HelpViewController) {
        debugPrint("Launch twitter.")
    }
}
