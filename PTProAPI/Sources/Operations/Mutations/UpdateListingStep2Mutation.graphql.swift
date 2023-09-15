// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class UpdateListingStep2Mutation: GraphQLMutation {
  public static let operationName: String = "UpdateListingStep2"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      mutation UpdateListingStep2($id: Int, $description: String, $title: String, $coverPhoto: Int) {
        updateListingStep2(
          id: $id
          description: $description
          title: $title
          coverPhoto: $coverPhoto
        ) {
          __typename
          status
          results {
            __typename
            id
            title
            description
            coverPhoto
          }
          errorMessage
        }
      }
      """
    ))

  public var id: GraphQLNullable<Int>
  public var description: GraphQLNullable<String>
  public var title: GraphQLNullable<String>
  public var coverPhoto: GraphQLNullable<Int>

  public init(
    id: GraphQLNullable<Int>,
    description: GraphQLNullable<String>,
    title: GraphQLNullable<String>,
    coverPhoto: GraphQLNullable<Int>
  ) {
    self.id = id
    self.description = description
    self.title = title
    self.coverPhoto = coverPhoto
  }

  public var __variables: Variables? { [
    "id": id,
    "description": description,
    "title": title,
    "coverPhoto": coverPhoto
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Selection] { [
      .field("updateListingStep2", UpdateListingStep2?.self, arguments: [
        "id": .variable("id"),
        "description": .variable("description"),
        "title": .variable("title"),
        "coverPhoto": .variable("coverPhoto")
      ]),
    ] }

    public var updateListingStep2: UpdateListingStep2? { __data["updateListingStep2"] }

    /// UpdateListingStep2
    ///
    /// Parent Type: `EditListingResponse`
    public struct UpdateListingStep2: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.EditListingResponse }
      public static var __selections: [Selection] { [
        .field("status", Int?.self),
        .field("results", Results?.self),
        .field("errorMessage", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var results: Results? { __data["results"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// UpdateListingStep2.Results
      ///
      /// Parent Type: `EditListing`
      public struct Results: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PTProAPI.Objects.EditListing }
        public static var __selections: [Selection] { [
          .field("id", Int?.self),
          .field("title", String?.self),
          .field("description", String?.self),
          .field("coverPhoto", Int?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var title: String? { __data["title"] }
        public var description: String? { __data["description"] }
        public var coverPhoto: Int? { __data["coverPhoto"] }
      }
    }
  }
}
