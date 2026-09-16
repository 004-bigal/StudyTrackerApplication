//
//  UseCases.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 16/9/2026.
//

import Foundation

struct CreateStudyTaskUseCase {

    let studyRepository: StudyRepository

    func executeCreateStudyTaskUseCase(taskName: String) throws {
        guard !taskName.trimmingCharacters(in: .whitespaces).isEmpty else {
            throw StudyTaskErrors.emptyName
        }

        let newTask = StudyTask(
            taskName: taskName,
            isTaskDone: false,
            dateCreated: Date()
        )

        studyRepository.addingTask(newTask)
    }
}

struct LogStudySessionUseCase {

    let studyRepository: StudyRepository

    func executeLogStudySessionUseCase(subjectName: String, studyTimeDuration: Int) throws {

        guard !subjectName.trimmingCharacters(in: .whitespaces).isEmpty else {
            throw SesisonRecordError.subjectNameMissing
        }

        guard studyTimeDuration > 0 else {
            throw SesisonRecordError.studyTimeDurationMissing
        }

        let newSession = SessionRecord(
            subjectName: subjectName,
            studySessionDuration: studyTimeDuration,
            sessionDate: Date()
        )

        studyRepository.saveASession(newSession)
    }
}

