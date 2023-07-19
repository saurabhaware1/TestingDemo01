public with sharing class Spoonacular {
    private static final String RECEIPE_API = 'https://api.spoonacular.com';
    private static final String API_KEY = '7ff04244656642eba6d90f6e0893fa04';
    
    @AuraEnabled
    public static String getRandomRecipe(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(RECEIPE_API+'/recipes/random?apiKey='+API_KEY);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            return response.getBody();
        }
        return '';
    }
    
    @AuraEnabled
    public static String getRecipe(String recipeId){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(RECEIPE_API+'/recipes/'+recipeId+'/information?apiKey='+API_KEY);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            return response.getBody();
        }
        return '';
    }
    
    @AuraEnabled
    public static String getRecipeByIngredients(String ingredients){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint(RECEIPE_API+'/recipes/findByIngredients?ingredients='+ingredients+'&number=10&apiKey='+API_KEY);
        request.setMethod('GET');
        
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            system.debug('This is the Response ===> ' + response.getBody());
            return response.getBody();
            
        }
        return '';
    }
}