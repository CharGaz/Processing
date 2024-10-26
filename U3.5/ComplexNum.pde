class ComplexNum{
    float real;
    float imaginary;

    ComplexNum(float r, float i){
        this.real = r;
        this.imaginary = i;
    }

    void printMe(){
        if(this.imaginary > 0){
            println(this.real + " + " + this.imaginary + "i");
        }
        else{
            println(this.real + " - " + this.imaginary*-1 + "i");
        }
    }

    float absoluteValue(){
        float absVal = sqrt(pow(this.real,2)+pow(this.imaginary,2));
        return(absVal);
    }

    ComplexNum add(ComplexNum d){
        float real = this.real + d.real;
        float imaginary = this.imaginary + d.imaginary;
        
        return(new ComplexNum(real, imaginary));
    }

    ComplexNum times(ComplexNum num) {
        float answerReal = (this.real*num.real) - (this.imaginary*num.imaginary);
        float answerImaginary = (this.real*num.imaginary) +(this.imaginary*num.real);
        ComplexNum answer = new ComplexNum(answerReal,answerImaginary);
        return(answer);
    }
}
