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
    @StateObject var viewModel: StudyTaskViewModel
    var body: some View {
        if let errorMessage = errorMessage {
            Text(errorMessage)
                .foregroundColor(.red)
        }

        VStack(spacing: 20) {

            Text("STUDY TASKS")
                .font(.title3)
                .bold()

            TextField("Name of task", text: $taskName)
                .textFieldStyle(.roundedBorder)

            Button("Add task") {
                addTask()
            }
            .buttonStyle(.borderedProminent)

            VStack {
                List {
                    ForEach(Array(viewModel.studyTasks.enumerated()), id: \.element.id) { index, task in
                        HStack {
                            VStack(alignment: .leading) {
                                Text(task.taskName)
                                    .font(.headline)

                                Text("Created: \(task.dateCreated.formatted())")
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                            }

                            Spacer()
                            
                            Button("Complete") {
                                viewModel.taskCompletion(viewModel.studyTasks[index])
                            }
                            .font(.caption)


                            Button("Delete") {
                                viewModel.taskDeletion(viewModel.studyTasks[index])
                            }
                            .font(.caption)
                            .foregroundColor(.red)
                        }
                    }
                }


            }
            .frame(maxWidth: .infinity)
        }
        .padding()
    }

    private func addTask() {
        viewModel.addingTask(taskName)
        if viewModel.errorMessage.isEmpty {
            taskName = ""
            errorMessage = nil
        } else {
            errorMessage = viewModel.errorMessage
        }
    }
}

#Preview {
    StudyTaskView(
        viewModel: StudyTaskViewModel(studyRepository: StudyRepositoryImplementation())
    )
}

