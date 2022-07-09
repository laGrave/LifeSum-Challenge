public protocol ProjectLoggerInterface {

    func debug(_ message: String)
    func warning(_ message: String)
    func error(_ message: String)

}