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
    
    func taskCompletion(_ task: StudyTask) {
        if let taskIndex = studyTasks.firstIndex(where: { $0.id == task.id }) {
            studyTasks[taskIndex].isTaskDone = true
            repository.updatingTask(studyTasks[taskIndex])
        }
    }
    
    func taskDeletion(_ task: StudyTask) {
        repository.deletingTask(task)
    }
}
