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
    
    func addingTask(_ nameOfTask: String) throws {
        guard !nameOfTask.trimmingCharacters(in: .whitespaces).isEmpty else {
            throw StudyTaskErrors.emptyName
        }
        let newTask = StudyTask(
            taskName: nameOfTask,
            isTaskDone: false,
            dateCreated: Date()
        )
        repository.addingTask(newTask)
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
