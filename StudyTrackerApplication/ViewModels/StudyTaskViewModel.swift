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
    private let studyRepository: StudyRepository
    private let createStudyTaskUseCase: CreateStudyTaskUseCase
    @Published var errorMessage: String = ""
    
    init(studyRepository: StudyRepository) {
        self.studyRepository = studyRepository
        self.createStudyTaskUseCase = CreateStudyTaskUseCase(studyRepository: studyRepository)
    }
    
    func loadTasks() {
        studyTasks = studyRepository.retrieveAllStudyTasks()
    }
    
    func addingTask(_ nameOfTask: String) {
        do {
            try createStudyTaskUseCase.executeCreateStudyTaskUseCase(taskName: nameOfTask)
            loadTasks()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    func taskCompletion(_ task: StudyTask) {
        if let taskIndex = studyTasks.firstIndex(where: { $0.id == task.id }) {
            var updatedTask = studyTasks
            updatedTask[taskIndex].isTaskDone = true
            studyTasks = updatedTask
            studyRepository.updatingTask(studyTasks[taskIndex])
        }
    }

    
    func taskDeletion(_ task: StudyTask) {
        if let index = studyTasks.firstIndex(where: { $0.id == task.id }) {
            studyTasks.remove(at: index)
            studyRepository.deletingTask(task)
        }
    }

}
