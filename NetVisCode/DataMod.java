import java.util.Scanner;
import java.io.File;
import java.io.FileNotFoundException;

public class DataMod{


    Dictionary<String,String> dict = new Hashtable();
    String ans = "";

    public DataMod(String filename){
        Scanner dictScan; // scan in a key of protein number to name
        try {
            dictScan = new Scanner( new File(cluster.csv) );
            dictScan.useDelimiter(",");
            dictScan.nextLine();
            while( dictScan.hasNextLine() ){
                dictScan.next();
                dict.put( dictScan.next(), dictScan.next() );
            }
        } catch( FileNotFoundException e ){
            System.out.println("File not found");
            System.exit(1);
        }



        Scanner interScan; // scans the interaction file
        Scanner clusterScan; // scans the cluster file

        for( int clusterNum = 1; clusterNum <= 1320; clusterNum++){
            try {
                interScan = new Scanner( new File(ProteinInteractionList.csv) );
                interScan.nextLine();
                interScan.useDelimiter(",");
                while( interScan.hasNextLine() {
                    String p1 = interScan.next();
                    boolean p1works = false;
                    String p2 = interScan.next();
                    boolean p2works = false;
                    clusterScan = new Scanner( new File(cluster.csv) );
                    clusterScan.nextLine();
                    clusterScan.useDelimiter(",");
                    while( clusterScan.hasNextLine() ){
                        if( !clusterScan.next().equals("" + clusterNum) ){
                            break;
                        }
                        
                    }
                }
            }




        }




    }


}
