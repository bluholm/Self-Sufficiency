//
//  AppData.swift
//  Self-Sufficiency
//
//  Created by Marc-Antoine BAR on 2023-03-15.
//

import Foundation

class AppData {
    
    static let shared = AppData()
    
    var topicElements: [TopicElement] = JsonService.loadAllEntries()

    private init() { }
}
