package com.hsbc.expenser;

import com.google.api.client.googleapis.auth.oauth2.GoogleCredential;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.gax.core.FixedCredentialsProvider;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.auth.oauth2.ServiceAccountCredentials;
import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.EntityAnnotation;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.ImageAnnotatorSettings;
import com.google.protobuf.ByteString;
import com.google.protobuf.Descriptors.FieldDescriptor;

import java.io.BufferedReader;
import java.io.BufferedWriter;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.OutputStreamWriter;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import java.util.Map;

/**
 * A snippet for Google Cloud Vision API demonstrating how to determine what is shown on a picture.
 */

public class AnnotateImage {
	
	static String InvoiceNo;
	static String Name;
	static String Amount;
	static String Date1;
	
  public static void main(String... args) throws Exception {
    // Instantiates a client
	  GoogleCredentials credentials;
	  File credentialsPath = new File("C:/Users/Shwetha/Desktop/client_secret.json");  // TODO: update to your key path.
	  try (FileInputStream serviceAccountStream = new FileInputStream(credentialsPath)) {
	    credentials = ServiceAccountCredentials.fromStream(serviceAccountStream);
	  }
	  ImageAnnotatorSettings imageAnnotatorSettings =
			    ImageAnnotatorSettings.newBuilder()
			    .setCredentialsProvider(FixedCredentialsProvider.create(credentials))
			    .build();
    ImageAnnotatorClient vision = ImageAnnotatorClient.create(imageAnnotatorSettings);
    

    // The path to the image file to annotate
    //String fileName = "?C:\\Users\\Shwetha\\Desktop\\OLABill.png"; // for example "./resources/wakeupcat.jpg";

    // Reads the image file into memory
    Path path = Paths.get("c:\\Users\\Shwetha\\Desktop\\OLABill3.png");
    byte[] data = Files.readAllBytes(path);
    ByteString imgBytes = ByteString.copyFrom(data);

    // Builds the image annotation requests
    List<AnnotateImageRequest> requests = new ArrayList<>();
    Image img = Image.newBuilder().setContent(imgBytes).build();
    Feature feat = Feature.newBuilder().setType(Type.TEXT_DETECTION).build();
    AnnotateImageRequest request =
        AnnotateImageRequest.newBuilder().addFeatures(feat).setImage(img).build();
    requests.add(request);

    // Performs label detection on the image file
    BatchAnnotateImagesResponse response = vision.batchAnnotateImages(requests);
    List<AnnotateImageResponse> responses = response.getResponsesList();
    List<String> output1=new ArrayList<>();
    int size1=responses.size();
    String line;
    String line2="";
    int NameFlag=0;
    boolean key1;
 // Creating a File object that represents the disk file. 
    PrintStream o = new PrintStream(new File("c:\\Users\\Shwetha\\Desktop\\BillOutput1.txt")); 

    // Store current System.out before assigning a new value 
    PrintStream console = System.out; 

    // Assign o to output stream 
    System.setOut(o); 
 
    for(int i=0;i<1;i++)
    {    	
    	line=responses.get(i).getFullTextAnnotation().getText();
    	System.out.println(line);
    }
    System.setOut(console); 
    String fileName = "c:\\Users\\Shwetha\\Desktop\\BillOutput1.txt";
	File file = new File(fileName);
	FileReader fr = new FileReader(file);
	BufferedReader br = new BufferedReader(fr);
	size1=output1.size();
	int dateFlag=0;
	int AmountFlag=0;
	
	while((line = br.readLine()) != null){
	    //process the line
	    key1=line.indexOf("INVOICE") !=-1? true: false;
	    if(key1)
	    {
	    	InvoiceNo=line.substring(11);
	    	Date1=br.readLine();
	    }
	    key1=line.indexOf("OLA") !=-1? true: false;
	    if((key1)&&(NameFlag==0))
	    {
	    	Name=line.substring(3);
	    	NameFlag=1;
	    }
	    key1=line.indexOf("TOTAL FARE") !=-1? true: false;
	    if(key1)
	    {
	    	Amount=br.readLine();
	    }
	}

	System.out.println("Name: "+ Name);
	System.out.println("Invoice No: "+ InvoiceNo);
	System.out.println("Date: "+Date1);
	System.out.println("Total Fare: "+ Amount);
  }
}
