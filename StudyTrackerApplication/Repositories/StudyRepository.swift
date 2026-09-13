//
//  StudyRepository.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 13/9/2026.
//

import Foundation

protocol StudyRepository {
    func SaveASession()
    func retrieveAllSessionData()
    func retrieveAllStudyTasks()
}
