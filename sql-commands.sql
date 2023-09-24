-- Create the Location table first
CREATE TABLE
    Location (
        LocationID INT PRIMARY KEY,
        City VARCHAR(255),
        Country VARCHAR(255)
    );

-- Create the User table
CREATE TABLE
    User (
        UserID INT PRIMARY KEY,
        FirstName VARCHAR(255),
        LastName VARCHAR(255),
        Email VARCHAR(255),
        Password VARCHAR(255),
        UserType VARCHAR(255),
        PhoneNumber VARCHAR(255),
        Address VARCHAR(255),
        LocationID INT,
        FOREIGN KEY (LocationID) REFERENCES Location (LocationID)
    );

-- Create the Host table
CREATE TABLE
    Host (
        HostID INT PRIMARY KEY,
        UserID INT,
        FOREIGN KEY (UserID) REFERENCES User (UserID)
    );

-- Create the Administrator table
CREATE TABLE
    Administrator (
        AdminID INT PRIMARY KEY,
        UserID INT,
        FOREIGN KEY (UserID) REFERENCES User (UserID)
    );

-- Create the Property table
CREATE TABLE
    Property (
        PropertyID INT PRIMARY KEY,
        PropertyName VARCHAR(255),
        PropertyType VARCHAR(255),
        HostID INT,
        LocationID INT,
        FOREIGN KEY (HostID) REFERENCES Host (HostID),
        FOREIGN KEY (LocationID) REFERENCES Location (LocationID)
    );

-- Create the Room table
CREATE TABLE
    Room (
        RoomID INT PRIMARY KEY,
        RoomNumber INT,
        PropertyID INT,
        FOREIGN KEY (PropertyID) REFERENCES Property (PropertyID)
    );

-- Create the Listing table
CREATE TABLE
    Listing (
        ListingID INT PRIMARY KEY,
        Title VARCHAR(255),
        Description VARCHAR(255),
        PropertyType VARCHAR(255),
        PricePerNight DECIMAL(10, 2),
        NumBedrooms INT,
        NumBathrooms INT,
        MaxGuests INT,
        LocationID INT,
        FOREIGN KEY (LocationID) REFERENCES Location (LocationID)
    );

-- Create the Review table
CREATE TABLE
    Review (
        ReviewID INT PRIMARY KEY,
        Rating INT,
        Comment VARCHAR(255),
        GuestID INT,
        ListingID INT,
        FOREIGN KEY (GuestID) REFERENCES User (UserID),
        FOREIGN KEY (ListingID) REFERENCES Listing (ListingID)
    );

-- Create the Booking table
CREATE TABLE
    Booking (
        BookingID INT PRIMARY KEY,
        CheckInDate DATE,
        CheckOutDate DATE,
        TotalPrice DECIMAL(10, 2),
        GuestID INT,
        ListingID INT,
        FOREIGN KEY (GuestID) REFERENCES User (UserID),
        FOREIGN KEY (ListingID) REFERENCES Listing (ListingID)
    );

-- Create the Reservation table
CREATE TABLE
    Reservation (
        ReservationID INT PRIMARY KEY,
        CheckInDate DATE,
        CheckOutDate DATE,
        TotalPrice DECIMAL(10, 2),
        GuestID INT,
        RoomID INT,
        FOREIGN KEY (GuestID) REFERENCES User (UserID),
        FOREIGN KEY (RoomID) REFERENCES Room (RoomID)
    );

-- Create the Amenity table
CREATE TABLE
    Amenity (
        AmenityID INT PRIMARY KEY,
        AmenityName VARCHAR(255)
    );

-- Create the Payment table
CREATE TABLE
    Payment (
        PaymentID INT PRIMARY KEY,
        Amount DECIMAL(10, 2),
        PaymentDate DATE,
        BookingID INT,
        FOREIGN KEY (BookingID) REFERENCES Booking (BookingID)
    );

-- Create the Message table
CREATE TABLE
    Message (
        MessageID INT PRIMARY KEY,
        SenderID INT,
        ReceiverID INT,
        MessageText VARCHAR(255),
        Timestamp TIMESTAMP,
        FOREIGN KEY (SenderID) REFERENCES User (UserID),
        FOREIGN KEY (ReceiverID) REFERENCES User (UserID)
    );

-- Create the Notification table
CREATE TABLE
    Notification (
        NotificationID INT PRIMARY KEY,
        UserID INT,
        NotificationText VARCHAR(255),
        Timestamp TIMESTAMP,
        FOREIGN KEY (UserID) REFERENCES User (UserID)
    );

-- Create the Tag table
CREATE TABLE
    Tag (TagID INT PRIMARY KEY, TagName VARCHAR(255));

-- Create the ListingTag table
CREATE TABLE
    ListingTag (
        ListingTagID INT PRIMARY KEY,
        ListingID INT,
        TagID INT,
        FOREIGN KEY (ListingID) REFERENCES Listing (ListingID),
        FOREIGN KEY (TagID) REFERENCES Tag (TagID)
    );

-- Create the BookingRequest table
CREATE TABLE
    BookingRequest (
        RequestID INT PRIMARY KEY,
        GuestID INT,
        ListingID INT,
        RequestStatus VARCHAR(255),
        CheckInDate DATE,
        CheckOutDate DATE
    );

-- Create the StayHistory table
CREATE TABLE
    StayHistory (
        StayHistoryID INT PRIMARY KEY,
        GuestID INT,
        ListingID INT,
        CheckInDate DATE,
        CheckOutDate DATE
    );

-- Create the CancellationPolicy table
CREATE TABLE
    CancellationPolicy (
        PolicyID INT PRIMARY KEY,
        PolicyName VARCHAR(255),
        Description VARCHAR(255)
    );