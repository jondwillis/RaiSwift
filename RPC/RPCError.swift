//
//  RPCError.swift
//  Nimble
//
//  Created by Jonathan Willis on 1/12/18.
//

import Foundation

public enum RPCError: Error {
    case unexpectedResponse
    case deserializationFailed
    case requestError(error: Error)
    case apiError(error: Result)

    public struct Result: Decodable, Error {
        let error: String
    }
}

extension RPCError.Result: Equatable {
    public static func ==(lhs: RPCError.Result, rhs: RPCError.Result) -> Bool {
        return lhs.error == rhs.error
    }
}
