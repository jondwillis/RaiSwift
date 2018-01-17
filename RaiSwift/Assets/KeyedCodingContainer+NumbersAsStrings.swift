//
//  KeyedCodingContainer+NumbersAsStrings.swift
//  RaiSwift
//
//  Created by Jonathan Willis on 1/15/18.
//

import Foundation


// API incorrectly returns numbers as strings
public extension KeyedDecodingContainer {

    public func decode(_ type: Float.Type, forKey key: Key) throws -> Float {
        let stringValue = try self.decode(String.self, forKey: key)
        guard let floatValue = Float(stringValue) else {
            let context = DecodingError.Context(codingPath: codingPath,
                                                debugDescription: "Could not parse json key to a Float object")
            throw DecodingError.dataCorrupted(context)
        }
        return floatValue
    }

    public func decode(_ type: Double.Type, forKey key: Key) throws -> Double {
        let stringValue = try self.decode(String.self, forKey: key)
        guard let floatValue = Double(stringValue) else {
            let context = DecodingError.Context(codingPath: codingPath,
                                                debugDescription: "Could not parse json key to a Double object")
            throw DecodingError.dataCorrupted(context)
        }
        return floatValue
    }

    public func decode(_ type: UInt64.Type, forKey key: Key) throws -> UInt64 {
        let stringValue = try self.decode(String.self, forKey: key)
        guard let floatValue = UInt64(stringValue) else {
            let context = DecodingError.Context(codingPath: codingPath,
                                                debugDescription: "Could not parse json key to a Int object")
            throw DecodingError.dataCorrupted(context)
        }
        return floatValue
    }

}
