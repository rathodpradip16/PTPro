// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class DeleteUserMutation: GraphQLMutation {
  public static let operationName: String = "deleteUser"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      mutation deleteUser {
        deleteUser {
          __typename
          status
          errorMessage
        }
      }
      """
    ))

  public init() {}

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Selection] { [
      .field("deleteUser", DeleteUser?.self),
    ] }

    public var deleteUser: DeleteUser? { __data["deleteUser"] }

    /// DeleteUser
    ///
    /// Parent Type: `UserCommon`
    public struct DeleteUser: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.UserCommon }
      public static var __selections: [Selection] { [
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}
