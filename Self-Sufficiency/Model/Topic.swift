//
//  Topic+Json.swift
//  collapse
//
//  Created by Marc-Antoine BAR on 2023-02-08.
//

import Foundation

// MARK: - TopicElement
struct TopicElement: Decodable, Equatable {
    
    /// uid: a unique identifier for the topic
    let uid: String
    
    /// title: the title of the topic
    let title: String
    
    /// subtitle: a subtitle for the topic
    let subtitle: String
    
    /// image: the URL of an image for the topic
    let image: String
    
    /// descriptionShort: a short description of the topic (200 words )
    let descriptionShort: String
    
    /// descriptionLong: a longer description of the topic (500 words and more)
    let descriptionLong: String
    
    /// items: an array of Item objects that represent the subtopics or items within the topic
    let items: [Item]
    
    /// links: an array of Link objects that represent links related to the topic
    let links: [Link]
    
    /// isPremium: a Boolean value that indicates whether the topic is only available to premium users
    let isPremium: Bool
    
    static func == (lhs: TopicElement, rhs: TopicElement) -> Bool {
                return lhs.uid == rhs.uid &&
                    lhs.title == rhs.title &&
                    lhs.subtitle == rhs.subtitle &&
                    lhs.image == rhs.image &&
                    lhs.descriptionShort == rhs.descriptionShort &&
                    lhs.descriptionLong == rhs.descriptionLong &&
                    lhs.items == rhs.items &&
                    lhs.links == rhs.links &&
                    lhs.isPremium == rhs.isPremium
    }
}
