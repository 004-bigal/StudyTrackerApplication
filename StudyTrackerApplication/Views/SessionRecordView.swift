//
//  SessionRecordView.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 13/9/2026.
//

import SwiftUI
//the view for displaying study session records
struct SessionRecordView: View {
    @State var subjectName: String = ""
    @State var studySessionDuration: String = ""
    @State var errorMessage: String?
    @StateObject var theViewModel: SessionRecordViewModel
    var body: some View {
        
        if let errorMessage = errorMessage {
            Text(errorMessage)
                .foregroundStyle(.red)
        }
        
        VStack(spacing: 20) {
            // textfields displaying the prompts for user to enter

            TextField("Name of the subject", text: $subjectName)
                .textFieldStyle(.roundedBorder)

            TextField("Duration (minutes)", text: $studySessionDuration)
                .keyboardType(.numberPad)
                .textFieldStyle(.roundedBorder)

            Button("Log session") { logStudySession() }
            .buttonStyle(.borderedProminent)
            // list displaying logged study sessions
            // including info such as durations, dates and subject
            // names
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
        do {
            guard !subjectName.trimmingCharacters(in: .whitespaces).isEmpty else {
                throw SesisonRecordError.subjectNameMissing
            }

            guard let duration = Int(studySessionDuration) else {
                throw SesisonRecordError.studyTimeDurationMissing
            }

            theViewModel.sessionLog(subjectName, duration)

            subjectName = ""
            studySessionDuration = ""
            errorMessage = nil

        } catch {
            errorMessage = error.localizedDescription
        }
    }
}

#Preview {
    SessionRecordView(
        theViewModel: SessionRecordViewModel(studyRepository: StudyRepositoryImplementation())
    )
}
