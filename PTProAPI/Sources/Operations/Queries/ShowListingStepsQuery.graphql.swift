// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class ShowListingStepsQuery: GraphQLQuery {
  public static let operationName: String = "ShowListingSteps"
  public static let operationDocument: ApolloAPI.OperationDocument = .init(
    definition: .init(
      #"query ShowListingSteps($listId: String!) { showListingSteps(listId: $listId) { __typename results { __typename id listId step1 step2 step3 listing { __typename id isReady listApprovalStatus isPublished user { __typename userBanStatus } } isPhotosAdded } status errorMessage } }"#
    ))

  public var listId: String

  public init(listId: String) {
    self.listId = listId
  }

  public var __variables: Variables? { ["listId": listId] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [ApolloAPI.Selection] { [
      .field("showListingSteps", ShowListingSteps?.self, arguments: ["listId": .variable("listId")]),
    ] }

    public var showListingSteps: ShowListingSteps? { __data["showListingSteps"] }

    /// ShowListingSteps
    ///
    /// Parent Type: `ShowListingCommon`
    public struct ShowListingSteps: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ShowListingCommon }
      public static var __selections: [ApolloAPI.Selection] { [
        .field("__typename", String.self),
        .field("results", Results?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var results: Results? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// ShowListingSteps.Results
      ///
      /// Parent Type: `ShowListingSteps`
      public struct Results: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ShowListingSteps }
        public static var __selections: [ApolloAPI.Selection] { [
          .field("__typename", String.self),
          .field("id", Int?.self),
          .field("listId", Int?.self),
          .field("step1", String?.self),
          .field("step2", String?.self),
          .field("step3", String?.self),
          .field("listing", Listing?.self),
          .field("isPhotosAdded", Bool?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var listId: Int? { __data["listId"] }
        public var step1: String? { __data["step1"] }
        public var step2: String? { __data["step2"] }
        public var step3: String? { __data["step3"] }
        public var listing: Listing? { __data["listing"] }
        public var isPhotosAdded: Bool? { __data["isPhotosAdded"] }

        /// ShowListingSteps.Results.Listing
        ///
        /// Parent Type: `ShowListing`
        public struct Listing: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(_dataDict: DataDict) { __data = _dataDict }

          public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.ShowListing }
          public static var __selections: [ApolloAPI.Selection] { [
            .field("__typename", String.self),
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

          /// ShowListingSteps.Results.Listing.User
          ///
          /// Parent Type: `User`
          public struct User: PTProAPI.SelectionSet {
            public let __data: DataDict
            public init(_dataDict: DataDict) { __data = _dataDict }

            public static var __parentType: ApolloAPI.ParentType { PTProAPI.Objects.User }
            public static var __selections: [ApolloAPI.Selection] { [
              .field("__typename", String.self),
              .field("userBanStatus", Int?.self),
            ] }

            public var userBanStatus: Int? { __data["userBanStatus"] }
          }
        }
      }
    }
  }
}
