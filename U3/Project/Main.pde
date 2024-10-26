// HOW TO SETUP SIMULATION:
// COURSE: (IF THE COURSE IS HILLY OF FLAT); only one course
// TEAMS: (TEAM NAME, FLAT RATING, HILLY RATING, WINDY RATING, RAINY RATING) all rating are out of 1-10
// WEATHER:(IF IT IS RAINING, DRY, OR WINDY) put true or false for these values. No to ridiculas antics of it being rainy and dry
// they are mutaly exlusive. Only one weather 
// RACE:(DISTANCE OF RACE) 

ArrayList<Team> teams = new ArrayList<Team>();
ArrayList<Weather> weatherConditions = new ArrayList<Weather>();
ArrayList<Course> courseConditions = new ArrayList<Course>();



void setup(){
  size(800,400);
  background(0);
  Course shadesMills = new Course("HILLY"); //Please put either HILLY or FLAT; please no tomfoolery or shenanigans 
  Team t1 = new Team("Laural Heights", 7, 10, 6, 8); // No decimals!!!!!
  Team t2 = new Team("KCI", 1, 1, 1, 5); 
  Team t3 = new Team("Orangevill", 9, 9, 6, 8); 
  Weather w = new Weather(true, false, true);

  Race r = new Race(6); //Setting the race distance

 
 
  teams.add(t1);
  teams.add(t2);
  teams.add(t3);

  weatherConditions.add(w);
  courseConditions.add(shadesMills);

  shadesMills.describeCourse();
  t1.teamDescribe();
  t2.teamDescribe();
  t3.teamDescribe();
  w.weatherDescribe();

  t1.updateRatings();
  t2.updateRatings();
  t3.updateRatings();

  r.simulateRace();

}