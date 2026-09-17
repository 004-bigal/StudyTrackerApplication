//
//  StudyRepository.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 13/9/2026.
//

import Foundation

// defines the repository utilised throughout the application
// abstracts the underlying data layer and allows view models and use cases to interact with both the study tasks and the session
// this supports functions such as creating, retrieving study session data, as well as creating, retrieving, updating and deleting study tasks
protocol StudyRepository {
    var sessionRecords: [SessionRecord] { get }
    var studyTasks: [StudyTask] { get }
    func saveASession(_ sessionRecord: SessionRecord)
    func retrieveAllSessionData() -> [SessionRecord]
    func retrieveAllStudyTasks() -> [StudyTask]
    func addingTask(_ studyTask: StudyTask)
    func deletingTask(_ studyTask: StudyTask)
    func updatingTask(_ studyTask: StudyTask)
}
