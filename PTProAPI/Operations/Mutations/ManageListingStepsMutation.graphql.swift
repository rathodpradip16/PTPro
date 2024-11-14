// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class ManageListingStepsMutation: GraphQLMutation {
    static let operationName: String = "manageListingSteps"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation manageListingSteps($listId: String!, $currentStep: Int!) { ManageListingSteps(listId: $listId, currentStep: $currentStep) { __typename results { __typename id listId step1 step2 step3 listing { __typename id isReady isPublished listApprovalStatus user { __typename userBanStatus } } } status errorMessage } }"#
      ))

    public var listId: String
    public var currentStep: Int

    public init(
      listId: String,
      currentStep: Int
    ) {
      self.listId = listId
      self.currentStep = currentStep
    }

    public var __variables: Variables? { [
      "listId": listId,
      "currentStep": currentStep
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("ManageListingSteps", ManageListingSteps?.self, arguments: [
          "listId": .variable("listId"),
          "currentStep": .variable("currentStep")
        ]),
      ] }

      var manageListingSteps: ManageListingSteps? { __data["ManageListingSteps"] }

      /// ManageListingSteps
      ///
      /// Parent Type: `ShowListingCommon`
      struct ManageListingSteps: PTProAPI.SelectionSet {
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

        /// ManageListingSteps.Results
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
          ] }

          var id: Int? { __data["id"] }
          var listId: Int? { __data["listId"] }
          var step1: String? { __data["step1"] }
          var step2: String? { __data["step2"] }
          var step3: String? { __data["step3"] }
          var listing: Listing? { __data["listing"] }

          /// ManageListingSteps.Results.Listing
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
              .field("isPublished", Bool?.self),
              .field("listApprovalStatus", String?.self),
              .field("user", User?.self),
            ] }

            var id: Int? { __data["id"] }
            var isReady: Bool? { __data["isReady"] }
            var isPublished: Bool? { __data["isPublished"] }
            var listApprovalStatus: String? { __data["listApprovalStatus"] }
            var user: User? { __data["user"] }

            /// ManageListingSteps.Results.Listing.User
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