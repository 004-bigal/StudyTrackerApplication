//
//  HomeScreenView.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 13/9/2026.
//

import SwiftUI

struct HomeScreenView: View {
    var body: some View {
        NavigationStack {
            VStack(spacing: 20) {
                NavigationLink("Log a study session") {
                    SessionRecordView()
                }
                
                NavigationLink("Study tasks") {
                    StudyTaskView()
                }
                NavigationLink("Weekly progress") {
                    WeeklyStudyProgressView(viewModel: WeeklyStudyProgressViewModel(repository: StudyRepositoryImplementation()))
                }
            }
        }
    }
}

#Preview {
    HomeScreenView()
}
