//
//  AppDependency.swift
//  surfTestTask
//
//  Created by Ivan Savkov on 6.02.23.
//

import Foundation


protocol HasDependencies {
    var dataStore: DataStoreProtocol { get }
}

class AppDependency {
    let ds: DataStore
    
    init(ds: DataStore) {
        self.ds = ds
    }
    
    static func makeDefault() -> AppDependency {
        let ds = DataStore()
        return AppDependency(ds: ds)
    }
}

extension AppDependency: HasDependencies {
    var dataStore: DataStoreProtocol {
        return self.ds
    }
    
    
}
