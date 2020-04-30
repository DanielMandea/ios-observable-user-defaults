import XCTest
@testable import ObservableUserDefaults

final class SyncUserDefaultsTests: XCTestCase {
    
    // MARK: - TestVariables
    
    var syncExample: SyncExample!
    var sdkPort: Int!
    var observable: NSObject?
    
    // MARK: - Setup
    
    override func setUp() {
        super.setUp()
        syncExample = SyncExample()
    }
    
    func testExample() {
        let exp = expectation(description: "sync")
        observable = syncExample.$sdkPort.observe { old, new in
            exp.fulfill()
            self.sdkPort = new
            XCTAssertEqual(self.sdkPort, self.syncExample.sdkPort)
        }
        syncExample.sdkPort = 443
        wait(for: [exp], timeout: 2)
    }
    
    static var allTests = [
        ("testExample", testExample),
    ]
}


class SyncExample {
    @ObservableUserDefaults(key: .sdkPort, defaultValue: 8080)
    var sdkPort: Int
}

// Declare a new key
extension ObservableKey {
    static let sdkPort: ObservableKey = "sdkPort"
}
