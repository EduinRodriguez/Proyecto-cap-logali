const cds = require('@sap/cds');

module.exports = cds.service.impl(async function() {
    const { SalesOrders } = this.entities;

    this.before(['CREATE', 'UPDATE'], SalesOrders, req => {
        if (!req.data.ID) req.error(400, 'ID is mandatory', 'in/ID');
        if (!req.data.Email) req.error(400, 'Email is mandatory', 'in/Email');
    });

});