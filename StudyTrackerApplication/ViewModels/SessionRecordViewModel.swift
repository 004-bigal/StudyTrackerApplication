//
//  SessionRecordViewModel.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 13/9/2026.
//
import Foundation
import Combine

// the view model responsible for managing study session data
class SessionRecordViewModel: ObservableObject {
    @Published var sessionRecord: [SessionRecord] = []
    @Published var errorMessage: String = ""
    
    private let studyRepository: StudyRepository
    private let logStudySessionUseCase: LogStudySessionUseCase
    
    // initialiser
    init(studyRepository: StudyRepository) {
        self.studyRepository = studyRepository
        self.logStudySessionUseCase = LogStudySessionUseCase(studyRepository: studyRepository)
    }
    
    // loads all study session data from the session records
    func loadAllSessionData() {
        sessionRecord = studyRepository.retrieveAllSessionData()
    }
    
    // logs a study session
    func sessionLog(_ subject: String, _ duration: Int) {
        do {
            try logStudySessionUseCase.executeLogStudySessionUseCase(
                subjectName: subject,
                studyTimeDuration: duration
            )
            loadAllSessionData()
        } catch {
            errorMessage = error.localizedDescription
        }
    }
}
