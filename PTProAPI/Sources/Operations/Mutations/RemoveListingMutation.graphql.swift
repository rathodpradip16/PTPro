// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class RemoveListingMutation: GraphQLMutation {
  public static let operationName: String = "RemoveListing"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      mutation RemoveListing($listId: Int!) {
        RemoveListing(listId: $listId) {
          __typename
          results {
            __typename
            id
            name
          }
          status
          errorMessage
        }
      }
      """
    ))

  public var listId: Int

  public init(listId: Int) {
    self.listId = listId
  }

  public var __variables: Variables? { ["listId": listId] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Selection] { [
      .field("RemoveListing", RemoveListing?.self, arguments: ["listId": .variable("listId")]),
    ] }

    public var removeListing: RemoveListing? { __data["RemoveListing"] }

    /// RemoveListing
    ///
    /// Parent Type: `ListPhotosCommon`
    public struct RemoveListing: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.ListPhotosCommon }
      public static var __selections: [Selection] { [
        .field("results", [Result?]?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var results: [Result?]? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// RemoveListing.Result
      ///
      /// Parent Type: `ListPhotos`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PTProAPI.Objects.ListPhotos }
        public static var __selections: [Selection] { [
          .field("id", Int.self),
          .field("name", String?.self),
        ] }

        public var id: Int { __data["id"] }
        public var name: String? { __data["name"] }
      }
    }
  }
}
