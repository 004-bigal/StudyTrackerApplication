//
//  AppDomainErrors.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 16/9/2026.
//
import Foundation

// this file contains the code for errors in this app

// this enum here deals with errors for creating a study task
enum StudyTaskErrors: LocalizedError {
    case emptyName

    // this provides a clear error message for the user
    // in this case, it displays a clear error message for an empty task name
    var errorDescription: String? {
        switch self {
        case .emptyName:
            return "The task name cannot be empty"
        }
    }
}

// this enum here deals with any errors in recording a study session
enum SesisonRecordError: LocalizedError {
    case subjectNameMissing
    case studyTimeDurationMissing
    
    // provides a clear error message for the user
    // in this case here, the code here makes the app display missing field error messages
    var errorDescription: String? {
        switch self {
        case .subjectNameMissing:
            return "The subject name cannot be empty"
        case .studyTimeDurationMissing:
            return "The study time field cannot be empty"
        }
    }
}
