// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class ContactSupportQuery: GraphQLQuery {
  public static let operationName: String = "contactSupport"
  public static let operationDocument: Apollo.OperationDocument = .init(
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

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Query }
    public static var __selections: [Apollo.Selection] { [
      .field("contactSupport", ContactSupport?.self, arguments: [
        "message": .variable("message"),
        "listId": .variable("listId"),
        "reservationId": .variable("reservationId"),
        "userType": .variable("userType")
      ]),
    ] }

    public var contactSupport: ContactSupport? { __data["contactSupport"] }

    /// ContactSupport
    ///
    /// Parent Type: `UserCommon`
    public struct ContactSupport: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserCommon }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("result", Result?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
      ] }

      public var result: Result? { __data["result"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }

      /// ContactSupport.Result
      ///
      /// Parent Type: `UserType`
      public struct Result: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(_dataDict: DataDict) { __data = _dataDict }

        public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserType }
        public static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("userId", String?.self),
          .field("email", String?.self),
          .field("firstName", String?.self),
        ] }

        public var userId: String? { __data["userId"] }
        public var email: String? { __data["email"] }
        public var firstName: String? { __data["firstName"] }
      }
    }
  }
}
