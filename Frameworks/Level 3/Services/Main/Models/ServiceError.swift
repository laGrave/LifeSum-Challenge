public enum ServiceError: Error {

    case notFound(NotFoundError)
    case underlying(Error)
    case serviceReleased

}
