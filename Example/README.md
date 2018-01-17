#  RaiSwift
Swift library for RaiBlocks node/wallet management via RPC commands
https://github.com/clemahieu/raiblocks/wiki/RPC-protocol

Written with a strong preference for prototypical Stateless components, always plain Swift 4 (addons coming)

# Usage sample
###All actions should have associated tests. Defer to tests for usage examples.
concept
```Defining configuration by implementing RPCConfiguration protocol in a Quick+Nimble Unit Test
```swift
class TestRPCConfiguration: RPCConfiguration {

    lazy var urlSession = URLSession.shared

    lazy var decoder = JSONDecoder()

    lazy var encoder = JSONEncoder()

    lazy var baseURL = URL(string: "http://[::1]:7076/")!
}

let config: RPCConfiguration = TestRPCConfiguration()

describe("RPC") {
    let config: RPCConfiguration = TestRPCConfiguration()

    var task: URLSessionDataTask?

    afterEach {
        task?.cancel()
    }

    it("succeeds in getting block count") {

        var result: BlockCountAction.Result?

        let expectation = BlockCountAction.Result(count: 5_000_000, unchecked: 0)

        let action = BlockCountAction()

        let task = action.dispatch(with: config) { r, error in
            expect(error).to(beNil())
            guard let r = r else {
                fail("should receive result")
                return
            }
            result = r
        }

        expect(result?.count).toEventually(beGreaterThan(expectation.count))
        expect(result?.unchecked).toEventually(beGreaterThanOrEqualTo(expectation.unchecked))
    }
    ...
}

Show RPC improvement progress here:
https://github.com/clemahieu/raiblocks/issues/

## Donations
Donations welcome!
XRB: xrb_1hin1zc6pnme4e8f3t51w9mb47ad9k6kxi9nsebmsctdmwcqrf7n77znipip

