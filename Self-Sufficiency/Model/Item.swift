//
//  Item.swift
//  Self-Sufficiency
//
//  Created by Marc-Antoine BAR on 2023-03-15.
//

import Foundation

// MARK: - Item
/// Item is a Swift struct that conforms to the Decodable protocol.
struct Item: Codable, Equatable {
    
    /// String representing the unique identifier
    ///
    /// Id must be Unique
    ///
    let id: String
    
    /// Id connected to the topics
    let idTopic: String
    
    /// String representing the title of the item
    let title: String
    
    /// content: an array of Content structs, representing the contents of the item
    let content: [Content]
    
    /// list of links
    var links: [Link]
    
    /// String representing the mode of the item mode has to bee :
    ///
    /// The mode HAVE to be one of these words :
    ///  - `essential`,
    ///  - `intermediate`
    ///  - `advanced`
    let mode: String
    
    static func == (lhs: Item, rhs: Item) -> Bool {
            return lhs.id == rhs.id &&
                lhs.title == rhs.title &&
                lhs.content == rhs.content &&
                lhs.mode == rhs.mode &&
                lhs.idTopic == rhs.idTopic &&
                lhs.links == rhs.links
        }
    
    enum CodingKeys: String, CodingKey {
        
            case id
            case title
            case mode
            case links
            case content
            case idTopic = "id_topic"
    }
}
