public with sharing class PalindromeController {
    
    // Input VF variable to get the text
    // from user
    public String palindromeTxt {get;set;}
    
    // Output VF variable to show the result
    public String palindromeResult {get;set;}
    
    public PageReference checkPalindrome() {
        
        // Initialize list to store the reverse
        // characters
        List<String> reverseLst = new List<String>();
        
        // In order to make it easier, when remove
        // blanks and any whitespaces from the string, 
        // and also convert all into lowercase string.
        String txtToConvert = palindromeTxt.toLowerCase().deleteWhitespace();
        List<String> normalLst = txtToConvert.split('');
        
        // Once the characters are split into List
        // we remove special characters and spaces 
        // from the user string.
        txtToConvert = txtToConvert.replaceAll('[^a-zA-Z0-9\\s+]', '');
        
        // Iterate through the suser input List generated above
        // and store the characters in reverse order
        for(Integer i = normalLst.size()-1; i>=0;i--) {
            reverseLst.add(normalLst.get(i));
        }
        
        // Once the List is reversed,
        // we remove special characters and spaces 
        // from the user string.
        String reverseLstString = String.join(reverseLst, '').replaceAll('[^a-zA-Z0-9\\s+]', '');
        
        // We compare the user string and the reversed string
        // if they match then we consider it as palindrome.
        if( txtToConvert == reverseLstString ) {
            palindromeResult = 'It is a palindrome';
        } else {
            palindromeResult = 'It is not a palindrome';
        }
        
        return null;
    }
    
}