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
    @StateObject private var viewModel = StudyTaskViewModel(repository: StudyRepositoryImplementation())
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
                List(viewModel.studyTasks) { task in
                    HStack {

                        VStack(alignment: .leading) {
                            Text(task.taskName)
                                .font(.headline)

                            Text("Created: \(task.dateCreated.formatted())")
                                .font(.caption)
                                .foregroundColor(.secondary)
                        }

                        Spacer()

                        if task.isTaskDone {
                            Text("Done")
                                .foregroundColor(.green)
                                .font(.caption)
                        } else {
                            Button("Complete") {
                                viewModel.taskCompletion(task)
                            }
                            .font(.caption)
                        }

                        Button("Delete") {
                            viewModel.taskDeletion(task)
                        }
                        .font(.caption)
                        .foregroundColor(.red)
                    }
                }
            }
            .frame(maxWidth: .infinity)
        }
        .padding()
        .onAppear {
            viewModel.loadTasks()
        }
    }

    private func addTask() {
        if taskName.trimmingCharacters(in: .whitespaces).isEmpty {
            errorMessage = "The task name cannot be empty."
            return
        }

        viewModel.addingTask(taskName)
        taskName = ""
        errorMessage = nil
    }
}

#Preview {
    StudyTaskView()
}
