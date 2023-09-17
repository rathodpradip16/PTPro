// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class RemoveListPhotosMutation: GraphQLMutation {
  public static let operationName: String = "RemoveListPhotos"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation RemoveListPhotos($listId: Int!, $name: String) { RemoveListPhotos(listId: $listId, name: $name) { __typename status errorMessage } }"#
    ))

  public var listId: Int
  public var name: GraphQLNullable<String>

  public init(
    listId: Int,
    name: GraphQLNullable<String>
  ) {
    self.listId = listId
    self.name = name
  }

  public var __variables: Variables? { [
    "listId": listId,
    "name": name
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("RemoveListPhotos", RemoveListPhotos?.self, arguments: [
        "listId": .variable("listId"),
        "name": .variable("name")
      ]),
    ] }

    public var removeListPhotos: RemoveListPhotos? { __data["RemoveListPhotos"] }

    /// RemoveListPhotos
    ///
    /// Parent Type: `ListPhotosCommon`
    public struct RemoveListPhotos: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ListPhotosCommon }
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
