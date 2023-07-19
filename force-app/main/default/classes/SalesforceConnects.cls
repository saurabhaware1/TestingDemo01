public class SalesforceConnects 
{
    public static String getCasesFromSB(){
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://skillminds62-dev-ed.develop.my.salesforce.com/services/apexrest/Cases');
        request.setMethod('GET');
        request.setHeader('Authorization', 'Bearer !AQwAQLKxO9AmkQjCDg8NDBjnkNwENQs4bCWnPuzCl1rzhLJa8jjOpyuuAP36pVIne8V7LC0FYW.fzgASDQnFWizuzYDq63cz ');
        
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        if (response.getStatusCode() == 200) {
            system.debug('Response -->' +response.getBody());
            return response.getBody();
        }
        return '';
    }
}