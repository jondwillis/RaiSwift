//
//  BlockType.swift
//  RaiSwift
//
//  Created by Jonathan Willis on 1/7/18.
//

import Foundation

public enum BlockType: String, CustomStringConvertible, Codable {
    case open, receive, send, change

    public var description: String {
        return self.rawValue
    }
}
