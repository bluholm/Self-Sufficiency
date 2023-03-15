//
//  SettingsSchemeTests.swift
//  collapseTests
//
//  Created by Marc-Antoine BAR on 2023-03-08.
//

import XCTest
@testable import Self_Sufficiency

final class SettingsSchemeTests: XCTestCase {

    func testReturnNameSchemeLangageFileFr() {
        // Given
        UserDefaults.standard.set(["fr"], forKey: "AppleLanguages")
        // When
        let resultFrench = SchemeService.returnNameSchemeLangageFile()
        // Then
        XCTAssertEqual(resultFrench, "french")
        
    }
    
    func testReturnNameSchemeLangageFileEn() {
        // Given
        UserDefaults.standard.set(["en"], forKey: "AppleLanguages")
        // When
        let resultEnglish = SchemeService.returnNameSchemeLangageFile()
        // Then
        XCTAssertEqual(resultEnglish, "english")
        
    }
    func testReturnNameSchemeLangageFileSp() {
        // Given
        UserDefaults.standard.set(["es"], forKey: "AppleLanguages")
        // When
        let resultUnknown = SchemeService.returnNameSchemeLangageFile()
        // Then
        XCTAssertEqual(resultUnknown, "english")
    }
    
    func testLangageFr() {
        // Given
        UserDefaults.standard.set(["fr"], forKey: "AppleLanguages")
        // When
        let resultFrench = SchemeService.langage()
        // Then
        XCTAssertEqual(resultFrench, "fr")
    }
    
    func testLangageEn() {
        // Given
        UserDefaults.standard.set(["en"], forKey: "AppleLanguages")
        // When
        let resultEnglish = SchemeService.langage()
        // Then
        XCTAssertEqual(resultEnglish, "en")
    }
    
    func testLangageEs() {
        // Given
        UserDefaults.standard.set(["es"], forKey: "AppleLanguages")
        // When
        let resultUnknown = SchemeService.langage()
        // Then
        XCTAssertEqual(resultUnknown, "en")
    }
    
}
