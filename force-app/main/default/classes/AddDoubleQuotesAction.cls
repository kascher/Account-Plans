public with sharing class AddDoubleQuotesAction {

    @InvocableMethod(label='Add Quotes to Text Collection' description='Takes a collection of text strings and adds either single or double quotes to each item.' category='Collection Management')
    public static List<Output> addQuotes(List<Input> inputList) {
        List<String> resultList = new List<String>();

        for (Input input : inputList) {
            if (input.textCollection != null) {
                String quoteType = input.useSingleQuotes ? '\'' : '"';
                for (String item : input.textCollection) {
                    resultList.add(quoteType + item + quoteType);
                }
            }
        }
        
        // Return the updated collection
        return new List<Output> { new Output(resultList) };
    }
    
    public class Input {
        @InvocableVariable(label='Text Collection' description='The input collection of text strings.' required=true)
        public List<String> textCollection;

        @InvocableVariable(label='Use Single Quotes' description='Set to true to use single quotes. Default is false (double quotes).' required=false)
        public Boolean useSingleQuotes = false;
    }

    public class Output {
        @InvocableVariable(label='Modified Text Collection' description='The output collection with quotes added to each string.')
        public List<String> modifiedCollection;
        
        public Output(List<String> modifiedCollection) {
            this.modifiedCollection = modifiedCollection;
        }
    }
}