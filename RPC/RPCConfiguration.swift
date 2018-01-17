//
//  RPCConfiguration.swift
//  Nimble
//
//  Created by Jonathan Willis on 1/7/18.
//

import Foundation

public protocol RPCConfiguration {
    var urlSession: URLSession { get }
    var decoder: JSONDecoder { get }
    var encoder: JSONEncoder { get }
    var baseURL: URL { get }
    func request<T: RPCAction>(action: T) -> URLRequest
}

public extension RPCConfiguration {
    func request<T: RPCAction>(action: T) -> URLRequest {
        var request = URLRequest(url: self.baseURL)
        request.httpBody = try! self.encoder.encode(action)
        request.httpMethod = "POST"
        return request
    }
}
//
//
//class ProductionAPIEnvironment: APIEnvironment {
//
//    lazy var urlSession = URLSession.shared
//
//    lazy var decoder = JSONDecoder()
//
//    lazy var baseURL = URL(string: "https://api.coinmarketcap.com/v1")!
//
//    lazy var getTicker = URLRequest(url: baseURL.appendingPathComponent("ticker",
//                                                                        isDirectory: true))
//}

