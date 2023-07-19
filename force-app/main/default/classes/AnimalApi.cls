Global class AnimalApi {
    public Static Void animalName(string name){
        http g = new http(); // http is protocal who take requwst and give respoanse
        HttpRequest req = new HttpRequest();
        req.setEndpoint('https://api.api-ninjas.com/v1/animals?name=');
        req.setHeader('X-Api-Key', 'h7I856WZ3z66z98mjpItcQ==nDk9YLlPmaH2cstS');
        req.setMethod('GET'); 
        
        HttpResponse res = new HttpResponse();
        res = g.send(req);
        system.debug('000000000---->' +res.getStatusCode());
        system.debug('000000000body---->' +res.getBody());
        
    }
}