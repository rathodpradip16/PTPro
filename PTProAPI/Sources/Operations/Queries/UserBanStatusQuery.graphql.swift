// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UserBanStatusQuery: GraphQLQuery {
  public static let operationName: String = "UserBanStatus"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query UserBanStatus { getUserBanStatus { __typename status userBanStatus errorMessage } }"#
    ))

  public init() {}

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("getUserBanStatus", GetUserBanStatus?.self),
    ] }

    public var getUserBanStatus: GetUserBanStatus? { __data["getUserBanStatus"] }

    /// GetUserBanStatus
    ///
    /// Parent Type: `UserType`
    public struct GetUserBanStatus: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.UserType }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("userBanStatus", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var userBanStatus: Int? { __data["userBanStatus"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}
