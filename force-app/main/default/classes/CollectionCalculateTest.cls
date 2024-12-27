@isTest
public class CollectionCalculateTest {

    @isTest
    static void testCollectionCalculateAddOperation() {
        // Setup test data
        List<SObject> testRecords = new List<SObject>();
        for (Integer i = 0; i < 5; i++) {
            Account acc = new Account();
            acc.Name = 'Test Account ' + i; // Adding Name field
            acc.AnnualRevenue = i + 1;
            testRecords.add(acc);
        }
        insert testRecords;

        // Create request
        CollectionCalculate.Requests request = new CollectionCalculate.Requests();
        request.inputCollection = testRecords;
        request.fieldName = 'AnnualRevenue';
        request.operation = 'add';

        // Test the invocable method
        List<CollectionCalculate.Results> results = CollectionCalculate.execute(new List<CollectionCalculate.Requests> { request });

        // Assert the result
        System.assertEquals(15, results[0].outputDecimalResult, 'Add operation should return the correct sum');
    }

    @isTest
    static void testCollectionCalculateMultiplyOperation() {
        // Setup test data
        List<SObject> testRecords = new List<SObject>();
        for (Integer i = 1; i <= 3; i++) {
            Account acc = new Account();
            acc.Name = 'Test Account ' + i; // Adding Name field
            acc.AnnualRevenue = i;
            testRecords.add(acc);
        }
        insert testRecords;

        // Create request
        CollectionCalculate.Requests request = new CollectionCalculate.Requests();
        request.inputCollection = testRecords;
        request.fieldName = 'AnnualRevenue';
        request.operation = 'multiply';

        // Test the invocable method
        List<CollectionCalculate.Results> results = CollectionCalculate.execute(new List<CollectionCalculate.Requests> { request });

        // Assert the result
        System.assertEquals(6, results[0].outputDecimalResult, 'Multiply operation should return the correct product');
    }

    @isTest
    static void testCollectionCalculateAverageOperation() {
        // Setup test data
        List<SObject> testRecords = new List<SObject>();
        for (Integer i = 0; i < 4; i++) {
            Account acc = new Account();
            acc.Name = 'Test Account ' + i; // Adding Name field
            acc.AnnualRevenue = i + 1;
            testRecords.add(acc);
        }
        insert testRecords;

        // Create request
        CollectionCalculate.Requests request = new CollectionCalculate.Requests();
        request.inputCollection = testRecords;
        request.fieldName = 'AnnualRevenue';
        request.operation = 'average';

        // Test the invocable method
        List<CollectionCalculate.Results> results = CollectionCalculate.execute(new List<CollectionCalculate.Requests> { request });

        // Assert the result
        System.assertEquals(2.5, results[0].outputDecimalResult, 'Average operation should return the correct mean value');
    }

    @isTest
    static void testCollectionCalculateInvalidOperation() {
        // Setup test data
        List<SObject> testRecords = new List<SObject>();
        for (Integer i = 0; i < 4; i++) {
            Account acc = new Account();
            acc.Name = 'Test Account ' + i; // Adding Name field
            acc.AnnualRevenue = i + 1;
            testRecords.add(acc);
        }
        insert testRecords;

        // Create request
        CollectionCalculate.Requests request = new CollectionCalculate.Requests();
        request.inputCollection = testRecords;
        request.fieldName = 'AnnualRevenue';
        request.operation = 'invalidOperation';

        // Test the invocable method
        try {
            List<CollectionCalculate.Results> results = CollectionCalculate.execute(new List<CollectionCalculate.Requests> { request });
            System.assert(false, 'An exception should have been thrown for an invalid operation.');
        } catch (CollectionCalculate.InvocableActionException ex) {
            System.assertEquals('You provided an invalid value for the operation input', ex.getMessage(), 'Exception message should match the expected error message');
        }
    }
}