//
//  BlockCount.swift
//  Nimble
//
//  Created by Jonathan Willis on 1/12/18.
//

import Foundation

public struct BlockCountAction: RPCAction {

    public let action = "block_count"

    public struct Result: RPCResult {
        let count: UInt64
        let unchecked: UInt64
    }
}
