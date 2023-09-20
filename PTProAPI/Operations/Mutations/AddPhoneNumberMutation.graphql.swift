// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class AddPhoneNumberMutation: GraphQLMutation {
  public static let operationName: String = "AddPhoneNumber"
  public static let operationDocument: Apollo.OperationDocument = .init(
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

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Apollo.Selection] { [
      .field("AddPhoneNumber", AddPhoneNumber?.self, arguments: [
        "countryCode": .variable("countryCode"),
        "phoneNumber": .variable("phoneNumber")
      ]),
    ] }

    public var addPhoneNumber: AddPhoneNumber? { __data["AddPhoneNumber"] }

    /// AddPhoneNumber
    ///
    /// Parent Type: `UserAccount`
    public struct AddPhoneNumber: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.UserAccount }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
        .field("phoneNumberStatus", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var phoneNumberStatus: String? { __data["phoneNumberStatus"] }
    }
  }
}
