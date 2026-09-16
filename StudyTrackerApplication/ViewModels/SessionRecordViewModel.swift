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
    @Published var errorMessage: String = ""
    
    private let studyRepository: StudyRepository
    private let logStudySessionUseCase: LogStudySessionUseCase
    
    init(studyRepository: StudyRepository) {
        self.studyRepository = studyRepository
        self.logStudySessionUseCase = LogStudySessionUseCase(studyRepository: studyRepository)
    }
    
    func loadAllSessionData() {
        sessionRecord = studyRepository.retrieveAllSessionData()
    }
    
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
