//
//  MockData.swift
//  surfTestTask
//
//  Created by Ivan Savkov on 10.02.23.
//

import Foundation

struct MockData {
    static let shared = MockData()
    
    var pageData: [Section] {
        [.sectionOne, .sectionTwo]
    }
}

enum Section {
    case sectionOne
    case sectionTwo
}
