//
//  Link.swift
//  Self-Sufficiency
//
//  Created by Marc-Antoine BAR on 2023-03-15.
//

import Foundation

// MARK: - Link
/// Link is a Swift struct that conforms to both the Codable and Hashable protocols.
struct Link: Codable, Hashable {
    
    /// url: a String representing the URL of the link
    let url: String
    
    /// title: a String representing the title of the link
    let title: String
    
    /// description: a String representing the description of the link
    let description: String
    
}
