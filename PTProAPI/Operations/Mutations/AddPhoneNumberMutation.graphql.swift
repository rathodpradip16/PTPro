// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class AddPhoneNumberMutation: GraphQLMutation {
    static let operationName: String = "AddPhoneNumber"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation AddPhoneNumber($countryCode: String!, $phoneNumber: String!) { AddPhoneNumber(countryCode: $countryCode, phoneNumber: $phoneNumber) { __typename status errorMessage phoneNumberStatus } }"#
      ))

    public var countryCode: String
    public var phoneNumber: String

    public init(
      countryCode: String,
      phoneNumber: String
    ) {
      self.countryCode = countryCode
      self.phoneNumber = phoneNumber
    }

    public var __variables: Variables? { [
      "countryCode": countryCode,
      "phoneNumber": phoneNumber
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("AddPhoneNumber", AddPhoneNumber?.self, arguments: [
          "countryCode": .variable("countryCode"),
          "phoneNumber": .variable("phoneNumber")
        ]),
      ] }

      var addPhoneNumber: AddPhoneNumber? { __data["AddPhoneNumber"] }

      /// AddPhoneNumber
      ///
      /// Parent Type: `UserAccount`
      struct AddPhoneNumber: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserAccount }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
          .field("phoneNumberStatus", String?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
        var phoneNumberStatus: String? { __data["phoneNumberStatus"] }
      }
    }
  }

}