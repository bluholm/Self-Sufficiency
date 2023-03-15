//
//  JsonService.swift
//  collapse
//
//  Created by Marc-Antoine BAR on 2023-02-08.
//

import Foundation

/// This class provides methods for parsing JSON data and retrieving data from a JSON file.
final class JsonService {
    
    /// Loads a JSON file from the main bundle and decodes it into an object of type T.
    ///
    /// - Parameter filename: The name of the JSON file to load.
    /// - Returns: An instance of type T, created by decoding the JSON file.
    /// - Throws: A fatalError if the file is not found, cannot be loaded, or cannot be parsed.
    ///
    /// This function searches for a JSON file with the specified name in the main bundle. If the file is found,
    /// it is loaded into a Data object. Then, a JSONDecoder is used to decode the Data object into an instance
    /// of type T, which is returned. If any of these steps fail, a fatalError is thrown with a description of
    /// the error.
    static func load<T: Decodable>(_ filename: String) -> T {
        let data: Data

        guard let file = Bundle.main.url(forResource: filename, withExtension: "json")
            else {
                fatalError("Couldn't find \(filename) in main bundle.")
        }

        do {
            data = try Data(contentsOf: file)
        } catch {
            fatalError("Couldn't load \(filename) from main bundle:\n\(error)")
        }

        do {
            let decoder = JSONDecoder()
            return try decoder.decode(T.self, from: data)
        } catch {
            fatalError("Couldn't parse \(filename) as \(T.self):\n\(error)")
        }
    }
    
    /// Loads all topic elements, items, and links from separate JSON files and combines them into a single
    /// array of TopicElement objects.
    ///
    /// - Returns: An array of TopicElement objects containing the combined data from the separate JSON files.
    ///
    /// This function first loads the topic, item, and link lists from the specified JSON files. Then, it iterates
    /// through the topic list and for each topic, finds the associated items and links using the topic and item
    /// identifiers. A new TopicElement object is created for each topic with the associated items and links, and
    /// this object is appended to the `allEntries` array. The `allEntries` array is then returned.
    static func loadAllEntries() -> [TopicElement] {
        let topicsList: [TopicElement] = load("topics")
        let itemsList: [Item] = load("items")
        let linksList: [Link] = load("links")

        var allEntries: [TopicElement] = []

        for topic in topicsList {
            let filteredItems = itemsList.filter { $0.idTopic == topic.uid }
            let filteredLinks = linksList.filter { link in
                filteredItems.contains { item in
                    item.links.contains { $0 == link }
                }
            }

            let newTopic = TopicElement(uid: topic.uid,
                                        title: topic.title,
                                        subtitle: topic.subtitle,
                                        image: topic.image,
                                        descriptionShort: topic.descriptionShort,
                                        descriptionLong: topic.descriptionLong,
                                        items: filteredItems,
                                        links: filteredLinks,
                                        isPremium: topic.isPremium)

            allEntries.append(newTopic)
        }

        return allEntries
    }

}
