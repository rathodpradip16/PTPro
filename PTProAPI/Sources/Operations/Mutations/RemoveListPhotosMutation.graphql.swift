// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class RemoveListPhotosMutation: GraphQLMutation {
  public static let operationName: String = "RemoveListPhotos"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      mutation RemoveListPhotos($listId: Int!, $name: String) {
        RemoveListPhotos(listId: $listId, name: $name) {
          __typename
          status
          errorMessage
        }
      }
      """
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
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Selection] { [
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
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.ListPhotosCommon }
      public static var __selections: [Selection] { [
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
    }
  }
}
