//
//  Content.swift
//  Self-Sufficiency
//
//  Created by Marc-Antoine BAR on 2023-03-15.
//

import Foundation

// MARK: - Content
/// Content is a Swift struct that conforms to the Codable protocol. It has two properties:
struct Content: Codable, Equatable {
    
    /// type: a String representing the type of content (e.g., "text", "image", "video", etc.)
    let type: String
    
    /// value: a String representing the actual content (e.g., the text string, image URL, video URL, etc.)
    let value: String
    
}
