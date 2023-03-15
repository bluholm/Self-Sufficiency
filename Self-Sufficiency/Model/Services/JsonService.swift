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
    
    /// Loads all entries from the JSON files and combines them into a single array of TopicElement.
    ///
    /// This function first loads the data from the JSON files "topics.json", "items.json", and "link.json" into three separate lists:
    /// - topicsList: an array of TopicElement objects
    /// - itemsList: an array of Item objects
    /// - linksList: an array of Link objects
    ///
    /// Then, it iterates through the topicsList and for each topic, it filters the items and links associated with that topic using the topic's UID and the Item's idTopic property.
    /// For each item in the filtered items list, the function filters the links associated with the item using the item's ID and the Link's idItem property.
    ///
    /// The function then creates a new array called `allEntries` to store the TopicElement objects with their associated items and links. For each topic in topicsList, it creates a new TopicElement object with the updated items and links and appends it to the `allEntries` array.
    ///
    /// - Returns: An array of TopicElement objects containing their associated items and links.

    static func loadAllEntries() -> [TopicElement] {
        let topicsList: [TopicElement] = load(Constants.topicsJsonName+SchemeService.langage())
        let itemsList: [Item] = load(Constants.itemsJsonName+SchemeService.langage())
        let linksList: [Link] = load(Constants.linksJsonName+SchemeService.langage())

        var allEntries: [TopicElement] = []

        for topic in topicsList {
            let filteredItems = itemsList.filter { $0.idTopic == topic.uid }
            
            // Filter the links related to the current topic
            let topicLinks = linksList.filter { $0.idTopic == topic.uid }
            
            // Create a new array to store the items with their associated links
            var updatedItems: [Item] = []
            
            for item in filteredItems {
                // Filter the links related to the current item
                let itemLinks = linksList.filter { $0.idItem == item.id }
                
                // Create a new item with the associated links
                let updatedItem = Item(id: item.id,
                                       idTopic: item.idTopic,
                                       title: item.title,
                                       content: item.content,
                                       links: itemLinks,
                                       mode: item.mode)
                
                updatedItems.append(updatedItem)
            }

            let newTopic = TopicElement(uid: topic.uid,
                                        title: topic.title,
                                        subtitle: topic.subtitle,
                                        image: topic.image,
                                        descriptionShort: topic.descriptionShort,
                                        descriptionLong: topic.descriptionLong,
                                        items: updatedItems,
                                        links: topicLinks,
                                        isPremium: topic.isPremium)

            allEntries.append(newTopic)
        }

        return allEntries
    }
}
