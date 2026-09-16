//
//  WeeklyStudyProgressView.swift
//  StudyTrackerApplication
//
//  Created by Alik Orgun on 13/9/2026.
//


import SwiftUI

struct WeeklyStudyProgressView: View {
    @ObservedObject var viewModel: WeeklyStudyProgressViewModel

    let dayLabels = ["Mon", "Tue", "Wed", "Thu", "Fri", "Sat", "Sun"]

    var body: some View {
        VStack(spacing: 24) {
            Text("Weekly progress")
                .font(.title3)
                .bold()

            let checklist = viewModel.dailyProgressChecklist()

            List {
                ForEach(0..<7) { index in
                    HStack {
                        Text(dayLabels[index])
                            .font(.headline)

                        Spacer()

                        if checklist[index] {
                            Image(systemName: "checkmark.circle.fill")
                                .foregroundColor(.green)
                        } else {
                            Image(systemName: "circle")
                                .foregroundColor(.gray)
                        }
                    }
                }
            }
            .listStyle(.plain)

            Spacer()
        }
        .padding()
        .onAppear {
            viewModel.weeklyProgressLoad()
        }
    }
}

#Preview {
    WeeklyStudyProgressView(
        viewModel: WeeklyStudyProgressViewModel(
            studyRepository: StudyRepositoryImplementation()
        )
    )
}
