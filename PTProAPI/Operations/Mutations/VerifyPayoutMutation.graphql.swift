// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class VerifyPayoutMutation: GraphQLMutation {
  public static let operationName: String = "verifyPayout"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"mutation verifyPayout($stripeAccount: String) { verifyPayout(stripeAccount: $stripeAccount) { __typename status connectUrl successUrl failureUrl stripeAccountId errorMessage } }"#
    ))

  public var stripeAccount: GraphQLNullable<String>

  public init(stripeAccount: GraphQLNullable<String>) {
    self.stripeAccount = stripeAccount
  }

  public var __variables: Variables? { ["stripeAccount": stripeAccount] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Apollo.Selection] { [
      .field("verifyPayout", VerifyPayout?.self, arguments: ["stripeAccount": .variable("stripeAccount")]),
    ] }

    public var verifyPayout: VerifyPayout? { __data["verifyPayout"] }

    /// VerifyPayout
    ///
    /// Parent Type: `GetPayoutType`
    public struct VerifyPayout: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.GetPayoutType }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("connectUrl", String?.self),
        .field("successUrl", String?.self),
        .field("failureUrl", String?.self),
        .field("stripeAccountId", String?.self),
        .field("errorMessage", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var connectUrl: String? { __data["connectUrl"] }
      public var successUrl: String? { __data["successUrl"] }
      public var failureUrl: String? { __data["failureUrl"] }
      public var stripeAccountId: String? { __data["stripeAccountId"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}