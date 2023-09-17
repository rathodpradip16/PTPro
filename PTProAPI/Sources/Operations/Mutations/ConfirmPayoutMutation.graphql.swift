// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ConfirmPayoutMutation: GraphQLMutation {
  public static let operationName: String = "confirmPayout"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation confirmPayout($currentAccountId: String) { confirmPayout(currentAccountId: $currentAccountId) { __typename status errorMessage } }"#
    ))

  public var currentAccountId: GraphQLNullable<String>

  public init(currentAccountId: GraphQLNullable<String>) {
    self.currentAccountId = currentAccountId
  }

  public var __variables: Variables? { ["currentAccountId": currentAccountId] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("confirmPayout", ConfirmPayout?.self, arguments: ["currentAccountId": .variable("currentAccountId")]),
    ] }

    public var confirmPayout: ConfirmPayout? { __data["confirmPayout"] }

    /// ConfirmPayout
    ///
    /// Parent Type: `PayoutWholeType`
    public struct ConfirmPayout: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.PayoutWholeType }
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
