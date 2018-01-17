//
//  Action.swift
//  Nimble
//
//  Created by Jonathan Willis on 1/12/18.
//

import Foundation

public protocol RPCAction: Codable {
    var action: String { get }
    associatedtype Result: RPCResult
    func dispatch(with config: RPCConfiguration,
                 completionHandler: @escaping ((Result?, RPCError?) -> Void)) -> URLSessionDataTask
}

extension RPCAction {

    public func dispatch(
        with config: RPCConfiguration,
        completionHandler: @escaping ((Result?, RPCError?) -> Void)) -> URLSessionDataTask {

        let task = config
            .urlSession
            .dataTask(with: config.request(action: self)) { data, _, error in

                guard error == nil else {
                    completionHandler(nil, RPCError.requestError(error: error!))
                    return
                }

                guard let data = data else {
                    completionHandler(nil, RPCError.unexpectedResponse)
                    return
                }

                let string = String.init(data: data, encoding: .utf8)

                do {
                    let result = try config.decoder.decode(Result.self, from: data)
                    completionHandler(result, nil)
                } catch(let originalError) {
                    do {
                        let result = try config.decoder.decode(RPCError.Result.self, from: data)
                        completionHandler(nil, RPCError.apiError(error: result))
                    } catch(let error) {
                        print(originalError)
                        completionHandler(nil, RPCError.deserializationFailed)
                    }
                }
        }
        task.resume()
        return task
    }
}
