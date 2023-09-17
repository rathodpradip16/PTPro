// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetActiveSocialLoginsQuery: GraphQLQuery {
  public static let operationName: String = "getActiveSocialLogins"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query getActiveSocialLogins { getActiveSocialLogins { __typename status errorMessage results { __typename facebook google } } }"#
    ))

  public init() {}

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("getActiveSocialLogins", GetActiveSocialLogins?.self),
    ] }

    public var getActiveSocialLogins: GetActiveSocialLogins? { __data["getActiveSocialLogins"] }

    /// GetActiveSocialLogins
    ///
    /// Parent Type: `SocialLoginsType`
    public struct GetActiveSocialLogins: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.SocialLoginsType }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
        .field("results", Results?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var results: Results? { __data["results"] }

      /// GetActiveSocialLogins.Results
      ///
      /// Parent Type: `ResultType`
      public struct Results: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ResultType }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("facebook", Bool?.self),
          .field("google", Bool?.self),
        ] }

        public var facebook: Bool? { __data["facebook"] }
        public var google: Bool? { __data["google"] }
      }
    }
  }
}
