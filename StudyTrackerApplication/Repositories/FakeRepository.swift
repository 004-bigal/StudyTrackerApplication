//
//  FakeRepository.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 16/9/2026.
//

class FakeRepository: StudyRepository {
    var sessionRecords: [SessionRecord] = []
    var studyTasks: [StudyTask] = []

    func saveASession(_ sessionRecord: SessionRecord) {
        sessionRecords.append(sessionRecord)
    }

    func retrieveAllSessionData() -> [SessionRecord] {
        sessionRecords
    }
    
    func retrieveAllStudyTasks() -> [StudyTask] {
        studyTasks
    }

    func addingTask(_ studyTask: StudyTask) {
        studyTasks.append(studyTask)
    }

    func deletingTask(_ studyTask: StudyTask) {
        studyTasks.removeAll { $0.id == studyTask.id }
    }

    func updatingTask(_ studyTask: StudyTask) {
        if let index = studyTasks.firstIndex(where: { $0.id == studyTask.id }) {
            studyTasks[index] = studyTask
        }
    }
}

