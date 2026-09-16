//
//  SessionRecordViewModel.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 13/9/2026.
//
import Foundation
import Combine

class SessionRecordViewModel: ObservableObject {
    @Published var sessionRecord: [SessionRecord] = []
    let repository: StudyRepository
    
    init(repository: StudyRepository) {
        self.repository = repository
    }
    
    func loadAllSessionData() {
        sessionRecord = repository.retrieveAllSessionData()
    }
    
    func sessionLog(subjectName: String, studySessionDuration: Int) throws {

        guard !subjectName.trimmingCharacters(in: .whitespaces).isEmpty else {
            throw SesisonRecordError.subjectNameMissing
        }

        guard studySessionDuration > 0 else {
            throw SesisonRecordError.studyTimeDurationMissing
        }

        let newStudySession = SessionRecord(
            subjectName: subjectName,
            studySessionDuration: studySessionDuration,
            sessionDate: Date()
        )

        repository.saveASession(newStudySession)
        loadAllSessionData()
    }
}
