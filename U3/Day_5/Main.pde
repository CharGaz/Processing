void setup(){
  Student jameLi = new Student("Jameli", 23, 12);
  Student vidul = new Student("vidul", 1, 11);
  Student ethanXing = new Student("EthanXing", 1928, 2);
  
  

  Course physics = new Course("Physics", "Jeffery Zang");
  Course english = new Course("English", "Jeffery Zang");
  Course math = new Course("Math", "Jeffery Zang");
  Course cs = new Course("CS", "Jeffery Zang");
  

  physics.addStudent(jameLi);
  english.addStudent(jameLi);
  math.addStudent(jameLi);
  cs.addStudent(jameLi);
  

  jameLi.printTimeTable();

  exit();

  
}