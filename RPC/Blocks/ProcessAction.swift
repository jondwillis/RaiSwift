//
//  ProcessAction.swift
//  RaiSwift
//
//  Created by Jonathan Willis on 1/16/18.
//

import Foundation
//{
//    "action": "process",
//    "block": "{
//    \"type\": \"open\",
//    \"account\": \"xrb_3e3j5tkog48pnny9dmfzj1r16pg8t1e76dz5tmac6iq689wyjfpi00000000\",
//    \"representative\": \"xrb_3e3j5tkog48pnny9dmfzj1r16pg8t1e76dz5tmac6iq689wyjfpi00000000\",
//    \"source\": \"FA5B51D063BADDF345EFD7EF0D3C5FB115C85B1EF4CDE89D8B7DF3EAF60A04A4\",
//    \"work\": \"0000000000000000\",
//    \"signature\": \"00000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000\"
//}"
//}

public struct ProcessAction: RPCAction {
    public let action = "process"
    let block: Block

    public struct Result: RPCResult {

    }
}
