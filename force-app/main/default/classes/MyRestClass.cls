@RestResource(urlMapping ='/MyRestClassEP/*')
Global class MyRestClass 
{
    @httpGet
    global static void getData(){
        RestRequest req = Restcontext.request; // to handle the request we created this restrequest instance from extenal site
        //  Restcontext.request; we are storing the request from third party and handling the request
        //  RestRequest res =  we have created and RestRequest instance ie 'res' to hold all req
        string urlid = req.requestURI;
        string uid = urlid.substring(urlid.lastIndexOf('/')+1);
        list<Contact> conlist = [SELECT id,Name,Department,Phone  from Contact where AccountId =:uid]; // querying Contact Info to send postman
        // best practice to use TRY AND Catch block while sending data to external site to handle the exception if occures
        try{ 
            RestResponse res = RestContext.response;
            string JASONbody = JSON.serialize(conlist); // here we are serialize all data which present in the" conlist " in from of JSON like "KEY" :" Value ",
            
            // blob = is use to convert response body in base64 to Encrypted for security porpose
            res.responseBody = Blob.valueOf(JASONbody);
            res.statusCode= 200;
            
        } catch (Exception e)
        {
            RestResponse res = RestContext.response;
            string JASONbody = JSON.serialize(e.getMessage());
            res.responseBody = Blob.valueOf(JASONbody);
            res.statusCode = 200;
        }
        //return 'get method run successfully...!!!';
    }
    
    
    @httpPost
    global static void postData()
    {
        try{
            //created RestRequest instance .. to store whaterver request coming from external site 
            RestRequest req = Restcontext.request; 
            
            // as we are getting data in base64 formate we have to convert that into the Json, so we have used body.tostring();
            Blob blobbody = req.requestBody; // as datatype is blob so we have used the blob here to store response
            string jsonData  = blobbody.toString(); // here converting that into string 
            List<Sobject> AccToInsert = (List<Sobject>) JSON.deserialize(jsonData, List<Sobject>.class);           
            insert AccToInsert;
            
        } 
        catch(Exception e){
            RestResponse res = RestContext.response;
            string JASONbody = JSON.serialize(e.getMessage());
            res.responseBody = Blob.valueOf(JASONbody);
            res.statusCode = 200;
        }
    }
    
}