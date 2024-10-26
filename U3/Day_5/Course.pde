class Course{
    String courseCode;
    String teacher;
    ArrayList<Student> students;

    Course(String c, String t){
        this.courseCode = c;
        this.teacher = t;
        this.students = new ArrayList<Student>();
    }

    void addStudent(Student s){
        this.students.add(s);
        s.addCourse( this.courseCode );
    }

    void courseInfo(){
        println(this.courseCode, "Taught by", this.teacher);
    } 
}