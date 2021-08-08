//
//  Follower.swift
//  Github Followers
//
//  Created by Vitaliy Yefimchuk on 27.07.2021.
//

import Foundation

struct Follower: Codable, Hashable {
    let login: String
    let avatarUrl: String
}
