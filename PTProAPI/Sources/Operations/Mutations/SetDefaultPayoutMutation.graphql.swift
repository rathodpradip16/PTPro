// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class SetDefaultPayoutMutation: GraphQLMutation {
  public static let operationName: String = "setDefaultPayout"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      mutation setDefaultPayout($id: Int!, $type: String!) {
        setDefaultPayout(id: $id, type: $type) {
          __typename
          status
          errorMessage
        }
      }
      """
    ))

  public var id: Int
  public var type: String

  public init(
    id: Int,
    type: String
  ) {
    self.id = id
    self.type = type
  }

  public var __variables: Variables? { [
    "id": id,
    "type": type
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Selection] { [
      .field("setDefaultPayout", SetDefaultPayout?.self, arguments: [
        "id": .variable("id"),
        "type": .variable("type")
      ]),
    ] }

    public var setDefaultPayout: SetDefaultPayout? { __data["setDefaultPayout"] }

    /// SetDefaultPayout
    ///
    /// Parent Type: `Payout`
    public struct SetDefaultPayout: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.Payout }
      public static var __selections: [Selection] { [
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}
