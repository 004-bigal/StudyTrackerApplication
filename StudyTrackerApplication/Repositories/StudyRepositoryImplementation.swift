//
//  StudyRepositoryImplementation.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 13/9/2026.
//

class StudyRepositoryImplementation: StudyRepository {
    var sessionRecords: [SessionRecord] = []
    var studyTasks: [StudyTask] = []
    func saveASession(_ sessionRecord: SessionRecord) {
        sessionRecords.append(sessionRecord)
    }
    func retrieveAllSessionData() -> [SessionRecord] {
        return sessionRecords
    }
    func retrieveAllStudyTasks() -> [StudyTask] {
        return studyTasks
    }
    func addingTask(_ studyTask: StudyTask) {
        studyTasks.append(studyTask)
    }
    func deletingTask(_ studyTask: StudyTask) {
        if let taskIndex = studyTasks.firstIndex(where: {$0.id == studyTask.id}) {
            studyTasks.remove(at: taskIndex)
        }
    }
    func updatingTask(_ studyTask: StudyTask) {
        if let taskIndex = studyTasks.firstIndex(where: {$0.id == studyTask.id}) {
            studyTasks[taskIndex] = studyTask
        }
    }
}
