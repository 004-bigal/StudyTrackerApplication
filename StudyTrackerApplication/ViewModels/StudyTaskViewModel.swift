//
//  StudyTaskViewModel.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 7/9/2026.
//

import Foundation
import Combine

class StudyTaskViewModel: ObservableObject {
    @Published var studyTasks: [StudyTask] = []
    let repository: StudyRepository
    
    init(repository: StudyRepository) {
        self.repository = repository
    }
    
    func loadTasks() {
        studyTasks = repository.retrieveAllStudyTasks()
    }
    
    func addingTask(_ nameOfTask: String) {
        if(nameOfTask.isEmpty) {
            return
        }
        let newStudyTask = StudyTask(taskName: nameOfTask, isTaskDone: false, dateCreated: Date.now)
        
        repository.addingTask(newStudyTask)
        loadTasks()
    }
}
