//
//  StudyTaskView.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 13/9/2026.
//

import SwiftUI

struct StudyTaskView: View {
    @State private var taskName: String = ""
    @State private var errorMessage: String?
    let viewModel = StudyTaskViewModel(repository: StudyRepositoryImplementation())
    var body: some View {
        
    }
}

#Preview {
    StudyTaskView()
}
