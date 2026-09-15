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
        loadTasks()
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
        studyTasks.append(newStudyTask)
    }
    
    func taskCompletion(_ task: StudyTask) {
        if let taskIndex = studyTasks.firstIndex(where: { $0.id == task.id }) {
            var updatedTask = studyTasks
            updatedTask[taskIndex].isTaskDone = true
            studyTasks = updatedTask
            repository.updatingTask(studyTasks[taskIndex])
        }
    }

    
    func taskDeletion(_ task: StudyTask) {
        if let index = studyTasks.firstIndex(where: { $0.id == task.id }) {
            studyTasks.remove(at: index)
            repository.deletingTask(task)
        }
    }

}
