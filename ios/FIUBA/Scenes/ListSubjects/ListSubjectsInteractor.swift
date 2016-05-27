//
//  ListSubjectsInteractor.swift
//  FIUBA
//

import UIKit

protocol ListSubjectsInteractorInput {
    func fetchSubjects(request: ListSubjects.Request)
}

protocol ListSubjectsInteractorOutput {
    func presentFetchedSubjects(response: ListSubjects.Response)
}

class ListSubjectsInteractor: ListSubjectsInteractorInput {
    var output: ListSubjectsInteractorOutput!
    var worker: ListSubjectsWorker!

    var subjectsWorker = SubjectsWorker()
  
    // MARK: Business logic
  
    func fetchSubjects(request: ListSubjects.Request) {
        subjectsWorker.fetchSubjects { (subjects) in
            let response = ListSubjects.Response(subjects: subjects)
            self.output.presentFetchedSubjects(response)
        }
    }

}
