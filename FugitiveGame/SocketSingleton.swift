//
//  SocketSingleton.swift
//  FugitiveGame
//
//  Created by Michael Cheng on 10/10/15.
//  Copyright © 2015 Michael Cheng. All rights reserved.
//

import Socket_IO_Client_Swift

class SocketSingleton {
    static let sharedInstance = SocketSingleton()
    var singleSocket: SocketIOClient?
    
    func socket() -> SocketIOClient {
        if singleSocket == nil {
            singleSocket = SocketIOClient(socketURL: host);
        }
        return singleSocket!
    }
}