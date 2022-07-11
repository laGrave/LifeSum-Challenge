import Combine

extension Future where Failure == ServiceError {

    convenience init(operation: @escaping () async -> Result<Output, Failure>) {
        self.init { promise in
            Task {
                let output = await operation()
                promise(output)
            }
        }
    }

}
