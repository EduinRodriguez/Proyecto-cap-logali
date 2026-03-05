sap.ui.define([
    "sap/ui/test/opaQunit",
    "./pages/JourneyRunner"
], function (opaTest, runner) {
    "use strict";

    function journey() {
        QUnit.module("First journey");

        opaTest("Start application", function (Given, When, Then) {
            Given.iStartMyApp();

            Then.onTheSalesOrdersList.iSeeThisPage();
            Then.onTheSalesOrdersList.onFilterBar().iCheckFilterField("ID");
            Then.onTheSalesOrdersList.onFilterBar().iCheckFilterField("Email");
            Then.onTheSalesOrdersList.onFilterBar().iCheckFilterField("Country");
            Then.onTheSalesOrdersList.onFilterBar().iCheckFilterField("OrderStatus");
            Then.onTheSalesOrdersList.onTable().iCheckColumns(8, {"ID":{"header":"Order ID"},"Email":{"header":"Email"},"FirstName":{"header":"First Name"},"LastName":{"header":"Last Name"},"Country":{"header":"Country"},"CreatedOn":{"header":"Created On"},"DeliveryDate":{"header":"Delivery Date"},"OrderStatus":{"header":"Status"}});

        });


        opaTest("Navigate to ObjectPage", function (Given, When, Then) {
            // Note: this test will fail if the ListReport page doesn't show any data
            
            When.onTheSalesOrdersList.onFilterBar().iExecuteSearch();
            
            Then.onTheSalesOrdersList.onTable().iCheckRows();

            When.onTheSalesOrdersList.onTable().iPressRow(0);
            Then.onTheSalesOrdersObjectPage.iSeeThisPage();

        });

        opaTest("Teardown", function (Given, When, Then) { 
            // Cleanup
            Given.iTearDownMyApp();
        });
    }

    runner.run([journey]);
});