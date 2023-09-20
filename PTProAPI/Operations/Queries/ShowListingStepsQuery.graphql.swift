// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class ShowListingStepsQuery: GraphQLQuery {
    static let operationName: String = "ShowListingSteps"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query ShowListingSteps($listId: String!) { showListingSteps(listId: $listId) { __typename results { __typename id listId step1 step2 step3 listing { __typename id isReady listApprovalStatus isPublished user { __typename userBanStatus } } isPhotosAdded } status errorMessage } }"#
      ))

    public var listId: String

    public init(listId: String) {
      self.listId = listId
    }

    public var __variables: Variables? { ["listId": listId] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("showListingSteps", ShowListingSteps?.self, arguments: ["listId": .variable("listId")]),
      ] }

      var showListingSteps: ShowListingSteps? { __data["showListingSteps"] }

      /// ShowListingSteps
      ///
      /// Parent Type: `ShowListingCommon`
      struct ShowListingSteps: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.ShowListingCommon }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("results", Results?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var results: Results? { __data["results"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// ShowListingSteps.Results
        ///
        /// Parent Type: `ShowListingSteps`
        struct Results: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.ShowListingSteps }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("id", Int?.self),
            .field("listId", Int?.self),
            .field("step1", String?.self),
            .field("step2", String?.self),
            .field("step3", String?.self),
            .field("listing", Listing?.self),
            .field("isPhotosAdded", Bool?.self),
          ] }

          var id: Int? { __data["id"] }
          var listId: Int? { __data["listId"] }
          var step1: String? { __data["step1"] }
          var step2: String? { __data["step2"] }
          var step3: String? { __data["step3"] }
          var listing: Listing? { __data["listing"] }
          var isPhotosAdded: Bool? { __data["isPhotosAdded"] }

          /// ShowListingSteps.Results.Listing
          ///
          /// Parent Type: `ShowListing`
          struct Listing: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ShowListing }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("id", Int?.self),
              .field("isReady", Bool?.self),
              .field("listApprovalStatus", String?.self),
              .field("isPublished", Bool?.self),
              .field("user", User?.self),
            ] }

            var id: Int? { __data["id"] }
            var isReady: Bool? { __data["isReady"] }
            var listApprovalStatus: String? { __data["listApprovalStatus"] }
            var isPublished: Bool? { __data["isPublished"] }
            var user: User? { __data["user"] }

            /// ShowListingSteps.Results.Listing.User
            ///
            /// Parent Type: `User`
            struct User: PTProAPI.SelectionSet {
              let __data: DataDict
              init(_dataDict: DataDict) { __data = _dataDict }

              static var __parentType: Apollo.ParentType { PTProAPI.Objects.User }
              static var __selections: [Apollo.Selection] { [
                .field("__typename", String.self),
                .field("userBanStatus", Int?.self),
              ] }

              var userBanStatus: Int? { __data["userBanStatus"] }
            }
          }
        }
      }
    }
  }

}