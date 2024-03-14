//
//  APError.swift
//  dnxcoder-pokedex
//
//  Created by Denis Coder on 3/10/24.
//

import Foundation

enum APError: Error {
    case invalidURL
    case invalidResponse
    case invalidData
    case unableToComplete
}
