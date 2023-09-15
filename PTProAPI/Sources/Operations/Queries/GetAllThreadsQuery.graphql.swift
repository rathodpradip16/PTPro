// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetAllThreadsQuery: GraphQLQuery {
  public static let operationName: String = "getAllThreads"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query getAllThreads($threadType: String, $threadId: Int, $currentPage: Int) {
        getAllThreads(
          threadType: $threadType
          threadId: $threadId
          currentPage: $currentPage
        ) {
          __typename
          results {
            __typename
            id
            listId
            guest
            host
            listData {
              __typename
              city
              state
              country
            }
            threadItem {
              __typename
              id
              threadId
              content
              sentBy
              isRead
              type
              startDate
              endDate
              createdAt
            }
            guestProfile {
              __typename
              profileId
              displayName
              firstName
              picture
            }
            hostProfile {
              __typename
              profileId
              displayName
              firstName
              picture
            }
          }
          count
          status
          errorMessage
        }
      }
      """
    ))

  public var threadType: GraphQLNullable<String>
  public var threadId: GraphQLNullable<Int>
  public var currentPage: GraphQLNullable<Int>

  public init(
    threadType: GraphQLNullable<String>,
    threadId: GraphQLNullable<Int>,
    currentPage: GraphQLNullable<Int>
  ) {
    self.threadType = threadType
    self.threadId = threadId
    self.currentPage = currentPage
  }

  public var __variables: Variables? { [
    "threadType": threadType,
    "threadId": threadId,
    "currentPage": currentPage
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Selection] { [
      .field("getAllThreads", GetAllThreads?.self, arguments: [
        "threadType": .variable("threadType"),
        "threadId": .variable("threadId"),
        "currentPage": .variable("currentPage")
      ]),
    ] }

    public var getAllThreads: GetAllThreads? { __data["getAllThreads"] }

    /// GetAllThreads
    ///
    /// Parent Type: `AllThreads`
    public struct GetAllThreads: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.AllThreads }
      public static var __selections: [Selection] { [
        .field("results", [Result?]?.self),
        .field("count", Int?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var results: [Result?]? { __data["results"] }
      public var count: Int? { __data["count"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// GetAllThreads.Result
      ///
      /// Parent Type: `Threads`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PTProAPI.Objects.Threads }
        public static var __selections: [Selection] { [
          .field("id", Int?.self),
          .field("listId", Int?.self),
          .field("guest", String?.self),
          .field("host", String?.self),
          .field("listData", ListData?.self),
          .field("threadItem", ThreadItem?.self),
          .field("guestProfile", GuestProfile?.self),
          .field("hostProfile", HostProfile?.self),
        ] }

        public var id: Int? { __data["id"] }
        public var listId: Int? { __data["listId"] }
        public var guest: String? { __data["guest"] }
        public var host: String? { __data["host"] }
        public var listData: ListData? { __data["listData"] }
        public var threadItem: ThreadItem? { __data["threadItem"] }
        public var guestProfile: GuestProfile? { __data["guestProfile"] }
        public var hostProfile: HostProfile? { __data["hostProfile"] }

        /// GetAllThreads.Result.ListData
        ///
        /// Parent Type: `ShowListing`
        public struct ListData: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PTProAPI.Objects.ShowListing }
          public static var __selections: [Selection] { [
            .field("city", String?.self),
            .field("state", String?.self),
            .field("country", String?.self),
          ] }

          public var city: String? { __data["city"] }
          public var state: String? { __data["state"] }
          public var country: String? { __data["country"] }
        }

        /// GetAllThreads.Result.ThreadItem
        ///
        /// Parent Type: `ThreadItems`
        public struct ThreadItem: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PTProAPI.Objects.ThreadItems }
          public static var __selections: [Selection] { [
            .field("id", Int?.self),
            .field("threadId", Int?.self),
            .field("content", String?.self),
            .field("sentBy", String?.self),
            .field("isRead", Bool?.self),
            .field("type", String?.self),
            .field("startDate", String?.self),
            .field("endDate", String?.self),
            .field("createdAt", String?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var threadId: Int? { __data["threadId"] }
          public var content: String? { __data["content"] }
          public var sentBy: String? { __data["sentBy"] }
          public var isRead: Bool? { __data["isRead"] }
          public var type: String? { __data["type"] }
          public var startDate: String? { __data["startDate"] }
          public var endDate: String? { __data["endDate"] }
          public var createdAt: String? { __data["createdAt"] }
        }

        /// GetAllThreads.Result.GuestProfile
        ///
        /// Parent Type: `UserProfile`
        public struct GuestProfile: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PTProAPI.Objects.UserProfile }
          public static var __selections: [Selection] { [
            .field("profileId", Int?.self),
            .field("displayName", String?.self),
            .field("firstName", String?.self),
            .field("picture", String?.self),
          ] }

          public var profileId: Int? { __data["profileId"] }
          public var displayName: String? { __data["displayName"] }
          public var firstName: String? { __data["firstName"] }
          public var picture: String? { __data["picture"] }
        }

        /// GetAllThreads.Result.HostProfile
        ///
        /// Parent Type: `UserProfile`
        public struct HostProfile: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PTProAPI.Objects.UserProfile }
          public static var __selections: [Selection] { [
            .field("profileId", Int?.self),
            .field("displayName", String?.self),
            .field("firstName", String?.self),
            .field("picture", String?.self),
          ] }

          public var profileId: Int? { __data["profileId"] }
          public var displayName: String? { __data["displayName"] }
          public var firstName: String? { __data["firstName"] }
          public var picture: String? { __data["picture"] }
        }
      }
    }
  }
}
