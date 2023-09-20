// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

public class AddPayoutMutation: GraphQLMutation {
  public static let operationName: String = "addPayout"
  public static let operationDocument: Apollo.OperationDocument = .init(
    definition: .init(
      #"mutation addPayout($methodId: Int!, $payEmail: String!, $address1: String!, $address2: String!, $city: String!, $state: String!, $country: String!, $zipcode: String!, $currency: String!, $firstname: String, $lastname: String, $accountNumber: String, $routingNumber: String, $businessType: String, $accountToken: String, $personToken: String) { addPayout( methodId: $methodId payEmail: $payEmail address1: $address1 address2: $address2 city: $city state: $state country: $country zipcode: $zipcode currency: $currency firstname: $firstname lastname: $lastname accountNumber: $accountNumber routingNumber: $routingNumber businessType: $businessType accountToken: $accountToken personToken: $personToken ) { __typename status errorMessage connectUrl successUrl failureUrl stripeAccountId } }"#
    ))

  public var methodId: Int
  public var payEmail: String
  public var address1: String
  public var address2: String
  public var city: String
  public var state: String
  public var country: String
  public var zipcode: String
  public var currency: String
  public var firstname: GraphQLNullable<String>
  public var lastname: GraphQLNullable<String>
  public var accountNumber: GraphQLNullable<String>
  public var routingNumber: GraphQLNullable<String>
  public var businessType: GraphQLNullable<String>
  public var accountToken: GraphQLNullable<String>
  public var personToken: GraphQLNullable<String>

  public init(
    methodId: Int,
    payEmail: String,
    address1: String,
    address2: String,
    city: String,
    state: String,
    country: String,
    zipcode: String,
    currency: String,
    firstname: GraphQLNullable<String>,
    lastname: GraphQLNullable<String>,
    accountNumber: GraphQLNullable<String>,
    routingNumber: GraphQLNullable<String>,
    businessType: GraphQLNullable<String>,
    accountToken: GraphQLNullable<String>,
    personToken: GraphQLNullable<String>
  ) {
    self.methodId = methodId
    self.payEmail = payEmail
    self.address1 = address1
    self.address2 = address2
    self.city = city
    self.state = state
    self.country = country
    self.zipcode = zipcode
    self.currency = currency
    self.firstname = firstname
    self.lastname = lastname
    self.accountNumber = accountNumber
    self.routingNumber = routingNumber
    self.businessType = businessType
    self.accountToken = accountToken
    self.personToken = personToken
  }

  public var __variables: Variables? { [
    "methodId": methodId,
    "payEmail": payEmail,
    "address1": address1,
    "address2": address2,
    "city": city,
    "state": state,
    "country": country,
    "zipcode": zipcode,
    "currency": currency,
    "firstname": firstname,
    "lastname": lastname,
    "accountNumber": accountNumber,
    "routingNumber": routingNumber,
    "businessType": businessType,
    "accountToken": accountToken,
    "personToken": personToken
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(_dataDict: DataDict) { __data = _dataDict }

    public static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Apollo.Selection] { [
      .field("addPayout", AddPayout?.self, arguments: [
        "methodId": .variable("methodId"),
        "payEmail": .variable("payEmail"),
        "address1": .variable("address1"),
        "address2": .variable("address2"),
        "city": .variable("city"),
        "state": .variable("state"),
        "country": .variable("country"),
        "zipcode": .variable("zipcode"),
        "currency": .variable("currency"),
        "firstname": .variable("firstname"),
        "lastname": .variable("lastname"),
        "accountNumber": .variable("accountNumber"),
        "routingNumber": .variable("routingNumber"),
        "businessType": .variable("businessType"),
        "accountToken": .variable("accountToken"),
        "personToken": .variable("personToken")
      ]),
    ] }

    public var addPayout: AddPayout? { __data["addPayout"] }

    /// AddPayout
    ///
    /// Parent Type: `GetPayoutType`
    public struct AddPayout: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(_dataDict: DataDict) { __data = _dataDict }

      public static var __parentType: Apollo.ParentType { PTProAPI.Objects.GetPayoutType }
      public static var __selections: [Apollo.Selection] { [
        .field("__typename", String.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
        .field("connectUrl", String?.self),
        .field("successUrl", String?.self),
        .field("failureUrl", String?.self),
        .field("stripeAccountId", String?.self),
      ] }

      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var connectUrl: String? { __data["connectUrl"] }
      public var successUrl: String? { __data["successUrl"] }
      public var failureUrl: String? { __data["failureUrl"] }
      public var stripeAccountId: String? { __data["stripeAccountId"] }
    }
  }
}
