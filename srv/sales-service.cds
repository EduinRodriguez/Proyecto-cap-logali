using { logali.salesorders as my } from '../db/schema';

service SalesService {
    @odata.draft.enabled 
    entity SalesOrders as projection on my.Header;
    entity OrderItems as projection on my.Items;
}