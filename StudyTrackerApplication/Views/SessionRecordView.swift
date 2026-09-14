//
//  SessionRecordView.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 13/9/2026.
//

import SwiftUI

struct SessionRecordView: View {
    @State var subjectName: String = ""
    @State var studySessionDuration: String = ""
    let theViewModel = SessionRecordViewModel(repository: StudyRepositoryImplementation())
    var body: some View {
        VStack(spacing: 20) {
            
        }
    }
}

#Preview {
    SessionRecordView()
}
