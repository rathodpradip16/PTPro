//
//  Network.swift
//  App
//
//  Created by Phycom Mac Pro on 15/09/23.
//  Copyright © 2023 RADICAL START. All rights reserved.
//

import Foundation
import Apollo

class Network{
    static let shared = Network()
    
    private(set) lazy var apollo_headerClient: ApolloClient = {
        if((Utility.shared.getCurrentUserToken()) != nil)
        {
            let cache = InMemoryNormalizedCache()
            let store1 = ApolloStore(cache: cache)
            let configuration = URLSessionConfiguration.default
            // Add additional headers as needed
            configuration.httpAdditionalHeaders = ["auth": "\(Utility.shared.getCurrentUserToken()!)"] // Replace `<token>`
            let url = URL(string:graphQLEndpoint)!
            let client1 = URLSessionClient(sessionConfiguration: configuration, callbackQueue: nil)
            let provider = DefaultInterceptorProvider(client: client1, shouldInvalidateClientOnDeinit: true, store: store1)
            let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                     endpointURL: url)
            return ApolloClient(networkTransport: requestChainTransport,
                                store: store1)
        }
        else{
            return ApolloClient(url: URL(string:graphQLEndpoint)!)
        }
    }()
        
    
    
}
