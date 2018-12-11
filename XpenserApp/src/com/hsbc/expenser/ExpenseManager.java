package com.hsbc.expenser;

import java.io.BufferedReader;
import java.io.File;
import java.io.FileInputStream;
import java.io.FileReader;
import java.io.IOException;
import java.io.PrintStream;
import java.io.PrintWriter;
import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import com.google.api.gax.core.FixedCredentialsProvider;
import com.google.auth.oauth2.GoogleCredentials;
import com.google.auth.oauth2.ServiceAccountCredentials;
import com.google.cloud.vision.v1.AnnotateImageRequest;
import com.google.cloud.vision.v1.AnnotateImageResponse;
import com.google.cloud.vision.v1.BatchAnnotateImagesResponse;
import com.google.cloud.vision.v1.Feature;
import com.google.cloud.vision.v1.Image;
import com.google.cloud.vision.v1.ImageAnnotatorClient;
import com.google.cloud.vision.v1.ImageAnnotatorSettings;
import com.google.cloud.vision.v1.Feature.Type;
import com.google.protobuf.ByteString;

/**
 * Servlet implementation class ExpenseManager
 */

public class ExpenseManager extends HttpServlet {
	private static final long serialVersionUID = 1L;
	static String InvoiceNo;
	static String Name;
	static String Amount;
	static String Date1;
    /**
     * Default constructor. 
     */
    public ExpenseManager() {
        // TODO Auto-generated constructor stub
    }

    
    public static void imageGet(String path1) throws Exception
    {
    	GoogleCredentials credentials;
  	  File credentialsPath = new File("C://Users/Abhishek/Desktop/Codegrind/api_kry.json");  // TODO: update to your key path.
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
      Path path = Paths.get(path1);
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
      PrintStream o = new PrintStream(new File("C://Users/Abhishek/Desktop/Codegrind/BillOutput1.txt")); 

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
      String fileName = "C://Users/Abhishek/Desktop/Codegrind/BillOutput1.txt";
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
	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		
		String upload=request.getParameter("name");
		System.out.println(upload);
		String upload2=null;
		if(upload.equals("upload"))
		{
			System.out.println("testnull");
			upload2=request.getParameter("img");
		}
		System.out.println(upload2);
		//String img =request.getParameter(upload2);
		String sp[]=upload2.split("O");
		String img=sp[1];		
		String imgpath="C://images/"+"O"+img;
		System.out.println(imgpath);
		try {
			imageGet(imgpath);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("name", "test");
		request.setAttribute("Invoice", InvoiceNo);
		request.setAttribute("Date", Date1);
		request.setAttribute("Amount",Amount);
		//System.out.println("reqres");
		
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println(Name+","+InvoiceNo+","+Date1+","+Amount);
		//request.getRequestDispatcher("/user.jsp").forward(request, response);
		
		response.getWriter().append("Served at: ").append(request.getContextPath());
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		// TODO Auto-generated method stub
		//String Type = request.getParameter("Expensetype1");
		//String MerName = request.getParameter("Merchantname1");
		//String InvNum = request.getParameter("invoice1");
		//String Amt =request.getParameter("amount1");
		
		String upload=request.getParameter("name");
		System.out.println(upload);
		String upload2=null;
		if(upload.equals("upload"))
		{
			System.out.println("testnull");
			upload2=request.getParameter("img");
		}
		System.out.println(upload2);
		//String img =request.getParameter(upload2);
		String sp[]=upload2.split("O");
		String img=sp[1];		
		String imgpath="C://images/"+"O"+img;
		System.out.println(imgpath);
		try {
			imageGet(imgpath);
		} catch (Exception e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
		
		request.setAttribute("name", "test");
		request.setAttribute("Invoice", InvoiceNo);
		request.setAttribute("Date", Date1);
		request.setAttribute("Amount",Amount);
		System.out.println("reqres");
		request.getRequestDispatcher("/user.jsp").forward(request, response);
	}

}
