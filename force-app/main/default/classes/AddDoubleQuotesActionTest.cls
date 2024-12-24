@IsTest
public class AddDoubleQuotesActionTest {
    @IsTest
    static void testAddDoubleQuotesDefault() {
        // Step 1: Prepare test data
        List<AddDoubleQuotesAction.Input> inputs = new List<AddDoubleQuotesAction.Input>();
        AddDoubleQuotesAction.Input input = new AddDoubleQuotesAction.Input();
        input.textCollection = new List<String> { 'Apple', 'Banana', 'Cherry' };
        inputs.add(input);

        // Step 2: Execute the method
        Test.startTest();
        List<AddDoubleQuotesAction.Output> outputs = AddDoubleQuotesAction.addQuotes(inputs);
        Test.stopTest();

        // Step 3: Validate results
        System.assertNotEquals(null, outputs, 'The output should not be null.');
        System.assertEquals(1, outputs.size(), 'The output should contain one record.');

        List<String> modifiedCollection = outputs[0].modifiedCollection;
        System.assertNotEquals(null, modifiedCollection, 'The modified collection should not be null.');
        System.assertEquals(3, modifiedCollection.size(), 'The modified collection should contain three items.');

        // Check each modified item
        System.assertEquals('"Apple"', modifiedCollection[0], 'The first item should be wrapped in double quotes.');
        System.assertEquals('"Banana"', modifiedCollection[1], 'The second item should be wrapped in double quotes.');
        System.assertEquals('"Cherry"', modifiedCollection[2], 'The third item should be wrapped in double quotes.');
    }

    @IsTest
    static void testAddSingleQuotes() {
        // Step 1: Prepare test data with single quotes
        List<AddDoubleQuotesAction.Input> inputs = new List<AddDoubleQuotesAction.Input>();
        AddDoubleQuotesAction.Input input = new AddDoubleQuotesAction.Input();
        input.textCollection = new List<String> { 'Apple', 'Banana', 'Cherry' };
        input.useSingleQuotes = true;
        inputs.add(input);

        // Step 2: Execute the method
        Test.startTest();
        List<AddDoubleQuotesAction.Output> outputs = AddDoubleQuotesAction.addQuotes(inputs);
        Test.stopTest();

        // Step 3: Validate results
        System.assertNotEquals(null, outputs, 'The output should not be null.');
        System.assertEquals(1, outputs.size(), 'The output should contain one record.');

        List<String> modifiedCollection = outputs[0].modifiedCollection;
        System.assertNotEquals(null, modifiedCollection, 'The modified collection should not be null.');
        System.assertEquals(3, modifiedCollection.size(), 'The modified collection should contain three items.');

        // Check each modified item
        System.assertEquals('\'Apple\'', modifiedCollection[0], 'The first item should be wrapped in single quotes.');
        System.assertEquals('\'Banana\'', modifiedCollection[1], 'The second item should be wrapped in single quotes.');
        System.assertEquals('\'Cherry\'', modifiedCollection[2], 'The third item should be wrapped in single quotes.');
    }

    @IsTest
    static void testEmptyInput() {
        // Step 1: Prepare empty input
        List<AddDoubleQuotesAction.Input> inputs = new List<AddDoubleQuotesAction.Input>();
        AddDoubleQuotesAction.Input input = new AddDoubleQuotesAction.Input();
        input.textCollection = new List<String>();
        inputs.add(input);

        // Step 2: Execute the method
        Test.startTest();
        List<AddDoubleQuotesAction.Output> outputs = AddDoubleQuotesAction.addQuotes(inputs);
        Test.stopTest();

        // Step 3: Validate results
        System.assertNotEquals(null, outputs, 'The output should not be null.');
        System.assertEquals(1, outputs.size(), 'The output should contain one record.');

        List<String> modifiedCollection = outputs[0].modifiedCollection;
        System.assertNotEquals(null, modifiedCollection, 'The modified collection should not be null.');
        System.assertEquals(0, modifiedCollection.size(), 'The modified collection should be empty.');
    }

    @IsTest
    static void testNullInput() {
        // Step 1: Prepare input with null text collection
        List<AddDoubleQuotesAction.Input> inputs = new List<AddDoubleQuotesAction.Input>();
        AddDoubleQuotesAction.Input input = new AddDoubleQuotesAction.Input();
        input.textCollection = null;
        inputs.add(input);

        // Step 2: Execute the method
        Test.startTest();
        List<AddDoubleQuotesAction.Output> outputs = AddDoubleQuotesAction.addQuotes(inputs);
        Test.stopTest();

        // Step 3: Validate results
        System.assertNotEquals(null, outputs, 'The output should not be null.');
        System.assertEquals(1, outputs.size(), 'The output should contain one record.');

        List<String> modifiedCollection = outputs[0].modifiedCollection;
        System.assertNotEquals(null, modifiedCollection, 'The modified collection should not be null.');
        System.assertEquals(0, modifiedCollection.size(), 'The modified collection should be empty.');
    }
}