//
//  StudyTrackerApplicationTests.swift
//  StudyTrackerApplicationTests
//
//  Created by Alik Orgun on 7/9/2026.
//

import XCTest
@testable import StudyTrackerApplication

final class StudyTrackerApplicationTests: XCTestCase {

    func test_createTask_succeeds_withValidName() {
        let studyRepository = FakeRepository()
        let useCase = CreateStudyTaskUseCase(studyRepository: studyRepository)

        XCTAssertNoThrow(try useCase.executeCreateStudyTaskUseCase(taskName: "Programming revision"))
        XCTAssertEqual(studyRepository.studyTasks.count, 1)
    }

    func test_createTask_fails_whenNameIsEmpty() {
        let studyRepository = FakeRepository()
        let useCase = CreateStudyTaskUseCase(studyRepository: studyRepository)

        XCTAssertThrowsError(try useCase.executeCreateStudyTaskUseCase(taskName: "")) { error in
            XCTAssertEqual(error as? StudyTaskErrors, .emptyName)
        }
    }

    func test_logSession_succeeds_withValidDuration() {
        let studyRepository = FakeRepository()
        let useCase = LogStudySessionUseCase(studyRepository: studyRepository)

        XCTAssertNoThrow(try useCase.executeLogStudySessionUseCase(subjectName: "Mathematics 1", studyTimeDuration: 25))
        XCTAssertEqual(studyRepository.sessionRecords.count, 1)
    }

    func test_logSession_fails_whenDurationIsZero() {
        let studyRepository = FakeRepository()
        let useCase = LogStudySessionUseCase(studyRepository: studyRepository)

        XCTAssertThrowsError(try useCase.executeLogStudySessionUseCase(subjectName: "Advanced C++ Dev", studyTimeDuration: 0)) { error in
            XCTAssertEqual(error as? SesisonRecordError, .studyTimeDurationMissing)
        }
    }

    func test_logSession_fails_whenSubjectNameIsEmpty() {
        let studyRepository = FakeRepository()
        let useCase = LogStudySessionUseCase(studyRepository: studyRepository)

        XCTAssertThrowsError(try useCase.executeLogStudySessionUseCase(subjectName: "", studyTimeDuration: 30)) { error in
            XCTAssertEqual(error as? SesisonRecordError, .subjectNameMissing)
        }
    }
        
    func test_weeklyProgress_returnsEmptyWhenNoSessions() {
        let studyRepository = FakeRepository()
        let useCase = GenerateWeeklyProgressUseCase(studyRepository: studyRepository)

        let result = useCase.executeGenerateWeeklyProgressUseCase()

        XCTAssertEqual(result.count, 0)
    }
    
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
