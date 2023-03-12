//
//  TopicService.swift
//  collapseTests
//
//  Created by Marc-Antoine BAR on 2023-03-09.
//

import XCTest
@testable import Self_Sufficiency

final class TopicServiceTest: XCTestCase {

    func testLoadFilteredItemsForTableView() throws {
        // Arrange
        let topic = FakeTopicElement.topic0
        SettingsRepository.mode = Mode.intermediate.jsonReferenceName
        
        // Act
        let result = TopicService.loadFilteredItemsForTableView(topic: topic)
        
        // Assert
        XCTAssertEqual(result.count, 2)
        // XCTAssertEqual(result[0], [FakeTopicElement.item1])
        // XCTAssertEqual(result[1], [FakeTopicElement.item2])
    }

}
