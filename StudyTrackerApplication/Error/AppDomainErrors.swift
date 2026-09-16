//
//  AppDomainErrors.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 16/9/2026.
//
import Foundation

enum StudyTaskErrors: LocalizedError {
    case emptyName

    var errorDescription: String? {
        switch self {
        case .emptyName:
            return "The task name cannot be empty"
        }
    }
}

enum SesisonRecordError: LocalizedError {
    case subjectNameMissing
    case studyTimeDurationMissing
    
    var errorDescription: String? {
        switch self {
        case .subjectNameMissing:
            return "The subject name cannot be empty"
        case .studyTimeDurationMissing:
            return "The study time field cannot be empty"
        }
    }
}
