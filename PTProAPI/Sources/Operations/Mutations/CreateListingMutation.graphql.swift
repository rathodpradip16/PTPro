// @generated
// This file was automatically generated and should not be edited.

@_exported import ApolloAPI

public class CreateListingMutation: GraphQLMutation {
  public static let operationName: String = "createListing"
  public static let document: ApolloAPI.DocumentType = .notPersisted(
    definition: .init(
      """
      mutation createListing($listId: Int, $roomType: String, $houseType: String, $residenceType: String, $bedrooms: String, $buildingSize: String, $bedType: String, $beds: Int, $personCapacity: Int, $bathrooms: Float, $bathroomType: String, $country: String, $street: String, $buildingName: String, $city: String, $state: String, $zipcode: String, $lat: Float, $lng: Float, $bedTypes: String, $isMapTouched: Boolean, $amenities: [Int], $safetyAmenities: [Int], $spaces: [Int]) {
        createListing(
          listId: $listId
          roomType: $roomType
          houseType: $houseType
          residenceType: $residenceType
          bedrooms: $bedrooms
          buildingSize: $buildingSize
          bedType: $bedType
          beds: $beds
          personCapacity: $personCapacity
          bathrooms: $bathrooms
          bathroomType: $bathroomType
          country: $country
          street: $street
          buildingName: $buildingName
          city: $city
          state: $state
          zipcode: $zipcode
          lat: $lat
          lng: $lng
          bedTypes: $bedTypes
          isMapTouched: $isMapTouched
          amenities: $amenities
          safetyAmenities: $safetyAmenities
          spaces: $spaces
        ) {
          __typename
          id
          results {
            __typename
            roomType
            houseType
            residenceType
            bedrooms
            buildingSize
            bedType
            beds
            personCapacity
            bathrooms
            bathroomType
            country
            street
            buildingName
            city
            state
            zipcode
            lat
            lng
            bedTypes
            isMapTouched
            amenities
            safetyAmenities
            spaces
          }
          status
          errorMessage
          actionType
        }
      }
      """
    ))

  public var listId: GraphQLNullable<Int>
  public var roomType: GraphQLNullable<String>
  public var houseType: GraphQLNullable<String>
  public var residenceType: GraphQLNullable<String>
  public var bedrooms: GraphQLNullable<String>
  public var buildingSize: GraphQLNullable<String>
  public var bedType: GraphQLNullable<String>
  public var beds: GraphQLNullable<Int>
  public var personCapacity: GraphQLNullable<Int>
  public var bathrooms: GraphQLNullable<Double>
  public var bathroomType: GraphQLNullable<String>
  public var country: GraphQLNullable<String>
  public var street: GraphQLNullable<String>
  public var buildingName: GraphQLNullable<String>
  public var city: GraphQLNullable<String>
  public var state: GraphQLNullable<String>
  public var zipcode: GraphQLNullable<String>
  public var lat: GraphQLNullable<Double>
  public var lng: GraphQLNullable<Double>
  public var bedTypes: GraphQLNullable<String>
  public var isMapTouched: GraphQLNullable<Bool>
  public var amenities: GraphQLNullable<[Int?]>
  public var safetyAmenities: GraphQLNullable<[Int?]>
  public var spaces: GraphQLNullable<[Int?]>

  public init(
    listId: GraphQLNullable<Int>,
    roomType: GraphQLNullable<String>,
    houseType: GraphQLNullable<String>,
    residenceType: GraphQLNullable<String>,
    bedrooms: GraphQLNullable<String>,
    buildingSize: GraphQLNullable<String>,
    bedType: GraphQLNullable<String>,
    beds: GraphQLNullable<Int>,
    personCapacity: GraphQLNullable<Int>,
    bathrooms: GraphQLNullable<Double>,
    bathroomType: GraphQLNullable<String>,
    country: GraphQLNullable<String>,
    street: GraphQLNullable<String>,
    buildingName: GraphQLNullable<String>,
    city: GraphQLNullable<String>,
    state: GraphQLNullable<String>,
    zipcode: GraphQLNullable<String>,
    lat: GraphQLNullable<Double>,
    lng: GraphQLNullable<Double>,
    bedTypes: GraphQLNullable<String>,
    isMapTouched: GraphQLNullable<Bool>,
    amenities: GraphQLNullable<[Int?]>,
    safetyAmenities: GraphQLNullable<[Int?]>,
    spaces: GraphQLNullable<[Int?]>
  ) {
    self.listId = listId
    self.roomType = roomType
    self.houseType = houseType
    self.residenceType = residenceType
    self.bedrooms = bedrooms
    self.buildingSize = buildingSize
    self.bedType = bedType
    self.beds = beds
    self.personCapacity = personCapacity
    self.bathrooms = bathrooms
    self.bathroomType = bathroomType
    self.country = country
    self.street = street
    self.buildingName = buildingName
    self.city = city
    self.state = state
    self.zipcode = zipcode
    self.lat = lat
    self.lng = lng
    self.bedTypes = bedTypes
    self.isMapTouched = isMapTouched
    self.amenities = amenities
    self.safetyAmenities = safetyAmenities
    self.spaces = spaces
  }

  public var __variables: Variables? { [
    "listId": listId,
    "roomType": roomType,
    "houseType": houseType,
    "residenceType": residenceType,
    "bedrooms": bedrooms,
    "buildingSize": buildingSize,
    "bedType": bedType,
    "beds": beds,
    "personCapacity": personCapacity,
    "bathrooms": bathrooms,
    "bathroomType": bathroomType,
    "country": country,
    "street": street,
    "buildingName": buildingName,
    "city": city,
    "state": state,
    "zipcode": zipcode,
    "lat": lat,
    "lng": lng,
    "bedTypes": bedTypes,
    "isMapTouched": isMapTouched,
    "amenities": amenities,
    "safetyAmenities": safetyAmenities,
    "spaces": spaces
  ] }

  public struct Data: PTProAPI.SelectionSet {
    public let __data: DataDict
    public init(data: DataDict) { __data = data }

    public static var __parentType: ParentType { PTProAPI.Objects.Mutation }
    public static var __selections: [Selection] { [
      .field("createListing", CreateListing?.self, arguments: [
        "listId": .variable("listId"),
        "roomType": .variable("roomType"),
        "houseType": .variable("houseType"),
        "residenceType": .variable("residenceType"),
        "bedrooms": .variable("bedrooms"),
        "buildingSize": .variable("buildingSize"),
        "bedType": .variable("bedType"),
        "beds": .variable("beds"),
        "personCapacity": .variable("personCapacity"),
        "bathrooms": .variable("bathrooms"),
        "bathroomType": .variable("bathroomType"),
        "country": .variable("country"),
        "street": .variable("street"),
        "buildingName": .variable("buildingName"),
        "city": .variable("city"),
        "state": .variable("state"),
        "zipcode": .variable("zipcode"),
        "lat": .variable("lat"),
        "lng": .variable("lng"),
        "bedTypes": .variable("bedTypes"),
        "isMapTouched": .variable("isMapTouched"),
        "amenities": .variable("amenities"),
        "safetyAmenities": .variable("safetyAmenities"),
        "spaces": .variable("spaces")
      ]),
    ] }

    public var createListing: CreateListing? { __data["createListing"] }

    /// CreateListing
    ///
    /// Parent Type: `ListingResponse`
    public struct CreateListing: PTProAPI.SelectionSet {
      public let __data: DataDict
      public init(data: DataDict) { __data = data }

      public static var __parentType: ParentType { PTProAPI.Objects.ListingResponse }
      public static var __selections: [Selection] { [
        .field("id", Int?.self),
        .field("results", Results?.self),
        .field("status", Int?.self),
        .field("errorMessage", String?.self),
        .field("actionType", String?.self),
      ] }

      public var id: Int? { __data["id"] }
      public var results: Results? { __data["results"] }
      public var status: Int? { __data["status"] }
      public var errorMessage: String? { __data["errorMessage"] }
      public var actionType: String? { __data["actionType"] }

      /// CreateListing.Results
      ///
      /// Parent Type: `CreateListing`
      public struct Results: PTProAPI.SelectionSet {
        public let __data: DataDict
        public init(data: DataDict) { __data = data }

        public static var __parentType: ParentType { PTProAPI.Objects.CreateListing }
        public static var __selections: [Selection] { [
          .field("roomType", String?.self),
          .field("houseType", String?.self),
          .field("residenceType", String?.self),
          .field("bedrooms", String?.self),
          .field("buildingSize", String?.self),
          .field("bedType", String?.self),
          .field("beds", Int?.self),
          .field("personCapacity", Int?.self),
          .field("bathrooms", Double?.self),
          .field("bathroomType", String?.self),
          .field("country", String?.self),
          .field("street", String?.self),
          .field("buildingName", String?.self),
          .field("city", String?.self),
          .field("state", String?.self),
          .field("zipcode", String?.self),
          .field("lat", Double?.self),
          .field("lng", Double?.self),
          .field("bedTypes", String?.self),
          .field("isMapTouched", Bool?.self),
          .field("amenities", [Int?]?.self),
          .field("safetyAmenities", [Int?]?.self),
          .field("spaces", [Int?]?.self),
        ] }

        public var roomType: String? { __data["roomType"] }
        public var houseType: String? { __data["houseType"] }
        public var residenceType: String? { __data["residenceType"] }
        public var bedrooms: String? { __data["bedrooms"] }
        public var buildingSize: String? { __data["buildingSize"] }
        public var bedType: String? { __data["bedType"] }
        public var beds: Int? { __data["beds"] }
        public var personCapacity: Int? { __data["personCapacity"] }
        public var bathrooms: Double? { __data["bathrooms"] }
        public var bathroomType: String? { __data["bathroomType"] }
        public var country: String? { __data["country"] }
        public var street: String? { __data["street"] }
        public var buildingName: String? { __data["buildingName"] }
        public var city: String? { __data["city"] }
        public var state: String? { __data["state"] }
        public var zipcode: String? { __data["zipcode"] }
        public var lat: Double? { __data["lat"] }
        public var lng: Double? { __data["lng"] }
        public var bedTypes: String? { __data["bedTypes"] }
        public var isMapTouched: Bool? { __data["isMapTouched"] }
        public var amenities: [Int?]? { __data["amenities"] }
        public var safetyAmenities: [Int?]? { __data["safetyAmenities"] }
        public var spaces: [Int?]? { __data["spaces"] }
      }
    }
  }
}
