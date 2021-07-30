//
//  User.swift
//  Github Followers
//
//  Created by Vitaliy Yefimchuk on 27.07.2021.
//

import Foundation

struct User: Codable {
    let login: String
    let avatarUrl: String
    let name: String?
    let location: String?
    let bio: String?
    let publicRepos: Int
    let publicGist: Int
    let htmlUrl: String
    let following: Int
    let followers: Int
    let createdAt: String
}
