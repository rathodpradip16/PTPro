// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class RemoveListingMutation: GraphQLMutation {
  public static let operationName: String = "RemoveListing"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"mutation RemoveListing($listId: Int!) { RemoveListing(listId: $listId) { __typename results { __typename id name } status errorMessage } }"#
    ))

  public var listId: Int

  public init(listId: Int) {
    self.listId = listId
  }

  public var __variables: Variables? { ["listId": listId] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("RemoveListing", RemoveListing?.self, arguments: ["listId": .variable("listId")]),
    ] }

    public var removeListing: RemoveListing? { __data["RemoveListing"] }

    /// RemoveListing
    ///
    /// Parent Type: `ListPhotosCommon`
    public struct RemoveListing: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ListPhotosCommon }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
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
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ListPhotos }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("name", String?.self),
        ] }

        public var id: Int { __data["id"] }
        public var name: String? { __data["name"] }
      }
    }
  }
}
