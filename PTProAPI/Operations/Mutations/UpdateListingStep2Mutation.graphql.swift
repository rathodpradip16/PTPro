// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class UpdateListingStep2Mutation: GraphQLMutation {
    static let operationName: String = "UpdateListingStep2"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation UpdateListingStep2($id: Int, $description: String, $title: String, $coverPhoto: Int) { updateListingStep2( id: $id description: $description title: $title coverPhoto: $coverPhoto ) { __typename status results { __typename id title description coverPhoto } errorMessage } }"#
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

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("updateListingStep2", UpdateListingStep2?.self, arguments: [
          "id": .variable("id"),
          "description": .variable("description"),
          "title": .variable("title"),
          "coverPhoto": .variable("coverPhoto")
        ]),
      ] }

      var updateListingStep2: UpdateListingStep2? { __data["updateListingStep2"] }

      /// UpdateListingStep2
      ///
      /// Parent Type: `EditListingResponse`
      struct UpdateListingStep2: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.EditListingResponse }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("results", Results?.self),
          .field("errorMessage", String?.self),
        ] }

        var status: Int? { __data["status"] }
        var results: Results? { __data["results"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// UpdateListingStep2.Results
        ///
        /// Parent Type: `EditListing`
        struct Results: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.EditListing }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("title", String?.self),
            .field("description", String?.self),
            .field("coverPhoto", Int?.self),
          ] }

          var id: Int? { __data["id"] }
          var title: String? { __data["title"] }
          var description: String? { __data["description"] }
          var coverPhoto: Int? { __data["coverPhoto"] }
        }
      }
    }
  }

}