using { logali.salesorders as my } from '../db/schema';

service SalesService {
    @odata.draft.enabled // Esto habilita el botón Crear y la edición en Fiori Elements
    entity SalesOrders as projection on my.Header;
    entity OrderItems as projection on my.Items;
}