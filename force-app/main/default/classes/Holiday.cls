public class Holiday {
	public String name;
    public String description;
    //Map<id, String> country;
    
    public class CountryH{
        Id id;
		String name;
    }
    public class DateHoliday{
        String iso;
        Map<String, Integer> datetimeH;
    }
    
    public CountryH country;
    public DateHoliday dateH;
    //List<String> type;
    String locations;
    String states;
}