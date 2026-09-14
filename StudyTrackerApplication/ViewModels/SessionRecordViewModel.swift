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
    
    func sessionLog(subjectName: String, studySessionDuration: Int) {
        if(subjectName.isEmpty) {
            return
        }
        if(studySessionDuration <= 0) {
            return
        }
        let newStudySession = SessionRecord(
            subjectName: subjectName,
            studySessionDuration: studySessionDuration,
            sessionDate: Date())
        
        repository.saveASession(newStudySession)
        loadAllSessionData()
    }
}
