//
//  Courses.swift
//  surfTestTask
//
//  Created by Ivan Savkov on 6.02.23.
//

import Foundation

public struct Course {
    let name: String
    
    init(name: String) {
        self.name = name
    }
}

extension Course {
    public typealias CourseModel = [Course]
}


    




