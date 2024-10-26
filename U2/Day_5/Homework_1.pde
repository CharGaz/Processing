float price;
float total;
 
void setup(){
    while(price < 100){
        price += 0.5;
        total =  price + total;
    }

    println(total,"$");

    exit();
}