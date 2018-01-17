//
//  ChainAction.swift
//  RaiSwift
//
//  Created by Jonathan Willis on 1/15/18.
//

import Foundation

public struct ChainAction: RPCAction {

    public let action = "chain"
    let block: Hash
    let count: UInt64

    public struct Result: RPCResult {
        let blocks: [String]
    }
}

extension ChainAction.Result: Equatable {
    public static func ==(lhs: ChainAction.Result, rhs: ChainAction.Result) -> Bool {
        return lhs.blocks.elementsEqual(rhs.blocks)
    }
}
