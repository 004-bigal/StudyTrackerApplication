//
//  UseCases.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 16/9/2026.
//

// this file outlines the three different business cases for the application, expressing the applications core logic

import Foundation

// this business case deals with creating a new study task
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

// this business case deals with logging a new study session into the session record
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

// this business case deals with generating weekly progress data from all stored study sessions
struct GenerateWeeklyProgressUseCase {

    let studyRepository: StudyRepository

    func executeGenerateWeeklyProgressUseCase() -> [SessionRecord] {
        return studyRepository.retrieveAllSessionData()
    }
}
