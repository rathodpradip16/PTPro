// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetAffiliateUserStepSuccessQuery: GraphQLQuery {
  public static let operationName: String = "getAffiliateUserStepSuccess"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query getAffiliateUserStepSuccess($userId: String) { getAffiliateUserStepSuccess(userId: $userId) { __typename status errorMessage } }"#
    ))

  public var userId: GraphQLNullable<String>

  public init(userId: GraphQLNullable<String>) {
    self.userId = userId
  }

  public var __variables: Variables? { ["userId": userId] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("getAffiliateUserStepSuccess", GetAffiliateUserStepSuccess?.self, arguments: ["userId": .variable("userId")]),
    ] }

    public var getAffiliateUserStepSuccess: GetAffiliateUserStepSuccess? { __data["getAffiliateUserStepSuccess"] }

    /// GetAffiliateUserStepSuccess
    ///
    /// Parent Type: `AffiliatestepType`
    public struct GetAffiliateUserStepSuccess: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.AffiliatestepType }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}
