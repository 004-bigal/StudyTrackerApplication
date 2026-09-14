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
    @State var errorMessage: String?
    let theViewModel = SessionRecordViewModel(repository: StudyRepositoryImplementation())
    var body: some View {
        
        if let errorMessage = errorMessage {
            Text(errorMessage)
                .foregroundStyle(.red)
        }
        
        VStack(spacing: 20) {

            TextField("Name of the subject", text: $subjectName)
                .textFieldStyle(.roundedBorder)

            TextField("Duration (minutes)", text: $studySessionDuration)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)

            Button("Log session") { logStudySession() }
            .buttonStyle(.borderedProminent)

            VStack {
                List(theViewModel.sessionRecord) { session in
                    VStack(alignment: .leading) {
                        Text(session.subjectName)
                            .font(.headline)
                        Text("Duration: \(session.studySessionDuration) min")
                        Text("Date: \(session.sessionDate.formatted())")
                            .font(.caption)
                            .foregroundStyle(.secondary)
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .onAppear {
            theViewModel.loadAllSessionData()
        }
    }

    func logStudySession() {
        guard let duration = Int(studySessionDuration) else {
            errorMessage = "The duration of the study session must be a number"
            return
        }

        theViewModel.sessionLog(
            subjectName: subjectName,
            studySessionDuration: duration
        )

        subjectName = ""
        studySessionDuration = ""
        errorMessage = nil
        }
    }

#Preview {
    SessionRecordView()
}
