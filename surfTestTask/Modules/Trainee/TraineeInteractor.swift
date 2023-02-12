//
//  TraineeInteractor.swift
//  surfTestTask
//
//  Created by Ivan Savkov on 6.02.23.
//  
//

import Foundation

final class TraineeInteractor {
    weak var output: TraineeInteractorOutput?
    private let ds: DataStoreProtocol
    
    init(ds: DataStoreProtocol) {
        self.ds = ds
    }
}

extension TraineeInteractor: TraineeInteractorInput {
    func loadCourses() {
        ds.requestCourses { [self] courses in
            output?.didLoad(courses)
        }
    }
}


