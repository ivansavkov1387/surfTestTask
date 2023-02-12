//
//  DataStore.swift
//  surfTestTask
//
//  Created by Ivan Savkov on 12.02.23.
//

class DataStore {
    public func fillModel(completion: @escaping (Course.CourseModel) -> Void) {
        let courses = [Course(name: "IOS"), Course(name: "Android"),
                       Course(name: "Design"), Course(name: "Flutter"),
                       Course(name: "QA"), Course(name: "PM"),
                       Course(name: "Бизнес анализ"), Course(name: "Frontend"),
                       Course(name: "Backend"), Course(name: "Веб-приложения")]
        completion(courses)
    }
}

protocol DataStoreProtocol {
    func requestCourses(completion: @escaping(Course.CourseModel) -> Void)
}

extension DataStore: DataStoreProtocol {
    func requestCourses(completion: @escaping (Course.CourseModel) -> Void) {
        self.fillModel(completion: completion)
    }
    
}
