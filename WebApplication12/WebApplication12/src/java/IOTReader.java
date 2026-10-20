/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

/**
 *
 * @author Asvperumal
 */


import block.Block;
import block.Transaction;
import dataset.AesEncryption;
import java.io.BufferedReader;
import java.io.FileReader;
import java.io.FileWriter;
import java.io.IOException;
import java.io.InputStreamReader;
import java.math.BigInteger;
import java.net.URL;
import java.net.URLConnection;
import java.nio.charset.StandardCharsets;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.time.Instant;
import java.time.temporal.ChronoUnit;
import java.util.Arrays;
import java.util.Date;
import java.util.Iterator;
import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;
import javax.servlet.RequestDispatcher;
import javax.servlet.http.HttpSession;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;
import org.json.simple.parser.JSONParser;

public class IOTReader {

    public static void main(String args[]) {

        readJson();
    }

    public static void readJson() {
        JSONParser parser = new JSONParser();
        String Str = "";
        try {
            URL oracle = new URL("https://api.thingspeak.com/channels/3465405/feeds.json?api_key=6D6P88VG5YA34G7I&results=1"); // URL to Parse
            URLConnection yc = oracle.openConnection();
            BufferedReader in = new BufferedReader(new InputStreamReader(yc.getInputStream()));

            String inputLine;
            while ((inputLine = in.readLine()) != null) {
                System.out.println(inputLine);

                JSONObject json = (JSONObject) parser.parse(inputLine);

                JSONArray characters = (JSONArray) json.get("feeds");
                Iterator i = characters.iterator();

                System.out.println("characters: ");
                if (i.hasNext()) {

                    Str = "" + i.next() + "";

                }
            }
            System.out.println(" " + Str + "  " + Str.length());
            
            
            
           
           
            String[] g = Str.split(",");

          
            String s0 = g[1].substring(14, 34);// DATE
            System.out.println("Created by:\" :" + s0);
             String s1 = g[0].substring(11, 12);//,"field1":"TEMPERATURE",
            System.out.println("field1\\\":\\\"Dr.M.Sudha\\\"" + s1);
               String s2 = g[4].substring(10, 11);//"field3":"PETROL",
            System.out.println("\"field2\":\"Dr.B.Vinodhini\"  : " + s2);
                String s3 = g[2].substring(10, 11);//"field2":"HUMIDITY",
            System.out.println("\"field3\":\"R.Nirmala\" : " + s3);
            java.util.Date st11 = new java.util.Date();
            // Formatting date into  yyyy-MM-dd HH:mm:ss e.g 2008-10-10 11:21:10

            SimpleDateFormat formatter = new SimpleDateFormat("dd-M-yyyy");
            String f = formatter.format(st11);
            System.out.println("Formatted date is ==>" + f);
            Instant updatedInstant;
//Instant currentInstant = Instant.parse("2024-03-30T23:50:21Z");
            Instant currentInstant = Instant.parse(s0);
            updatedInstant = currentInstant.plus(5, ChronoUnit.HOURS);
            System.out.println(" The date after adding hours is : " + updatedInstant);
            updatedInstant = updatedInstant.plus(30, ChronoUnit.MINUTES);
            System.out.println(" The date after adding hours is : " + updatedInstant);
//updatedInstant = currentInstant.minusSeconds(300);
//updatedInstant = currentInstant.minusMillis(8000);
//updatedInstant = currentInstant.minusNanos(600000);

            String input = updatedInstant.toString().replace("T", " ").replace("Z", "");
            //Date/time pattern of input date
            DateFormat df = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss");
            //Date/time pattern of desired output date
            DateFormat outputformat = new SimpleDateFormat("yyyy-MM-dd hh:mm:ss aa");
            Date date = null;
            String output = null;
            try {
                //Conversion of input String to date
                date = df.parse(input);
                //old date format to new date format
                output = outputformat.format(date);
                System.out.println(output);
            } catch (Exception pe) {
                pe.printStackTrace();
            }
            try {AesEncryption aes=new AesEncryption();
                String url = "jdbc:mysql://localhost:3306/student_db";
                Class.forName("com.mysql.jdbc.Driver");
                Connection con = DriverManager.getConnection(url, "root", "root");
                PreparedStatement ps;
                Statement st = con.createStatement();
                Statement st1 = con.createStatement();
                Statement st2 = con.createStatement();
                Statement st3 = con.createStatement();
                SimpleDateFormat sdf;

                sdf = new SimpleDateFormat("ddmmyyyy");
                String a11 = sdf.format(date);

             
               int oid=0,flag=0;
      ResultSet rs1 = st.executeQuery("select * from iot_history where dates='"+output+"'");
	if (rs1.next()) 
        {
         flag=1;
        }
        if(flag==1){
            
        }else{
           ResultSet rs = st.executeQuery("select max(oid) from iot_history ");
	if (rs.next()) 
        {
         oid=Integer.parseInt(rs.getString(1))+1;
        }
           String name ="user", uid = "100000";
                double rate=10.0;
                double total = 0.0;
            int randomInt = 0;
                Random randomGenerator = new Random();
                for (int idx = 1000000; idx <= 100; ++idx) {
                    randomInt = randomGenerator.nextInt(1000000000);

                }
             //   total=Integer.parseInt(s1)*rate;
                   Transaction transaction1 = new Transaction(name, "0", 100000000000000000L);
             Transaction transaction2 = new Transaction(name, s1, 10000000000000L);


        Block firstBlock = new Block(0, Arrays.asList(transaction1, transaction2));
        int has=firstBlock.hashCode()+randomInt;
        String hass=has+"";
  
              int hash=randomInt+firstBlock.hashCode()+randomInt;
        String hashs=hash+"";
            
              int sts1=st1.executeUpdate("insert into iot_history values('"+oid+"','"+toHexString(getSHA(hass))+"','"+toHexString(getSHA(hashs))+"','"+s1+"','"+s2+"','"+s3+"','"+output+"')");
      sts1=st1.executeUpdate("update iot set field1='"+s1+"',field2='"+s2+"',field3='"+s3+"',dates='"+output+"'where oid='1'");
      sts1=st1.executeUpdate("update staff set status='"+s1+"'where staffid='S1'");
sts1=st1.executeUpdate("update staff set status='"+s2+"'where staffid='S2'");
sts1=st1.executeUpdate("update staff set status='"+s3+"'where staffid='S3'");
        }
              
            } catch (Exception e) {
                e.printStackTrace();
            }
        } catch (Exception ex) {
            ex.printStackTrace();
        }
        try {
            Thread.sleep(60000);
            readJson();
        } catch (InterruptedException ex) {
            Logger.getLogger(IOTReader.class.getName()).log(Level.SEVERE, null, ex);
        }
    }

    public static void send(String sa, String msg, String msg1) {
        //Get properties object   
        final String username = "karpalagar@gmail.com";
        final String password = "aguz yqyh xskg eytv";
        Properties props = new Properties();
        props.put("mail.smtp.host", "smtp.gmail.com");
        props.put("mail.smtp.socketFactory.port", "465");
        props.put("mail.smtp.socketFactory.class",
                "javax.net.ssl.SSLSocketFactory");
        props.put("mail.smtp.auth", "true");
        props.put("mail.smtp.port", "465");
        //get Session   
        Session session = Session.getDefaultInstance(props,
                new javax.mail.Authenticator() {
                    protected PasswordAuthentication getPasswordAuthentication() {
                        return new PasswordAuthentication(username, password);
                    }
                });
        //compose message    
        try {
            MimeMessage message = new MimeMessage(session);
            message.addRecipient(Message.RecipientType.TO, new InternetAddress(sa));
            message.setSubject(msg);
            message.setText(msg1);
            //send message  
            Transport.send(message);
            System.out.println("message sent successfully");
        } catch (MessagingException e) {
            throw new RuntimeException(e);
        }

    }public static byte[] getSHA(String input) throws NoSuchAlgorithmException
	{
		// Static getInstance method is called with hashing SHA
		MessageDigest md = MessageDigest.getInstance("SHA-256");

		// digest() method called
		// to calculate message digest of an input
		// and return array of byte
		return md.digest(input.getBytes(StandardCharsets.UTF_8));
	}
	
	public static String toHexString(byte[] hash)
	{
		// Convert byte array into signum representation
		BigInteger number = new BigInteger(1, hash);

		// Convert message digest into hex value
		StringBuilder hexString = new StringBuilder(number.toString(16));

		// Pad with leading zeros
		while (hexString.length() < 64)
		{
			hexString.insert(0, '0');
		}

		return hexString.toString();
	}

}


