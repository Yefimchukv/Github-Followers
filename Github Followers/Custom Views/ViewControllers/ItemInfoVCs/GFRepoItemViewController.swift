//
//  GFRepoItemViewController.swift
//  Github Followers
//
//  Created by Vitaliy Yefimchuk on 07.08.2021.
//

import UIKit

class GFRepoItemViewController: GFItemInfoViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        configureItems()
    }
    
    // MARK: - Private functions
    private func configureItems() {
        itemInfoViewOne.set(itemInfoType: .repos, with: user.publicRepos)
        itemInfoViewTwo.set(itemInfoType: .gists, with: user.publicGists)
        actionButton.set(backgroundColor: .systemPurple, title: "GitHub Profile")
    }
}
