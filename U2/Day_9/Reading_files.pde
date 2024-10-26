void setup(){
  String[] allData = loadStrings("Medal Counts.txt");
  PrintWriter pw = createWriter("Totals.txt");

  for(int i = 0; i < allData.length; i++){
    String thisRow = allData[i];
    String[] thisRowsParts = thisRow.split(",");

    String country = thisRowsParts[0];
    int goldMetals = int(thisRowsParts[1]);
    int silverMetals = int(thisRowsParts[2]);
    int bronzeMetals = int(thisRowsParts[3]);

    int total = goldMetals + silverMetals + bronzeMetals;

    pw.println(country + " has won " + total + " total number of metals so far ");
  }
  pw.close();
  exit();
}