import XCTest

#if !canImport(ObjectiveC)
public func allTests() -> [XCTestCaseEntry] {
    return [
        testCase(M17_Swift_CLITests.allTests),
    ]
}
#endif
