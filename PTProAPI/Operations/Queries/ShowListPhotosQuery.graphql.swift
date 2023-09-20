// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class ShowListPhotosQuery: GraphQLQuery {
  public static let operationName: String = "ShowListPhotos"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"query ShowListPhotos($listId: Int!) { showListPhotos(listId: $listId) { __typename results { __typename id listId name type isCover photosCount } status errorMessage } }"#
    ))

  public var listId: Int

  public init(listId: Int) {
    self.listId = listId
  }

  public var __variables: Variables? { ["listId": listId] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Apollo.Selection] { [
      .field("showListPhotos", ShowListPhotos?.self, arguments: ["listId": .variable("listId")]),
    ] }

    public var showListPhotos: ShowListPhotos? { __data["showListPhotos"] }

    /// ShowListPhotos
    ///
    /// Parent Type: `ListPhotosCommon`
    public struct ShowListPhotos: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListPhotosCommon }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("results", [Result?]?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var results: [Result?]? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// ShowListPhotos.Result
      ///
      /// Parent Type: `ListPhotos`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { PTProAPI.Objects.ListPhotos }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("id", Int.self),
          .field("listId", Int.self),
          .field("name", String?.self),
          .field("type", String?.self),
          .field("isCover", Int?.self),
          .field("photosCount", Int?.self),
        ] }

        public var id: Int { __data["id"] }
        public var listId: Int { __data["listId"] }
        public var name: String? { __data["name"] }
        public var type: String? { __data["type"] }
        public var isCover: Int? { __data["isCover"] }
        public var photosCount: Int? { __data["photosCount"] }
      }
    }
  }
}
