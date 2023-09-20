// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetActiveSocialLoginsQuery: GraphQLQuery {
    static let operationName: String = "getActiveSocialLogins"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getActiveSocialLogins { getActiveSocialLogins { __typename status errorMessage results { __typename facebook google } } }"#
      ))

    public init() {}

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getActiveSocialLogins", GetActiveSocialLogins?.self),
      ] }

      var getActiveSocialLogins: GetActiveSocialLogins? { __data["getActiveSocialLogins"] }

      /// GetActiveSocialLogins
      ///
      /// Parent Type: `SocialLoginsType`
      struct GetActiveSocialLogins: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.SocialLoginsType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("results", Results?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var results: Results? { __data["results"] }

        /// GetActiveSocialLogins.Results
        ///
        /// Parent Type: `ResultType`
        struct Results: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.ResultType }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("facebook", Bool?.self),
            .field("google", Bool?.self),
          ] }

          var facebook: Bool? { __data["facebook"] }
          var google: Bool? { __data["google"] }
        }
      }
    }
  }

}