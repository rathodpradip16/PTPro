// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetListingDetailsStep2Query: GraphQLQuery {
  public static let operationName: String = "getListingDetailsStep2"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query getListingDetailsStep2($listId: String!, $preview: Boolean) {
        getListingDetails(listId: $listId, preview: $preview) {
          __typename
          results {
            __typename
            id
            userId
            title
            description
            coverPhoto
          }
          status
          errorMessage
        }
      }
      """
    ))

  public var listId: String
  public var preview: GraphQLNullable<Bool>

  public init(
    listId: String,
    preview: GraphQLNullable<Bool>
  ) {
    self.listId = listId
    self.preview = preview
  }

  public var __variables: Variables? { [
    "listId": listId,
    "preview": preview
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Selection] { [
      .field("getListingDetails", GetListingDetails?.self, arguments: [
        "listId": .variable("listId"),
        "preview": .variable("preview")
      ]),
    ] }

    public var getListingDetails: GetListingDetails? { __data["getListingDetails"] }

    /// GetListingDetails
    ///
    /// Parent Type: `AllListing`
    public struct GetListingDetails: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.AllListing }
      public static var __selections: [Selection] { [
        .field("results", Results?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var results: Results? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// GetListingDetails.Results
      ///
      /// Parent Type: `ShowListing`
      public struct Results: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PTProAPI.Objects.ShowListing }
        public static var __selections: [Selection] { [
          .field("id", Int?.self),
          .field("userId", String?.self),
          .field("title", String?.self),
          .field("description", String?.self),
          .field("coverPhoto", Int?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var userId: String? { __data["userId"] }
        public var title: String? { __data["title"] }
        public var description: String? { __data["description"] }
        public var coverPhoto: Int? { __data["coverPhoto"] }
      }
    }
  }
}
