//
//  StudyTaskViewModel.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 7/9/2026.
//

import Foundation
import Combine

// the view model that manages the users study tasks
class StudyTaskViewModel: ObservableObject {
    @Published var studyTasks: [StudyTask] = []
    private let studyRepository: StudyRepository
    private let createStudyTaskUseCase: CreateStudyTaskUseCase
    @Published var errorMessage: String = ""
    
    //initialiser
    init(studyRepository: StudyRepository) {
        self.studyRepository = studyRepository
        self.createStudyTaskUseCase = CreateStudyTaskUseCase(studyRepository: studyRepository)
    }
    
    // loads study tasks
    func loadTasks() {
        studyTasks = studyRepository.retrieveAllStudyTasks()
    }
    
    // adds a study task
    func addingTask(_ nameOfTask: String) {
        do {
            try createStudyTaskUseCase.executeCreateStudyTaskUseCase(taskName: nameOfTask)
            loadTasks()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
    
    // marks study tasks as done & updates the user interface to save the change in the repo
    func taskCompletion(_ task: StudyTask) {
        if let taskIndex = studyTasks.firstIndex(where: { $0.id == task.id }) {
            var updatedTask = studyTasks
            updatedTask[taskIndex].isTaskDone = true
            studyTasks = updatedTask
            studyRepository.updatingTask(studyTasks[taskIndex])
        }
    }

    // deals with deleting tasks
    func taskDeletion(_ task: StudyTask) {
        if let index = studyTasks.firstIndex(where: { $0.id == task.id }) {
            studyTasks.remove(at: index)
            studyRepository.deletingTask(task)
        }
    }

}
