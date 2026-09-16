//
//  AppDomainErrors.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 16/9/2026.
//
import Foundation

enum StudyTaskErrors: LocalizedError {
    case emptyName

    var studyTaskErrorDescription: String? {
        switch self {
        case .emptyName:
            return "The task name cannot be empty."
        }
    }
}
