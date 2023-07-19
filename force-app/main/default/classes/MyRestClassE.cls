@RestResource(urlMapping = '/MyRestClassE/*')
global class MyRestClassE {
    @httpGet
    global static void getMethod(){
        RestRequest req = RestContext.request;
        string url = req.requestURI;
        string urlid = url.substring(url.lastIndexOf('/')+1);
        list<contact> conlist = new list<contact>();
        conlist =[SELECT Id,Name,Department,AccountId,Email FROM Contact where Email !=null];
        list<contactWrap> conwrapperlist = new list<contactWrap>();
        for(contact con : conlist)
        { 
            contactWrap c = new contactWrap();
            c.recordId = con.Id; 
            c.Fullname = con.Name; 
            c.Email = con.Email; 
            conwrapperlist.add(c);
        }
        
        try{
            RestResponse res = RestContext.response;
            string jsonbody = JSON.serialize(conwrapperlist);
            res.responseBody = Blob.valueOf(jsonbody);
            res.statusCode = 200;
        }catch(Exception e){
        }
    }
    
    public class contactWrap{
        string recordId;
        string Fullname;
        string Email ; 
    }
    
    // Blob jasonbody = req.requestBody;
    //  string jsondata = jasonbody.toString();
    // string jasond = JSON.deserialize(jsondata);
}