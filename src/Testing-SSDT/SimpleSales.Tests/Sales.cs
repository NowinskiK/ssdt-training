using System;
using System.Collections.Generic;
using System.Data;
using System.Data.Common;
using System.Text;
using Microsoft.Data.Tools.Schema.Sql.UnitTesting;
using Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions;
using Microsoft.VisualStudio.TestTools.UnitTesting;

namespace SimpleSales.Tests
{
    [TestClass()]
    public class Sales : SqlDatabaseTestClass
    {

        public Sales()
        {
            InitializeComponent();
        }

        [TestInitialize()]
        public void TestInitialize()
        {
            base.InitializeTest();
        }
        [TestCleanup()]
        public void TestCleanup()
        {
            base.CleanupTest();
        }

        #region Designer support code

        /// <summary> 
        /// Required method for Designer support - do not modify 
        /// the contents of this method with the code editor.
        /// </summary>
        private void InitializeComponent()
        {
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Sales_uspCancelOrderTest_TestAction;
            System.ComponentModel.ComponentResourceManager resources = new System.ComponentModel.ComponentResourceManager(typeof(Sales));
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Sales_uspFillOrderTest_TestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ScalarValueCondition scalarValueCondition2;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Sales_uspNewCustomerTest_TestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.RowCountCondition rowCountCondition1;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Sales_uspPlaceNewOrderTest_TestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ScalarValueCondition scalarValueCondition1;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Sales_uspShowOrderDetailsTest_TestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ExpectedSchemaCondition expectedSchemaCondition1;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ChecksumCondition checksumCondition1;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Sales_uspPlaceNewOrderTest_PretestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Sales_uspFillOrderTest_PretestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Sales_uspShowOrderDetailsTest_PretestAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction testInitializeAction;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ScalarValueCondition scalarValueCondition3;
            Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction Sales_uspCancelOrderTest_PretestAction;
            this.Sales_uspCancelOrderTestData = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestActions();
            this.Sales_uspFillOrderTestData = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestActions();
            this.Sales_uspNewCustomerTestData = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestActions();
            this.Sales_uspPlaceNewOrderTestData = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestActions();
            this.Sales_uspShowOrderDetailsTestData = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestActions();
            Sales_uspCancelOrderTest_TestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            Sales_uspFillOrderTest_TestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            scalarValueCondition2 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ScalarValueCondition();
            Sales_uspNewCustomerTest_TestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            rowCountCondition1 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.RowCountCondition();
            Sales_uspPlaceNewOrderTest_TestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            scalarValueCondition1 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ScalarValueCondition();
            Sales_uspShowOrderDetailsTest_TestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            expectedSchemaCondition1 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ExpectedSchemaCondition();
            checksumCondition1 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ChecksumCondition();
            Sales_uspPlaceNewOrderTest_PretestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            Sales_uspFillOrderTest_PretestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            Sales_uspShowOrderDetailsTest_PretestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            testInitializeAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            scalarValueCondition3 = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.Conditions.ScalarValueCondition();
            Sales_uspCancelOrderTest_PretestAction = new Microsoft.Data.Tools.Schema.Sql.UnitTesting.SqlDatabaseTestAction();
            // 
            // Sales_uspCancelOrderTest_TestAction
            // 
            Sales_uspCancelOrderTest_TestAction.Conditions.Add(scalarValueCondition3);
            resources.ApplyResources(Sales_uspCancelOrderTest_TestAction, "Sales_uspCancelOrderTest_TestAction");
            // 
            // Sales_uspFillOrderTest_TestAction
            // 
            Sales_uspFillOrderTest_TestAction.Conditions.Add(scalarValueCondition2);
            resources.ApplyResources(Sales_uspFillOrderTest_TestAction, "Sales_uspFillOrderTest_TestAction");
            // 
            // scalarValueCondition2
            // 
            scalarValueCondition2.ColumnNumber = 1;
            scalarValueCondition2.Enabled = true;
            scalarValueCondition2.ExpectedValue = "100";
            scalarValueCondition2.Name = "scalarValueCondition2";
            scalarValueCondition2.NullExpected = false;
            scalarValueCondition2.ResultSet = 1;
            scalarValueCondition2.RowNumber = 1;
            // 
            // Sales_uspNewCustomerTest_TestAction
            // 
            Sales_uspNewCustomerTest_TestAction.Conditions.Add(rowCountCondition1);
            resources.ApplyResources(Sales_uspNewCustomerTest_TestAction, "Sales_uspNewCustomerTest_TestAction");
            // 
            // rowCountCondition1
            // 
            rowCountCondition1.Enabled = true;
            rowCountCondition1.Name = "rowCountCondition1";
            rowCountCondition1.ResultSet = 1;
            rowCountCondition1.RowCount = 1;
            // 
            // Sales_uspPlaceNewOrderTest_TestAction
            // 
            Sales_uspPlaceNewOrderTest_TestAction.Conditions.Add(scalarValueCondition1);
            resources.ApplyResources(Sales_uspPlaceNewOrderTest_TestAction, "Sales_uspPlaceNewOrderTest_TestAction");
            // 
            // scalarValueCondition1
            // 
            scalarValueCondition1.ColumnNumber = 1;
            scalarValueCondition1.Enabled = true;
            scalarValueCondition1.ExpectedValue = "100";
            scalarValueCondition1.Name = "scalarValueCondition1";
            scalarValueCondition1.NullExpected = false;
            scalarValueCondition1.ResultSet = 1;
            scalarValueCondition1.RowNumber = 1;
            // 
            // Sales_uspShowOrderDetailsTest_TestAction
            // 
            Sales_uspShowOrderDetailsTest_TestAction.Conditions.Add(expectedSchemaCondition1);
            Sales_uspShowOrderDetailsTest_TestAction.Conditions.Add(checksumCondition1);
            resources.ApplyResources(Sales_uspShowOrderDetailsTest_TestAction, "Sales_uspShowOrderDetailsTest_TestAction");
            // 
            // expectedSchemaCondition1
            // 
            expectedSchemaCondition1.Enabled = true;
            expectedSchemaCondition1.Name = "expectedSchemaCondition1";
            resources.ApplyResources(expectedSchemaCondition1, "expectedSchemaCondition1");
            expectedSchemaCondition1.Verbose = false;
            // 
            // checksumCondition1
            // 
            checksumCondition1.Checksum = "758721579";
            checksumCondition1.Enabled = true;
            checksumCondition1.Name = "checksumCondition1";
            // 
            // Sales_uspPlaceNewOrderTest_PretestAction
            // 
            resources.ApplyResources(Sales_uspPlaceNewOrderTest_PretestAction, "Sales_uspPlaceNewOrderTest_PretestAction");
            // 
            // Sales_uspFillOrderTest_PretestAction
            // 
            resources.ApplyResources(Sales_uspFillOrderTest_PretestAction, "Sales_uspFillOrderTest_PretestAction");
            // 
            // Sales_uspShowOrderDetailsTest_PretestAction
            // 
            resources.ApplyResources(Sales_uspShowOrderDetailsTest_PretestAction, "Sales_uspShowOrderDetailsTest_PretestAction");
            // 
            // testInitializeAction
            // 
            resources.ApplyResources(testInitializeAction, "testInitializeAction");
            // 
            // Sales_uspCancelOrderTestData
            // 
            this.Sales_uspCancelOrderTestData.PosttestAction = null;
            this.Sales_uspCancelOrderTestData.PretestAction = Sales_uspCancelOrderTest_PretestAction;
            this.Sales_uspCancelOrderTestData.TestAction = Sales_uspCancelOrderTest_TestAction;
            // 
            // Sales_uspFillOrderTestData
            // 
            this.Sales_uspFillOrderTestData.PosttestAction = null;
            this.Sales_uspFillOrderTestData.PretestAction = Sales_uspFillOrderTest_PretestAction;
            this.Sales_uspFillOrderTestData.TestAction = Sales_uspFillOrderTest_TestAction;
            // 
            // Sales_uspNewCustomerTestData
            // 
            this.Sales_uspNewCustomerTestData.PosttestAction = null;
            this.Sales_uspNewCustomerTestData.PretestAction = null;
            this.Sales_uspNewCustomerTestData.TestAction = Sales_uspNewCustomerTest_TestAction;
            // 
            // Sales_uspPlaceNewOrderTestData
            // 
            this.Sales_uspPlaceNewOrderTestData.PosttestAction = null;
            this.Sales_uspPlaceNewOrderTestData.PretestAction = Sales_uspPlaceNewOrderTest_PretestAction;
            this.Sales_uspPlaceNewOrderTestData.TestAction = Sales_uspPlaceNewOrderTest_TestAction;
            // 
            // Sales_uspShowOrderDetailsTestData
            // 
            this.Sales_uspShowOrderDetailsTestData.PosttestAction = null;
            this.Sales_uspShowOrderDetailsTestData.PretestAction = Sales_uspShowOrderDetailsTest_PretestAction;
            this.Sales_uspShowOrderDetailsTestData.TestAction = Sales_uspShowOrderDetailsTest_TestAction;
            // 
            // scalarValueCondition3
            // 
            scalarValueCondition3.ColumnNumber = 1;
            scalarValueCondition3.Enabled = true;
            scalarValueCondition3.ExpectedValue = "0";
            scalarValueCondition3.Name = "scalarValueCondition3";
            scalarValueCondition3.NullExpected = false;
            scalarValueCondition3.ResultSet = 1;
            scalarValueCondition3.RowNumber = 1;
            // 
            // Sales_uspCancelOrderTest_PretestAction
            // 
            resources.ApplyResources(Sales_uspCancelOrderTest_PretestAction, "Sales_uspCancelOrderTest_PretestAction");
            // 
            // Sales
            // 
            this.TestInitializeAction = testInitializeAction;
        }

        #endregion


        #region Additional test attributes
        //
        // You can use the following additional attributes as you write your tests:
        //
        // Use ClassInitialize to run code before running the first test in the class
        // [ClassInitialize()]
        // public static void MyClassInitialize(TestContext testContext) { }
        //
        // Use ClassCleanup to run code after all tests in a class have run
        // [ClassCleanup()]
        // public static void MyClassCleanup() { }
        //
        #endregion

        [TestMethod(), ExpectedSqlException(Severity = 16, MatchFirstError = false, State = 1)]
        public void Sales_uspCancelOrderTest()
        {
            SqlDatabaseTestActions testActions = this.Sales_uspCancelOrderTestData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            SqlExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            try
            {
                // Execute the test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
                SqlExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            }
            finally
            {
                // Execute the post-test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
                SqlExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
            }
        }

        [TestMethod()]
        public void Sales_uspFillOrderTest()
        {
            SqlDatabaseTestActions testActions = this.Sales_uspFillOrderTestData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            SqlExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            try
            {
                // Execute the test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
                SqlExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            }
            finally
            {
                // Execute the post-test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
                SqlExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
            }
        }

        [TestMethod()]
        public void Sales_uspNewCustomerTest()
        {
            SqlDatabaseTestActions testActions = this.Sales_uspNewCustomerTestData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            SqlExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            try
            {
                // Execute the test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
                SqlExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            }
            finally
            {
                // Execute the post-test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
                SqlExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
            }
        }

        [TestMethod()]
        public void Sales_uspPlaceNewOrderTest()
        {
            SqlDatabaseTestActions testActions = this.Sales_uspPlaceNewOrderTestData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            SqlExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            try
            {
                // Execute the test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
                SqlExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            }
            finally
            {
                // Execute the post-test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
                SqlExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
            }
        }

        [TestMethod()]
        public void Sales_uspShowOrderDetailsTest()
        {
            SqlDatabaseTestActions testActions = this.Sales_uspShowOrderDetailsTestData;
            // Execute the pre-test script
            // 
            System.Diagnostics.Trace.WriteLineIf((testActions.PretestAction != null), "Executing pre-test script...");
            SqlExecutionResult[] pretestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PretestAction);
            try
            {
                // Execute the test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.TestAction != null), "Executing test script...");
                SqlExecutionResult[] testResults = TestService.Execute(this.ExecutionContext, this.PrivilegedContext, testActions.TestAction);
            }
            finally
            {
                // Execute the post-test script
                // 
                System.Diagnostics.Trace.WriteLineIf((testActions.PosttestAction != null), "Executing post-test script...");
                SqlExecutionResult[] posttestResults = TestService.Execute(this.PrivilegedContext, this.PrivilegedContext, testActions.PosttestAction);
            }
        }
        private SqlDatabaseTestActions Sales_uspCancelOrderTestData;
        private SqlDatabaseTestActions Sales_uspFillOrderTestData;
        private SqlDatabaseTestActions Sales_uspNewCustomerTestData;
        private SqlDatabaseTestActions Sales_uspPlaceNewOrderTestData;
        private SqlDatabaseTestActions Sales_uspShowOrderDetailsTestData;
    }
}
