// https://github.com/Quick/Quick

import Quick
import Nimble
@testable import RaiSwift

class RPCBlockSpec: QuickSpec {
    override func spec() {

        let proofOfWorkTimeout: TimeInterval = 10

        class TestRPCConfiguration: RPCConfiguration {

            lazy var urlSession = URLSession.shared

            lazy var decoder = JSONDecoder()

            lazy var encoder = JSONEncoder()

            lazy var baseURL = URL(string: "http://[::1]:7076/")!
        }

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

            it("succeeds in getting block count by type") {

                var result: BlockCountByTypeAction.Result?

                // valid as of jan 15 2018
                // if you have a less sync'd client, this test will fail.
                // you may reduce the values to the amount returned by the result
                let expectation = BlockCountByTypeAction.Result(send: 1_000_000,
                                                                receive: 1_000_000,
                                                                open: 300_000,
                                                                change: 1_000)

                let action = BlockCountByTypeAction()

                task = action.dispatch(with: config) { r, error in
                    expect(error).to(beNil())
                    guard let r = r else {
                        fail("should receive result")
                        return
                    }
                    result = r
                }

                expect(result?.send).toEventually(beGreaterThan(expectation.send))
                expect(result?.receive).toEventually(beGreaterThanOrEqualTo(expectation.receive))
                expect(result?.open).toEventually(beGreaterThanOrEqualTo(expectation.open))
                expect(result?.change).toEventually(beGreaterThanOrEqualTo(expectation.change))
            }

            context("chain") {
                it("succeeds") {

                    var result: ChainAction.Result?

                    let expectation =
                        ChainAction.Result(blocks: ["F513D3FE2EBA131DA67D77DA6611BA59D6857AC2311A29EEA3E08C6174FC91F2"])

                    let action = ChainAction(
                        block: "F513D3FE2EBA131DA67D77DA6611BA59D6857AC2311A29EEA3E08C6174FC91F2",
                        count: 1)

                    task = action.dispatch(with: config) { r, error in
                        expect(error).to(beNil())
                        guard let r = r else {
                            fail("should receive result")
                            return
                        }
                        result = r
                    }

                    expect(result).toEventually(equal(expectation), timeout: 3)
                }

                it("fails") {

                    var result: ChainAction.Result?

                    let expectation =
                        ChainAction.Result(blocks: ["F513D3FE2EBA131DA67D77DA6611BA59D6857AC2311A29EEA3E08C6174FC91F2"])

                    let action = ChainAction(
                        block: "F513D3FE2EBA131DA67D77DA6611BA59D6857AC2311A29EEA3E08C6174FC91F2",
                        count: 2)

                    task = action.dispatch(with: config) { r, error in
                        expect(error).to(beNil())
                        guard let r = r else {
                            fail("should receive result")
                            return
                        }
                        result = r
                    }

                    expect(result).toEventuallyNot(equal(expectation))
                }
            }

            // incomplete, there are also receive, send, etc.
            context("create block") {
                typealias Action = BlockCreateAction

                it("open succeeds") {
                    var result: Action.Result?

                    let action = Action(type: .open,
                                        key: "0000000000000000000000000000000000000000000000000000000000000004",
                                        account: "xrb_3ki9xhhqq78nbximf91k8h7xac1xwewruf41c1g6j4igu6785j3gbth6tb38",
                                        representative: "xrb_1hgyx78bst6z3p73o3dbkqs5skhp8xsoi1biggk88a9fgnysj8pmawt56bft",
                                        source: "19D3D919475DEED4696B5D13018151D1AF88B2BD3BCFF048B45031C1F36D1858")

                    task = action.dispatch(with: config) { r, error in
                        expect(error).to(beNil())
                        guard let r = r else {
                            fail("should receive result")
                            return
                        }
                        result = r
                    }

                    expect(result?.hash.count).toEventually(equal(64), timeout: proofOfWorkTimeout)
                    expect(result?.block.type).toEventually(equal(BlockType.open))
                    expect(result?.block.source?.count).toEventually(equal(64))
                    expect(result?.block.work?.count).toEventually(equal(16))
                    expect(result?.block.signature?.count).toEventually(equal(128))
                    expect(result?.block.representative)
                        .toEventually(equal("xrb_1hgyx78bst6z3p73o3dbkqs5skhp8xsoi1biggk88a9fgnysj8pmawt56bft"))
                    expect(result?.block.account)
                        .toEventually(equal("xrb_33fy4hcnfz74f5q3qeu7ir3b3eo6mdirpx77gr1xqzu56ucrj6u1qx1q1rk9"))
                }
                it("open without private key fails") {

                    var result: RPCError.Result?

                    let expectedResult = RPCError.Result(error: "Bad private key")

                    let action = Action(type: .open,
                                        key: "",
                                        account: "xrb_3ki9xhhqq78nbximf91k8h7xac1xwewruf41c1g6j4igu6785j3gbth6tb38",
                                        representative: "xrb_1hgyx78bst6z3p73o3dbkqs5skhp8xsoi1biggk88a9fgnysj8pmawt56bft",
                                        source: "19D3D919475DEED4696B5D13018151D1AF88B2BD3BCFF048B45031C1F36D1858")

                    task = action.dispatch(with: config) { r, error in
                        guard r == nil else {
                            fail("should not receive result")
                            return
                        }

                        guard let error = error,
                            case RPCError.apiError(let apiError) = error else {
                            fail("unexpected or nil error")
                            return
                        }

                        result = apiError
                    }

                    expect(result).toEventually(equal(expectedResult), timeout: proofOfWorkTimeout)
                }
                it("open with invalid account fails") {

                    var result: RPCError.Result?

                    let expectedResult = RPCError.Result(error: "Bad account number")

                    let action = Action(type: .open,
                                        key: "0000000000000000000000000000000000000000000000000000000000000004",
                                        account: "",
                                        representative: "xrb_1hgyx78bst6z3p73o3dbkqs5skhp8xsoi1biggk88a9fgnysj8pmawt56bft",
                                        source: "19D3D919475DEED4696B5D13018151D1AF88B2BD3BCFF048B45031C1F36D1858")

                    task = action.dispatch(with: config) { r, error in
                        guard r == nil else {
                            fail("should not receive result")
                            return
                        }

                        guard let error = error,
                            case RPCError.apiError(let apiError) = error else {
                                fail("unexpected or nil error")
                                return
                        }

                        result = apiError
                    }

                    expect(result).toEventually(equal(expectedResult), timeout: proofOfWorkTimeout)

                }
            }
            context("process") {
                it("succeeds") {

                }
            }
        }
    }
}
