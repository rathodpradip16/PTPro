// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetListingDetailsStep2Query: GraphQLQuery {
    static let operationName: String = "getListingDetailsStep2"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getListingDetailsStep2($listId: String!, $preview: Boolean) { getListingDetails(listId: $listId, preview: $preview) { __typename results { __typename id userId title description coverPhoto } status errorMessage } }"#
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

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getListingDetails", GetListingDetails?.self, arguments: [
          "listId": .variable("listId"),
          "preview": .variable("preview")
        ]),
      ] }

      var getListingDetails: GetListingDetails? { __data["getListingDetails"] }

      /// GetListingDetails
      ///
      /// Parent Type: `AllListing`
      struct GetListingDetails: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AllListing }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", Results?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var results: Results? { __data["results"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// GetListingDetails.Results
        ///
        /// Parent Type: `ShowListing`
        struct Results: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.ShowListing }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("userId", String?.self),
            .field("title", String?.self),
            .field("description", String?.self),
            .field("coverPhoto", Int?.self),
          ] }

          var id: Int? { __data["id"] }
          var userId: String? { __data["userId"] }
          var title: String? { __data["title"] }
          var description: String? { __data["description"] }
          var coverPhoto: Int? { __data["coverPhoto"] }
        }
      }
    }
  }

}