//
//  CreateBlockAction.swift
//  RaiSwift
//
//  Created by Jonathan Willis on 1/16/18.
//

import Foundation

// Requires enable_control in your RaiBlocks
// Creates work
public struct BlockCreateAction: RPCAction {

    public let action = "block_create"
    let type: BlockType
    let key: PrivateKey
    let account: Account
    let representative: Account
    let source: Hash

    public struct Result: RPCResult {
        let hash: Hash
        let block: Block
    }
}

extension BlockCreateAction.Result: Equatable {
    public static func ==(lhs: BlockCreateAction.Result,
                          rhs: BlockCreateAction.Result) -> Bool {
        return lhs.block == rhs.block && lhs.hash == rhs.hash
    }
}
