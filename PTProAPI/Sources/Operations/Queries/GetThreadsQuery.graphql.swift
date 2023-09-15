// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class GetThreadsQuery: GraphQLQuery {
  public static let operationName: String = "getThreads"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      query getThreads($threadType: String, $threadId: Int, $currentPage: Int, $sortOrder: Boolean) {
        getThreads(
          threadType: $threadType
          threadId: $threadId
          currentPage: $currentPage
          sortOrder: $sortOrder
        ) {
          __typename
          status
          errorMessage
          results {
            __typename
            getThreadCount
            threadItems {
              __typename
              id
              threadId
              reservationId
              content
              sentBy
              type
              startDate
              endDate
              createdAt
              personCapacity
            }
            guestProfile {
              __typename
              userId
              profileId
              displayName
              firstName
              picture
              location
            }
            hostProfile {
              __typename
              userId
              profileId
              displayName
              firstName
              picture
              location
            }
            threadItemForType {
              __typename
              id
              threadId
              reservationId
              content
              sentBy
              type
              startDate
              endDate
              createdAt
              personCapacity
            }
          }
        }
      }
      """
    ))

  public var threadType: GraphQLNullable<String>
  public var threadId: GraphQLNullable<Int>
  public var currentPage: GraphQLNullable<Int>
  public var sortOrder: GraphQLNullable<Bool>

  public init(
    threadType: GraphQLNullable<String>,
    threadId: GraphQLNullable<Int>,
    currentPage: GraphQLNullable<Int>,
    sortOrder: GraphQLNullable<Bool>
  ) {
    self.threadType = threadType
    self.threadId = threadId
    self.currentPage = currentPage
    self.sortOrder = sortOrder
  }

  public var __variables: Variables? { [
    "threadType": threadType,
    "threadId": threadId,
    "currentPage": currentPage,
    "sortOrder": sortOrder
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Selection] { [
      .field("getThreads", GetThreads?.self, arguments: [
        "threadType": .variable("threadType"),
        "threadId": .variable("threadId"),
        "currentPage": .variable("currentPage"),
        "sortOrder": .variable("sortOrder")
      ]),
    ] }

    public var getThreads: GetThreads? { __data["getThreads"] }

    /// GetThreads
    ///
    /// Parent Type: `NewThreadsCommonType`
    public struct GetThreads: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.NewThreadsCommonType }
      public static var __selections: [Selection] { [
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
        .field("results", Results?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var results: Results? { __data["results"] }

      /// GetThreads.Results
      ///
      /// Parent Type: `NewThreadsType`
      public struct Results: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PTProAPI.Objects.NewThreadsType }
        public static var __selections: [Selection] { [
          .field("getThreadCount", Int?.self),
          .field("threadItems", [ThreadItem?]?.self),
          .field("guestProfile", GuestProfile?.self),
          .field("hostProfile", HostProfile?.self),
          .field("threadItemForType", ThreadItemForType?.self),
        ] }

        public var getThreadCount: Int? { __data["getThreadCount"] }
        public var threadItems: [ThreadItem?]? { __data["threadItems"] }
        public var guestProfile: GuestProfile? { __data["guestProfile"] }
        public var hostProfile: HostProfile? { __data["hostProfile"] }
        public var threadItemForType: ThreadItemForType? { __data["threadItemForType"] }

        /// GetThreads.Results.ThreadItem
        ///
        /// Parent Type: `ThreadItems`
        public struct ThreadItem: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PTProAPI.Objects.ThreadItems }
          public static var __selections: [Selection] { [
            .field("id", Int?.self),
            .field("threadId", Int?.self),
            .field("reservationId", Int?.self),
            .field("content", String?.self),
            .field("sentBy", String?.self),
            .field("type", String?.self),
            .field("startDate", String?.self),
            .field("endDate", String?.self),
            .field("createdAt", String?.self),
            .field("personCapacity", Int?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var threadId: Int? { __data["threadId"] }
          public var reservationId: Int? { __data["reservationId"] }
          public var content: String? { __data["content"] }
          public var sentBy: String? { __data["sentBy"] }
          public var type: String? { __data["type"] }
          public var startDate: String? { __data["startDate"] }
          public var endDate: String? { __data["endDate"] }
          public var createdAt: String? { __data["createdAt"] }
          public var personCapacity: Int? { __data["personCapacity"] }
        }

        /// GetThreads.Results.GuestProfile
        ///
        /// Parent Type: `UserProfile`
        public struct GuestProfile: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PTProAPI.Objects.UserProfile }
          public static var __selections: [Selection] { [
            .field("userId", String?.self),
            .field("profileId", Int?.self),
            .field("displayName", String?.self),
            .field("firstName", String?.self),
            .field("picture", String?.self),
            .field("location", String?.self),
          ] }

          public var userId: String? { __data["userId"] }
          public var profileId: Int? { __data["profileId"] }
          public var displayName: String? { __data["displayName"] }
          public var firstName: String? { __data["firstName"] }
          public var picture: String? { __data["picture"] }
          public var location: String? { __data["location"] }
        }

        /// GetThreads.Results.HostProfile
        ///
        /// Parent Type: `UserProfile`
        public struct HostProfile: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PTProAPI.Objects.UserProfile }
          public static var __selections: [Selection] { [
            .field("userId", String?.self),
            .field("profileId", Int?.self),
            .field("displayName", String?.self),
            .field("firstName", String?.self),
            .field("picture", String?.self),
            .field("location", String?.self),
          ] }

          public var userId: String? { __data["userId"] }
          public var profileId: Int? { __data["profileId"] }
          public var displayName: String? { __data["displayName"] }
          public var firstName: String? { __data["firstName"] }
          public var picture: String? { __data["picture"] }
          public var location: String? { __data["location"] }
        }

        /// GetThreads.Results.ThreadItemForType
        ///
        /// Parent Type: `ThreadItems`
        public struct ThreadItemForType: PTProAPI.SelectionSet {
          public let __data: DataDict
          public init(data: DataDict) { __data = data }

          public static var __parentType: ParentType { PTProAPI.Objects.ThreadItems }
          public static var __selections: [Selection] { [
            .field("id", Int?.self),
            .field("threadId", Int?.self),
            .field("reservationId", Int?.self),
            .field("content", String?.self),
            .field("sentBy", String?.self),
            .field("type", String?.self),
            .field("startDate", String?.self),
            .field("endDate", String?.self),
            .field("createdAt", String?.self),
            .field("personCapacity", Int?.self),
          ] }

          public var id: Int? { __data["id"] }
          public var threadId: Int? { __data["threadId"] }
          public var reservationId: Int? { __data["reservationId"] }
          public var content: String? { __data["content"] }
          public var sentBy: String? { __data["sentBy"] }
          public var type: String? { __data["type"] }
          public var startDate: String? { __data["startDate"] }
          public var endDate: String? { __data["endDate"] }
          public var createdAt: String? { __data["createdAt"] }
          public var personCapacity: Int? { __data["personCapacity"] }
        }
      }
    }
  }
}
