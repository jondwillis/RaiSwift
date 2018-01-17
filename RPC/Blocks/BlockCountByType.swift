//
//  BlockCountByType.swift
//  Nimble
//
//  Created by Jonathan Willis on 1/15/18.
//

import Foundation

public struct BlockCountByTypeAction: RPCAction {

    public let action = "block_count_type"

    public struct Result: RPCResult {
        let send: UInt64
        let receive: UInt64
        let open: UInt64
        let change: UInt64
    }
}

