import java.util.Scanner;
import java.io.FileNotFoundException;
import java.io.File;

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
	 String[] clustLines, protLines;
	 String[] clust, prot;
	
	String output = "cluster,geneID,SymbolA,SymbolB\n";
	
        clustLines = rawClust.split("\n");
	protLines = rawProt.split("\n");

	for (int i = 1; i < clustLines.length; i++) {
	    clust = clustLines[i].split(",");
	    for (int j = 1; j < protLines.length; j++) {
		prot = protLines[j].split(",");
		if (prot[4].equals(clust[2])) {
		    output += clust[0] + "," + clust[1] + "," + clust[2] + "," + prot[5] + "," + "\n";
		}
	    }
	}
	return output;
    }

    public static void main(String[] args) {
	FileEdit test = new FileEdit();
	System.out.println(makeNew(test.rawClusts, test.rawProts));
    }
    
}

	


    
