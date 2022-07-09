import SwiftyBeaver

final class ProjectLogger {

    private let swiftyBeaverLogger = SwiftyBeaver.self
    private let console = ConsoleDestination()

    init() {
        swiftyBeaverLogger.addDestination(console)
    }

}

extension ProjectLogger: ProjectLoggerInterface {

    func debug(_ message: String) {
        #if DEBUG
        swiftyBeaverLogger.debug(message)
        #endif
    }

    func warning(_ message: String) {
        #if DEBUG
        swiftyBeaverLogger.warning(message)
        #endif
    }

    func error(_ message: String) {
        #if DEBUG
        swiftyBeaverLogger.error(message)
        #endif
    }

}