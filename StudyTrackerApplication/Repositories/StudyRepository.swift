//
//  StudyRepository.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 13/9/2026.
//

import Foundation

protocol StudyRepository {
    func saveASession()
    func retrieveAllSessionData()
    func retrieveAllStudyTasks()
}
