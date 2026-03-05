namespace logali.salesorders;

entity Header {
    @title: 'Header ID'
    key ID           : String(36);
    @title: 'Email'
    key Email        : String(30);
    @title: 'First Name'
    FirstName        : String(30);
    @title: 'Last Name '
    LastName         : String; 
    @title: 'Country'
    Country          : String(30);
    @title: 'Created On'
    CreatedOn        : Date;
    @title: 'Delivery Date'
    DeliveryDate     : DateTime;
    @title: 'Order Status'
    OrderStatus      : Integer;
    ImageURL         : String;
    Items            : Composition of many Items on Items.header = $self;
}

entity Items {
    @title: 'Item ID'
    key ID           : String(36);
    @title: 'Product Name'
    Name             : String(40);
    @title: 'Description'
    Description      : String(40);
    @title: 'Release Date' 
    ReleaseDate      : Date;
    @title: 'Discontinued Date'
    DiscontinuedDate : Date;
    @title: 'Price'
    Price            : Decimal(12, 2);
    @title: 'Height'
    Height           : Decimal(15, 3);
    @title: 'Width'
    Width            : Decimal(13, 3);
    @title: 'Depth'
    Depth            : Decimal(12, 2);
    @title: 'Quantity'
    Quantity         : Decimal(16, 2);
    @title: 'Unit'
    UnitOfMeasure    : String; 
    header           : Association to Header;
}