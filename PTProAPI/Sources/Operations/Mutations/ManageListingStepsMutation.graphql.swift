// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ManageListingStepsMutation: GraphQLMutation {
  public static let operationName: String = "manageListingSteps"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      mutation manageListingSteps($listId: String!, $currentStep: Int!) {
        ManageListingSteps(listId: $listId, currentStep: $currentStep) {
          __typename
          results {
            __typename
            id
            listId
            step1
            step2
            step3
            listing {
              __typename
              id
              isReady
              listApprovalStatus
              isPublished
              user {
                __typename
                userBanStatus
              }
            }
          }
          status
          errorMessage
        }
      }
      """
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

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Selection] { [
      .field("ManageListingSteps", ManageListingSteps?.self, arguments: [
        "listId": .variable("listId"),
        "currentStep": .variable("currentStep")
      ]),
    ] }

    public var manageListingSteps: ManageListingSteps? { __data["ManageListingSteps"] }

    /// ManageListingSteps
    ///
    /// Parent Type: `ShowListingCommon`
    public struct ManageListingSteps: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.ShowListingCommon }
      public static var __selections: [Selection] { [
        .field("results", Results?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var results: Results? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// ManageListingSteps.Results
      ///
      /// Parent Type: `ShowListingSteps`
      public struct Results: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PTProAPI.Objects.ShowListingSteps }
        public static var __selections: [Selection] { [
          .field("id", Int?.self),
          .field("listId", Int?.self),
          .field("step1", String?.self),
          .field("step2", String?.self),
          .field("step3", String?.self),
          .field("listing", Listing?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var listId: Int? { __data["listId"] }
        public var step1: String? { __data["step1"] }
        public var step2: String? { __data["step2"] }
        public var step3: String? { __data["step3"] }
        public var listing: Listing? { __data["listing"] }

        /// ManageListingSteps.Results.Listing
        ///
        /// Parent Type: `ShowListing`
        public struct Listing: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PTProAPI.Objects.ShowListing }
          public static var __selections: [Selection] { [
            .field("id", Int?.self),
            .field("isReady", Bool?.self),
            .field("listApprovalStatus", String?.self),
            .field("isPublished", Bool?.self),
            .field("user", User?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var isReady: Bool? { __data["isReady"] }
          public var listApprovalStatus: String? { __data["listApprovalStatus"] }
          public var isPublished: Bool? { __data["isPublished"] }
          public var user: User? { __data["user"] }

          /// ManageListingSteps.Results.Listing.User
          ///
          /// Parent Type: `User`
          public struct User: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(data: DataDict) { __data = data }

            public static var __parentType: ParentType { PTProAPI.Objects.User }
            public static var __selections: [Selection] { [
              .field("userBanStatus", Int?.self),
            ] }

            public var userBanStatus: Int? { __data["userBanStatus"] }
          }
        }
      }
    }
  }
}
