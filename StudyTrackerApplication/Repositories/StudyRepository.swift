//
//  StudyRepository.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 13/9/2026.
//

import Foundation

protocol StudyRepository {
    var sessionRecords: [SessionRecord] { get }
    var studyTasks: [StudyTask] { get }
    func saveASession(_ sessionRecord: SessionRecord)
    func retrieveAllSessionData() -> [SessionRecord]
    func retrieveAllStudyTasks() -> [StudyTask]
}
