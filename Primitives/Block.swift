//
//  BlockCreator.swift
//  RaiSwift
//
//  Created by Jonathan Willis on 1/7/18.
//

import Foundation

public struct Block: Codable {

    let type: BlockType
    let previous: Hash?
    let source: Hash?
    let work: Work?
    let signature: String?
    let destination: Account?
    let representative: Account?
    let account: Account?
    let balance: Raw?
    let amount: Raw?
}

extension Block: Equatable {
    public static func ==(lhs: Block, rhs: Block) -> Bool {
        return lhs.type == rhs.type &&
            lhs.previous == rhs.previous &&
            lhs.source == rhs.source &&
            lhs.work == rhs.work &&
            lhs.signature == rhs.signature &&
            lhs.destination == rhs.destination &&
            lhs.representative == rhs.representative &&
            lhs.account == rhs.account &&
            lhs.balance == rhs.balance &&
            lhs.amount == rhs.amount
    }
}

// the RPC protocol incorrectly returns json as stringified json...
extension KeyedDecodingContainer {

    public func decode(_ type: Block.Type, forKey key: Key) throws -> Block {

        guard
            let data = try self.decode(String.self, forKey: key).data(using: .utf8)
            else {
                let context = DecodingError.Context(codingPath: codingPath,
                                                    debugDescription: "Could not parse json key to a Block object")
                throw DecodingError.dataCorrupted(context)
            }

        // I don't like having a random decoder here, but I couldn't determine an alternative.
        let blockValue = try JSONDecoder().decode(Block.self, from: data)
        return blockValue
    }
}

extension KeyedEncodingContainer {

    public mutating func encode(_ value: Block, forKey key: Key) throws {

        let encoded = try JSONEncoder().encode(value)
//        self.encod
    }
}

