//
//  StudyRepositoryImplementation.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 13/9/2026.
//

class StudyRepositoryImplementation {
    var sessionRecords: [SessionRecord] = []
    var studyTasks: [StudyTask] = []
    func saveASession(_ sessionRecord: SessionRecord) {
        sessionRecords.append(sessionRecord)
    }
    func retrieveAllSessionData() -> [SessionRecord] {
        return sessionRecord
    }
    func retrieveAllStudyTasks() -> [StudyTask] {
        return studyTasks
    }
    func addingTask(_ studyTask: StudyTask) {
        studyTask.append(StudyTask)
    }
    func deletingTask(_ studyTask: StudyTask) {
        studyTask.remove(StudyTask)
    }
    func updatingTask(_ studyTask: StudyTask) {
        
    }
}
