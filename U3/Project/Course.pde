class Course{
    String elevation;

    //CONSTRUCTOR:
    Course(String e){
        this.elevation = e;
    }

    //MEATHODS:
    void describeCourse(){
        println("THE COURSE IS", this.elevation); //not much to show here, just printing the elevation of the course
    }
}