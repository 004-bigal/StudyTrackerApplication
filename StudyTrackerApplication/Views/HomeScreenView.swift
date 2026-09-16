//
//  HomeScreenView.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 13/9/2026.
//

import SwiftUI

struct HomeScreenView: View {
    let sharedRepository = StudyRepositoryImplementation()
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                NavigationLink("Log a study session") {
                    SessionRecordView(
                        theViewModel: SessionRecordViewModel(repository: sharedRepository)
                    )
                }
                
                NavigationLink("Study tasks") {
                    StudyTaskView(
                        viewModel: StudyTaskViewModel(studyRepository: sharedRepository)
                    )
                }
                NavigationLink("Weekly progress") {
                    WeeklyStudyProgressView(
                        viewModel: WeeklyStudyProgressViewModel(repository: sharedRepository))
                    }
            }
        }
    }
}

#Preview {
    HomeScreenView()
}
