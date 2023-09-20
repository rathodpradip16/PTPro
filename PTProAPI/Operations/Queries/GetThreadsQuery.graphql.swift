// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class GetThreadsQuery: GraphQLQuery {
    static let operationName: String = "getThreads"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query getThreads($threadType: String, $threadId: Int, $currentPage: Int, $sortOrder: Boolean) { getThreads( threadType: $threadType threadId: $threadId currentPage: $currentPage sortOrder: $sortOrder ) { __typename status errorMessage results { __typename getThreadCount threadItems { __typename id threadId reservationId content sentBy type startDate endDate createdAt personCapacity } guestProfile { __typename userId profileId displayName firstName picture location } hostProfile { __typename userId profileId displayName firstName picture location } threadItemForType { __typename id threadId reservationId content sentBy type startDate endDate createdAt personCapacity } } } }"#
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

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("getThreads", GetThreads?.self, arguments: [
          "threadType": .variable("threadType"),
          "threadId": .variable("threadId"),
          "currentPage": .variable("currentPage"),
          "sortOrder": .variable("sortOrder")
        ]),
      ] }

      var getThreads: GetThreads? { __data["getThreads"] }

      /// GetThreads
      ///
      /// Parent Type: `NewThreadsCommonType`
      struct GetThreads: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.NewThreadsCommonType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("results", Results?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var results: Results? { __data["results"] }

        /// GetThreads.Results
        ///
        /// Parent Type: `NewThreadsType`
        struct Results: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.NewThreadsType }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("getThreadCount", Int?.self),
            .field("threadItems", [ThreadItem?]?.self),
            .field("guestProfile", GuestProfile?.self),
            .field("hostProfile", HostProfile?.self),
            .field("threadItemForType", ThreadItemForType?.self),
          ] }

          var getThreadCount: Int? { __data["getThreadCount"] }
          var threadItems: [ThreadItem?]? { __data["threadItems"] }
          var guestProfile: GuestProfile? { __data["guestProfile"] }
          var hostProfile: HostProfile? { __data["hostProfile"] }
          var threadItemForType: ThreadItemForType? { __data["threadItemForType"] }

          /// GetThreads.Results.ThreadItem
          ///
          /// Parent Type: `ThreadItems`
          struct ThreadItem: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ThreadItems }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
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

            var id: Int? { __data["id"] }
            var threadId: Int? { __data["threadId"] }
            var reservationId: Int? { __data["reservationId"] }
            var content: String? { __data["content"] }
            var sentBy: String? { __data["sentBy"] }
            var type: String? { __data["type"] }
            var startDate: String? { __data["startDate"] }
            var endDate: String? { __data["endDate"] }
            var createdAt: String? { __data["createdAt"] }
            var personCapacity: Int? { __data["personCapacity"] }
          }

          /// GetThreads.Results.GuestProfile
          ///
          /// Parent Type: `UserProfile`
          struct GuestProfile: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserProfile }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("userId", String?.self),
              .field("profileId", Int?.self),
              .field("displayName", String?.self),
              .field("firstName", String?.self),
              .field("picture", String?.self),
              .field("location", String?.self),
            ] }

            var userId: String? { __data["userId"] }
            var profileId: Int? { __data["profileId"] }
            var displayName: String? { __data["displayName"] }
            var firstName: String? { __data["firstName"] }
            var picture: String? { __data["picture"] }
            var location: String? { __data["location"] }
          }

          /// GetThreads.Results.HostProfile
          ///
          /// Parent Type: `UserProfile`
          struct HostProfile: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserProfile }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
              .field("userId", String?.self),
              .field("profileId", Int?.self),
              .field("displayName", String?.self),
              .field("firstName", String?.self),
              .field("picture", String?.self),
              .field("location", String?.self),
            ] }

            var userId: String? { __data["userId"] }
            var profileId: Int? { __data["profileId"] }
            var displayName: String? { __data["displayName"] }
            var firstName: String? { __data["firstName"] }
            var picture: String? { __data["picture"] }
            var location: String? { __data["location"] }
          }

          /// GetThreads.Results.ThreadItemForType
          ///
          /// Parent Type: `ThreadItems`
          struct ThreadItemForType: PTProAPI.SelectionSet {
            let __data: DataDict
            init(_dataDict: DataDict) { __data = _dataDict }

            static var __parentType: Apollo.ParentType { PTProAPI.Objects.ThreadItems }
            static var __selections: [Apollo.Selection] { [
              .field("__typename", String.self),
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

            var id: Int? { __data["id"] }
            var threadId: Int? { __data["threadId"] }
            var reservationId: Int? { __data["reservationId"] }
            var content: String? { __data["content"] }
            var sentBy: String? { __data["sentBy"] }
            var type: String? { __data["type"] }
            var startDate: String? { __data["startDate"] }
            var endDate: String? { __data["endDate"] }
            var createdAt: String? { __data["createdAt"] }
            var personCapacity: Int? { __data["personCapacity"] }
          }
        }
      }
    }
  }

}