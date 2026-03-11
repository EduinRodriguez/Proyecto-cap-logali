using SalesService as service from '../../srv/sales-service';

annotate service.SalesOrders with @(
    UI.HeaderInfo : {
        TypeName       : 'Sales Order',
        TypeNamePlural : 'Sales Orders',
        Title          : { Value : ID },
        Description    : { Value : Email },
        ImageUrl       : ImageURL 
    },
    UI.Capabilities : {
        Insertable : true,
        Deletable  : true,
        Updatable  : true
    },
    UI.LineItem : [
        { Value : ID, Label : 'Order ID' },
        { Value : Email, Label : 'Email' },
        { Value : FirstName, Label : 'First Name' },
        { Value : LastName, Label : 'Last Name' },
        { Value : Country, Label : 'Country' },
        { Value : OrderStatus, Label : 'Status', Criticality : OrderStatus }
    ],
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Order Information',
            Target : '@UI.FieldGroup#Details'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Order Items List',
            Target : 'Items/@UI.LineItem' 
        }
    ],
    UI.FieldGroup #Details : {
        Data : [
            { Value : FirstName },
            { Value : LastName },
            { Value : Country }
        ]
    }
);

annotate service.OrderItems with @(
    UI.HeaderInfo : {
        TypeName       : 'Producto',
        TypeNamePlural : 'Productos',
        Title          : { Value : Name },
        Description    : { Value : Description }        
    },
    UI.Facets : [
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Información General',
            Target : '@UI.FieldGroup#GeneralData'
        },
        {
            $Type : 'UI.ReferenceFacet',
            Label : 'Dimensiones',
            Target : '@UI.FieldGroup#Dimensions'
        }
    ],

    UI.FieldGroup #GeneralData : {
        Data : [
            { Value : ReleaseDate },
            { Value : DiscontinuedDate },
            { Value : Price },
            { Value : Quantity },
            { Value : UnitOfMeasure }
        ]
    },

    UI.FieldGroup #Dimensions : {
        Data : [
            { Value : Height },
            { Value : Width },
            { Value : Depth }
        ]
    }
);

annotate service.OrderItems with @(
    UI.LineItem : [
        { Value : ID, Label : 'Item ID' },
        { Value : Name, Label : 'Product' },
        { Value : Quantity, Label : 'Quantity' },
        { Value : Price, Label : 'Price' },
        { Value : UnitOfMeasure, Label : 'Unit' }
    ]
);