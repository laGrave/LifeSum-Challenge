public class DependenciesContainer {

    public let services: ServicesDependency
    let tools: ToolsDependency

    public init() {
        tools = ToolsDependency()
        services = .init(tools: tools)
    }

}
