sap.ui.define([
    "sap/fe/test/JourneyRunner",
	"salesordersui/test/integration/pages/SalesOrdersList",
	"salesordersui/test/integration/pages/SalesOrdersObjectPage",
	"salesordersui/test/integration/pages/OrderItemsObjectPage"
], function (JourneyRunner, SalesOrdersList, SalesOrdersObjectPage, OrderItemsObjectPage) {
    'use strict';

    var runner = new JourneyRunner({
        launchUrl: sap.ui.require.toUrl('salesordersui') + '/test/flp.html#app-preview',
        pages: {
			onTheSalesOrdersList: SalesOrdersList,
			onTheSalesOrdersObjectPage: SalesOrdersObjectPage,
			onTheOrderItemsObjectPage: OrderItemsObjectPage
        },
        async: true
    });

    return runner;
});

