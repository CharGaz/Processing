class Student{
    String name;
    int studentNum;
    int grade;
    String [] timeTable;
    int index;

    Student(String n, int sn, int g ){
        this.name = n;
        this.studentNum = sn;
        this.grade = g;
        this.timeTable = new String[4];
        this.index = 0;
    }



    void addCourse(String c){
        if(index <= 3){
            timeTable[ index ] = c;
            index++;
        }
    }

    void printTimeTable(){
        for(int i = 0; i <50 ; i++){
            print("*");
        }
        println("");
        println("Courses for,", this.name+":");
        println("Grade",this.grade+"; Studunt Number:",this.studentNum);
        for(int c = 0; c < index; c++){
            println(timeTable[c], "taught by ");
        }
        for(int j = 0; j <50 ; j++){
            print("*");
        }

    }



}