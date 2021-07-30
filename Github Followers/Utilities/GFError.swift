//
//  ErrorMessages.swift
//  Github Followers
//
//  Created by Vitaliy Yefimchuk on 28.07.2021.
//

import Foundation

enum GFError: String, Error {
    case invalidUsername = "This username created an invalid request."
    case noInternet = "No internet connection"
    case unableToComplete = "Invalid response from the server"
    case invalidDataFromServer = "Server thrown an error, please check your username"
}
