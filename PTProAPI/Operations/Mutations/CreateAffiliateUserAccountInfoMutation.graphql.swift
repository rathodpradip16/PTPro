// @generated
// This file was automatically generated and should not be edited.

@_exported import Apollo

extension PTProAPI {
  class CreateAffiliateUserAccountInfoMutation: GraphQLMutation {
    static let operationName: String = "createAffiliateUserAccountInfo"
    static let operationDocument: Apollo.OperationDocument = .init(
      definition: .init(
        #"mutation createAffiliateUserAccountInfo($userId: String, $payeeName: String, $address: String, $city: String, $state: String, $zipcode: Int, $country: String, $phoneNumber: String) { createAffiliateUserAccountInfo( userId: $userId payeeName: $payeeName address: $address city: $city state: $state zipcode: $zipcode country: $country phoneNumber: $phoneNumber ) { __typename status errorMessage } }"#
      ))

    public var userId: GraphQLNullable<String>
    public var payeeName: GraphQLNullable<String>
    public var address: GraphQLNullable<String>
    public var city: GraphQLNullable<String>
    public var state: GraphQLNullable<String>
    public var zipcode: GraphQLNullable<Int>
    public var country: GraphQLNullable<String>
    public var phoneNumber: GraphQLNullable<String>

    public init(
      userId: GraphQLNullable<String>,
      payeeName: GraphQLNullable<String>,
      address: GraphQLNullable<String>,
      city: GraphQLNullable<String>,
      state: GraphQLNullable<String>,
      zipcode: GraphQLNullable<Int>,
      country: GraphQLNullable<String>,
      phoneNumber: GraphQLNullable<String>
    ) {
      self.userId = userId
      self.payeeName = payeeName
      self.address = address
      self.city = city
      self.state = state
      self.zipcode = zipcode
      self.country = country
      self.phoneNumber = phoneNumber
    }

    public var __variables: Variables? { [
      "userId": userId,
      "payeeName": payeeName,
      "address": address,
      "city": city,
      "state": state,
      "zipcode": zipcode,
      "country": country,
      "phoneNumber": phoneNumber
    ] }

    struct Data: PTProAPI.SelectionSet {
      let __data: DataDict
      init(_dataDict: DataDict) { __data = _dataDict }

      static var __parentType: Apollo.ParentType { PTProAPI.Objects.Mutation }
      static var __selections: [Apollo.Selection] { [
        .field("createAffiliateUserAccountInfo", CreateAffiliateUserAccountInfo?.self, arguments: [
          "userId": .variable("userId"),
          "payeeName": .variable("payeeName"),
          "address": .variable("address"),
          "city": .variable("city"),
          "state": .variable("state"),
          "zipcode": .variable("zipcode"),
          "country": .variable("country"),
          "phoneNumber": .variable("phoneNumber")
        ]),
      ] }

      var createAffiliateUserAccountInfo: CreateAffiliateUserAccountInfo? { __data["createAffiliateUserAccountInfo"] }

      /// CreateAffiliateUserAccountInfo
      ///
      /// Parent Type: `AffiliateUserverificationType`
      struct CreateAffiliateUserAccountInfo: PTProAPI.SelectionSet {
        let __data: DataDict
        init(_dataDict: DataDict) { __data = _dataDict }

        static var __parentType: Apollo.ParentType { PTProAPI.Objects.AffiliateUserverificationType }
        static var __selections: [Apollo.Selection] { [
          .field("__typename", String.self),
          .field("status", Int?.self),
          .field("errorMessage", String?.self),
        ] }

        var status: Int? { __data["status"] }
        var errorMessage: String? { __data["errorMessage"] }
      }
    }
  }

}