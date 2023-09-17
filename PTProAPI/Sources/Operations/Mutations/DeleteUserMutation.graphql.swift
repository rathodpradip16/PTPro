// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class DeleteUserMutation: GraphQLMutation {
  public static let operationName: String = "deleteUser"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation deleteUser { deleteUser { __typename status errorMessage } }"#
    ))

  public init() {}

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("deleteUser", DeleteUser?.self),
    ] }

    public var deleteUser: DeleteUser? { __data["deleteUser"] }

    /// DeleteUser
    ///
    /// Parent Type: `UserCommon`
    public struct DeleteUser: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.UserCommon }
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
