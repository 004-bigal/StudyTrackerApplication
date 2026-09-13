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
}
