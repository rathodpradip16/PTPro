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
        let cache = InMemoryNormalizedCache()
        let store1 = ApolloStore(cache: cache)
        let configuration = URLSessionConfiguration.default
        if let token = Utility.shared.getCurrentUserToken(){
            configuration.httpAdditionalHeaders = ["auth": token ] // Replace `<token>`
        }
        let url = URL(string:graphQLEndpoint)!
        let client1 = URLSessionClient(sessionConfiguration: configuration, callbackQueue: nil)
        //  let provider = DefaultInterceptorProvider(client: client1, shouldInvalidateClientOnDeinit: true, store: store1)
        let provider =  NetworkInterceptorProvider(client: client1, shouldInvalidateClientOnDeinit: true, store: store1)
        let requestChainTransport = RequestChainNetworkTransport(interceptorProvider: provider,
                                                                 endpointURL: url)
        return ApolloClient(networkTransport: requestChainTransport,
                            store: store1)
    }()
}

class AuthorizationInterceptor: ApolloInterceptor {
    func interceptAsync<Operation>(chain: Apollo.RequestChain, request: Apollo.HTTPRequest<Operation>, response: Apollo.HTTPResponse<Operation>?, completion: @escaping (Swift.Result<Apollo.GraphQLResult<Operation.Data>, Error>) -> Void) where Operation : Apollo.GraphQLOperation {
        if let token = Utility.shared.getCurrentUserToken(){
            request.addHeader(name: "auth", value: token as String)
        }
        request.cachePolicy = .fetchIgnoringCacheData
        print("request :\(request)")
        print("response :\(String(describing: response))")
        
        chain.proceedAsync(request: request, response: response, interceptor: AuthorizationInterceptor(), completion: completion)
    }
    
    var id: String = ""
}


class NetworkInterceptorProvider: DefaultInterceptorProvider {
    
    override func interceptors<Operation>(for operation: Operation) -> [ApolloInterceptor] where Operation : GraphQLOperation {
        var interceptors = super.interceptors(for: operation)
        interceptors.insert(AuthorizationInterceptor(), at: 0)
        return interceptors
    }
    
}

//private let store: ApolloStore
//private let client: URLSessionClient
//
//init(store: ApolloStore,
//      client: URLSessionClient) {
//  self.store = store
//  self.client = client
//}
//
//func interceptors<Operation: GraphQLOperation>(for operation: Operation) -> [ApolloInterceptor] {
//  return [
//    MaxRetryInterceptor(),
//    CacheReadInterceptor(store: self.store),
//    UserManagementInterceptor(),
//    RequestLoggingInterceptor(),
//    NetworkFetchInterceptor(client: self.client),
//    ResponseLoggingInterceptor(),
//    ResponseCodeInterceptor(),
//    JSONResponseParsingInterceptor(cacheKeyForObject: self.store.cacheKeyForObject),
//    AutomaticPersistedQueryInterceptor(),
//    CacheWriteInterceptor(store: self.store)
//  ]
//}
