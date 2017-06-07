import java.util.Scanner;
import java.io.FileNotFoundException;
import java.io.File;
import java.util.HashMap;

public class FileEdit {

    Scanner sc;
    String rawClusts = "";
    String rawProts = "";
    
    public FileEdit() {
	try {
	    sc = new Scanner (new File("cluster.csv"));
	    while(sc.hasNext()) {
		rawClusts += sc.nextLine() + "\n";
	    }
	}	
	catch (FileNotFoundException e) {
	    System.out.println("Oops");
	    System.exit(0);
	}
	try {
	    sc = new Scanner (new File("ProteinInteractionList.csv"));
	    while (sc.hasNext()) {
		rawProts += sc.nextLine() + "\n";
	    }
	}
	catch (FileNotFoundException e) {
	    System.out.println("Oops 2.0");
	    System.exit(0);
	}
	
    }

    public static String makeNew(String rawClust, String rawProt) {
	HashMap<String,String> map = new HashMap<String,String>();
	String[] clustLines, protLines;
	String[] clust,prot;
	String output = "cluster,SymbolA,SymbolB,\n";

	clustLines = rawClust.split("\n");
	protLines = rawProt.split("\n");

	for (int i = 0; i < clustLines.length; i++) {
	    clust = clustLines[i].split(",");
	    map.put(clust[2], clust[0]);
	}

	for (int i = 0; i < protLines.length; i++) {
	    
	    try{
	    prot = protLines[i].split(",");
	    if (map.get(prot[4]).equals(map.get(prot[5]))) {
		output += map.get(prot[4]) + "," + prot[4] + "," + prot[5] + ",\n";
	    }
	    }
	    catch (NullPointerException e) {
		continue;
	    }
	}
	    
	return output;
    }

    public static void main(String[] args) {
	FileEdit test = new FileEdit();
	System.out.println(makeNew(test.rawClusts, test.rawProts));
    }
    
}

	


    
