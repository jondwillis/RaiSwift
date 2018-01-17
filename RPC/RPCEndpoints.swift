//
//  RPCEndpoints.swift
//  RaiSwift
//
//  Created by Jonathan Willis on 1/7/18.
//

import Foundation

//public enum RPCEndpoints {
//    case blockCount
//    case balance(account: Account)
//    case blockCountForAccount(Account)
//    case information(account: Account)
//    case createAccount(wallet: Wallet, work: Bool?)
//    case getAccount(key: PublicKey)
//    case history(account: Account, limit: UInt)
//    case accounts(wallet: Wallet)
//    case move(accounts: Set<Account>, from: Wallet, to: Wallet)
//    case publicKey(account: Account)
//    case remove(account: Account)
//    case representative(account: Account)
//    case representatives(account: Account, in: Wallet, work: Bool?)
//    case weight(account: Account)
//    case balances(accounts: Set<Account>)
//    case createAccounts(in: Wallet, limit: UInt, work: Bool?)
//    case frontiers(accounts: Set<Account>)
//    case pendingBlocks(accounts: Set<Account>, limit: UInt, threshold: Raw?, source: Bool?)
//    case availableSupply
//    case block(hash: Hash)
//    case blocks(hashes: Set<Hash>)
//    case blocksDetails(hashes: Set<Hash>, pending: Bool?, source: Bool?)
//    case account(block: Hash)
//    case count(block: Hash)
//    case countByType(block: Hash)
//    case bootstrap(node: RaiNodeAddress)
//    case bootstrapAny
//    case chain(block: Hash, limit: UInt)
//    // confusing documentation - Returns a list of pairs of delegator names given account a representative and its balance
//    case delegators(account: Account)
//    case delegatorsCount(account: Account)
//
//    case deterministicKey(seed: Seed, index: UInt)
//    // confusing documentation - Returns a list of pairs of account and block hash representing the head block starting at account up to count
////    case frontiers(account: Account, count: UInt)
//    case frontierCount
//    case historyFor(block: Hash, count: UInt)
//
//    case mraiFrom(raw: Raw)
//    case mraiTo(raw: Raw)
//    case kraiFrom(raw: Raw)
//    case kraiTo(raw: Raw)
//    case raiFrom(raw: Raw)
//    case raiTo(raw: Raw)
//
//    case keepalive(node: RaiNodeAddress)
//
//    case createAdhocKey
//    case expand(privateKey: PrivateKey)
//    case ledger(account: Account, count: UInt, representative: Bool?, weight: Bool?, pending: Bool?)
//
//    // confusing documentation, what are source and previous?
//    case createReceiveBlock(
//        wallet: Wallet,
//        account: Account,
//        source: Hash,
//        previous: Hash,
//        work: Bool?
//    )
//    case createSendBlock(
//        wallet: Wallet,
//        account: Account,
//        destination: Account,
//        balance: Raw,
//        amount: Raw,
//        previous: Hash,
//        work: Bool?
//    )
//    case createChangeBlock(
//        wallet: Wallet,
//        account: Account,
//        representative: Account,
//        previous: Hash,
//        work: Bool?
//    )
//    case paymentBegin(wallet: Wallet)
//    case paymentInit(wallet: Wallet)
//    case paymentEnd(account: Account, wallet: Wallet)
//    case paymentWait(account: Account, amount: Raw, timeout: TimeInterval)
//    case process(block: BlockCreator)
//    case publish(block: BlockCreator) // alias for process
//    case receiveBlock(wallet: Wallet, account: Account, block: Hash, work: Bool?)
//    case receiveMinimum
//    case setReceiveMinimum(amount: Raw)
//
//    case allRepresentatives
//    case representativeOf(wallet: Wallet)
//    case setRepresentative(wallet: Wallet, representative: Account)
//
//    // confusing documentation - count is not clearly marked as optional
//    // what is sources here? what is count? what is destinations?
//    case republish(block: Hash, count: UInt?, sources: UInt?, destinations: UInt?)
//
//    case searchPendingBlocks(wallet: Wallet)
//    case searchPendingAll
//
//    case send(wallet: Wallet, source: Account, destination: Account, amount: Raw, work: Bool?)
//
//    case stop
//    case validate(account: Account)
//    case successors(block: Hash, count: UInt)
//
//    case version
//    case peers
//    case pending(account: Account, count: UInt, threshold: Raw?, source: Bool?)
//    case pendingExists(block: Hash)
//    case unchecked(count: UInt)
//    case uncheckedClear
//
//    case retrieveUnchecked(block: Hash)
//    // confusing documentation - Retrieves unchecked database keys, blocks hashes & a json representations of unchecked pending blocks starting from key up to count
//    // what is key?
//    case retrieveUncheckedKey(key: PublicKey, count: UInt)
//
//    case add(adhocKey: PrivateKey, to: Wallet, work: Bool?)
//    case totalBalance(wallet: Wallet)
//    case accountBalances(wallet: Wallet, threshold: Raw?)
//    case change(wallet: Wallet, seed: Seed)
//    case does(wallet: Wallet, containAccount: Account)
//    case createWallet
//    case destroy(wallet: Wallet)
//    case export(wallet: Wallet)
//    case walletFrontiers(wallet: Wallet)
//    case walletPending(wallet: Wallet, count: UInt, threshold: Raw?, source: Bool?)
//    case walletRepublish(wallet: Wallet, count: UInt)
//    case getWork(wallet: Wallet)
//    case changePassword(wallet: Wallet, password: String)
//    case unlock(wallet: Wallet, password: String)
//    case isValid(password: String, wallet: Wallet)
//    case isLocked(wallet: Wallet)
//    case cancelWork(block: Hash)
//    case generateWork(block: Hash)
//    case getWorkFor(account: Account, wallet: Wallet)
//    case setWorkFor(account: Account, wallet: Wallet, work: Work)
//    case addWorkPeer(node: RaiNodeAddress)
//    case retrieveWorkPeers
//    case clearWorkPeers
//    case isWorkValidFor(block: Hash, work: Work)

//    func toURLRequest(config: RPCConfiguration) -> URLRequest {
//        switch self {
//        case .blockCount:
//            var request = URLRequest(url: config.baseURL)
//            request.httpBody = try! config.encoder.encode(BlockCountAction())
//            return request
//        default:
//            fatalError()
//        }
//    }
//}

