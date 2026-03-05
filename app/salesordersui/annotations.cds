using SalesService as service from '../../srv/sales-service';

annotate service.SalesOrders with @(
    UI.HeaderInfo : {
        TypeName       : 'Sales Order',
        TypeNamePlural : 'Sales Orders',
        Title          : { Value : ID },
        Description    : { Value : Email },
        // Aquí es donde la imagen se vuelve dinámica para la cabecera
        ImageUrl       : ImageURL 
    },
    // Habilita botones de Alta y Eliminación (Requerimiento 2.1 y 2.3)
    UI.Capabilities : {
        Insertable : true,
        Deletable  : true,
        Updatable  : true
    },
    // Configuración de la tabla principal (Reporte - Requerimiento 2.4)
    UI.LineItem : [
        { Value : ID, Label : 'Order ID' },
        { Value : Email, Label : 'Email' },
        { Value : FirstName, Label : 'First Name' },
        { Value : LastName, Label : 'Last Name' },
        { Value : Country, Label : 'Country' },
        { Value : OrderStatus, Label : 'Status', Criticality : OrderStatus }
    ],
    // Definición de las secciones del detalle (Requerimiento 3)
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

// Define las columnas para la tabla de Items (Sin esto no verás datos abajo)
annotate service.OrderItems with @(
    // 1. Cabecera del objeto (Título y Subtítulo)
    UI.HeaderInfo : {
        TypeName       : 'Producto',
        TypeNamePlural : 'Productos',
        Title          : { Value : Name },
        Description    : { Value : Description }        
    },

    // 2. Organización en secciones (Facets)
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

    // 3. Grupo de campos: Datos Generales (Columna 1)
    UI.FieldGroup #GeneralData : {
        Data : [
            { Value : ReleaseDate },
            { Value : DiscontinuedDate },
            { Value : Price },
            { Value : Quantity },
            { Value : UnitOfMeasure }
        ]
    },

    // 4. Grupo de campos: Dimensiones (Columna 2)
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