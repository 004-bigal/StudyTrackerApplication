//
//  StudyTrackerApplicationTests.swift
//  StudyTrackerApplicationTests
//
//  Created by Alik Orgun on 7/9/2026.
//

// testing file for 8 test cases pertaining to each of the three business cases
import XCTest
@testable import StudyTrackerApplication

final class StudyTrackerApplicationTests: XCTestCase {

    // test that deals with creating a study task with a valid name
    func test_createTask_succeeds_withValidName() {
        let studyRepository = FakeRepository()
        let useCase = CreateStudyTaskUseCase(studyRepository: studyRepository)

        XCTAssertNoThrow(try useCase.executeCreateStudyTaskUseCase(taskName: "Programming revision"))
        XCTAssertEqual(studyRepository.studyTasks.count, 1)
    }

    // test that deals with a task with no inputted name
    func test_createTask_fails_whenNameIsEmpty() {
        let studyRepository = FakeRepository()
        let useCase = CreateStudyTaskUseCase(studyRepository: studyRepository)

        XCTAssertThrowsError(try useCase.executeCreateStudyTaskUseCase(taskName: "")) { error in
            XCTAssertEqual(error as? StudyTaskErrors, .emptyName)
        }
    }

    // test that deals with logging a session with a valid study time duration
    func test_logSession_succeeds_withValidDuration() {
        let studyRepository = FakeRepository()
        let useCase = LogStudySessionUseCase(studyRepository: studyRepository)

        XCTAssertNoThrow(try useCase.executeLogStudySessionUseCase(subjectName: "Mathematics 1", studyTimeDuration: 25))
        XCTAssertEqual(studyRepository.sessionRecords.count, 1)
    }

    // test that deals with the study duration time being zero
    func test_logSession_fails_whenDurationIsZero() {
        let studyRepository = FakeRepository()
        let useCase = LogStudySessionUseCase(studyRepository: studyRepository)

        XCTAssertThrowsError(try useCase.executeLogStudySessionUseCase(subjectName: "Advanced C++ Dev", studyTimeDuration: 0)) { error in
            XCTAssertEqual(error as? SesisonRecordError, .studyTimeDurationMissing)
        }
    }
    
    // test that deals with failing to log a study session when the input subject name is empty
    func test_logSession_fails_whenSubjectNameIsEmpty() {
        let studyRepository = FakeRepository()
        let useCase = LogStudySessionUseCase(studyRepository: studyRepository)

        XCTAssertThrowsError(try useCase.executeLogStudySessionUseCase(subjectName: "", studyTimeDuration: 30)) { error in
            XCTAssertEqual(error as? SesisonRecordError, .subjectNameMissing)
        }
    }
    
    // test that deals with the business use case returning an empty list if the repository contains no session records
    func test_weeklyProgress_returnsEmptyWhenNoSessions() {
        let studyRepository = FakeRepository()
        let useCase = GenerateWeeklyProgressUseCase(studyRepository: studyRepository)

        let result = useCase.executeGenerateWeeklyProgressUseCase()

        XCTAssertEqual(result.count, 0)
    }
    
    // test that deals with making sure the business use case returns all stored session records when more than one session exists in the repo
    func test_weeklyProgress_returnsAllSessions() {
        let studyRepository = FakeRepository()

        studyRepository.sessionRecords.append(
            SessionRecord(subjectName: "Technological Research Methods", studySessionDuration: 60, sessionDate: Date())
        )
        studyRepository.sessionRecords.append(
            SessionRecord(subjectName: "Advanced Swift Coding or something", studySessionDuration: 90, sessionDate: Date())
        )

        let useCase = GenerateWeeklyProgressUseCase(studyRepository: studyRepository)
        let result = useCase.executeGenerateWeeklyProgressUseCase()

        XCTAssertEqual(result.count, 2)
    }
    
    // test that deals with making sure the business use case returns the correct session object and data fields as stored in the
    // repo
    func test_doesWeeklyProgress_returnTheCorrectSessionData() {
        let studyRepository = FakeRepository()

        let studySession = SessionRecord(
            subjectName: "Modern History",
            studySessionDuration: 100,
            sessionDate: Date()
        )

        studyRepository.sessionRecords.append(studySession)

        let useCase = GenerateWeeklyProgressUseCase(studyRepository: studyRepository)
        let result = useCase.executeGenerateWeeklyProgressUseCase()

        XCTAssertEqual(result.first?.subjectName, "Modern History")
        XCTAssertEqual(result.first?.studySessionDuration, 100)
    }

}
