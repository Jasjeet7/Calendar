public with sharing class Calendar {
    public Calendar() {

    }

    @AuraEnabled(cacheable=true)
    public static List<Object> getCalendar() {
        Http http = new Http();
        HttpRequest request = new HttpRequest();
        request.setEndpoint('https://calendarific.com/api/v2/holidays?&api_key=6b582dc7107a51f6f2bb5a635accb66e7c0189f3&country=CA&year=2021');
        request.setMethod('GET');
        HttpResponse response = http.send(request);
        // If the request is successful, parse the JSON response.
        List<Object> entriesArray = new List<Object>();
        
        if (response.getStatusCode() == 200) {
            // Deserialize the JSON string into collections of primitive data types.
            Map<String, Object> results = (Map<String, Object>) JSON.deserializeUntyped(response.getBody());
            //System.debug(results);
            Map<String, Object> holidays = (Map<String, Object>) results.get('response');
            entriesArray =(List<Object> ) holidays.get('holidays');

            System.debug('holidays='+holidays);
            System.debug('holidays 2='+entriesArray);
    
            for(Object inidividualEntries : entriesArray){
                    Map<String,Object> ind = (Map<String,Object> )inidividualEntries;
                    System.debug('name = '+ ind.get('name'));
                    System.debug('name = '+ ind.get('description'));
                    Map<String,Object> dateHoliday = (Map<String,Object>) ind.get('date');
                    Map<String,Object> dateHoliday2 = (Map<String,Object>) dateHoliday.get('datetime');
                    System.debug('date = '+ ind.get('date'));
                    System.debug('date = '+ dateHoliday.get('datetime'));
                    System.debug('date = '+ dateHoliday.get('iso'));
                    System.debug('---------------------------------------------');
            }
             
        }
        return entriesArray;  
    }

}
