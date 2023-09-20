// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class ContactSupportQuery: GraphQLQuery {
    static let operationName: String = "contactSupport"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"query contactSupport($message: String, $listId: Int, $reservationId: Int, $userType: String) { contactSupport( message: $message listId: $listId reservationId: $reservationId userType: $userType ) { __typename result { __typename userId email firstName } status errorMessage } }"#
      ))

    public var message: GraphQLNullable<String>
    public var listId: GraphQLNullable<Int>
    public var reservationId: GraphQLNullable<Int>
    public var userType: GraphQLNullable<String>

    public init(
      message: GraphQLNullable<String>,
      listId: GraphQLNullable<Int>,
      reservationId: GraphQLNullable<Int>,
      userType: GraphQLNullable<String>
    ) {
      self.message = message
      self.listId = listId
      self.reservationId = reservationId
      self.userType = userType
    }

    public var __variables: Variables? { [
      "message": message,
      "listId": listId,
      "reservationId": reservationId,
      "userType": userType
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
      static var __selections: [Apollo.Selection] { [
        .field("contactSupport", ContactSupport?.self, arguments: [
          "message": .variable("message"),
          "listId": .variable("listId"),
          "reservationId": .variable("reservationId"),
          "userType": .variable("userType")
        ]),
      ] }

      var contactSupport: ContactSupport? { __data["contactSupport"] }

      /// ContactSupport
      ///
      /// Parent Type: `UserCommon`
      struct ContactSupport: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserCommon }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("result", Result?.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var result: Result? { __data["result"] }
        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }

        /// ContactSupport.Result
        ///
        /// Parent Type: `UserType`
        struct Result: PTProAPI.SelectionSet {
          let __data: DataDict
          init(_dataDict: DataDict) { __data = _dataDict }

          static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserType }
          static var __selections: [Apollo.Selection] { [
            .field("__typename", String.self),
            .field("userId", String?.self),
            .field("email", String?.self),
            .field("firstName", String?.self),
          ] }

          var userId: String? { __data["userId"] }
          var email: String? { __data["email"] }
          var firstName: String? { __data["firstName"] }
        }
      }
    }
  }

}