import Foundation
import API

extension Task where Failure == Error {

    static func retrying(
        priority: TaskPriority? = nil,
        maxRetryCount: Int = 3,
        retryDelay: Double = 1,
        operation: @Sendable @escaping () async throws -> Success
    ) -> Task {
        Task(priority: priority) {
            for _ in 0..<maxRetryCount {
                do {
                    return try await operation()
                } catch {
                    let nanosecondsInOneSecond: Double = 1_000_000_000
                    let delay = UInt64(nanosecondsInOneSecond * retryDelay)
                    try await Task<Never, Never>.sleep(nanoseconds: delay)
                }
            }

            try Task<Never, Never>.checkCancellation()
            return try await operation()
        }
    }

}
