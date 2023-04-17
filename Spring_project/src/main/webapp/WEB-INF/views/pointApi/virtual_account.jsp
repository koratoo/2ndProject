<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ page import="java.util.Base64"%>
<%@ page import="java.util.Base64.Encoder"%>
<%@ page import="java.net.HttpURLConnection"%>
<%@ page import="java.net.URL" %>
<%@ page import="org.json.simple.JSONObject" %>
<%@ page import="org.json.simple.parser.JSONParser" %>
<%@ page import="org.json.simple.parser.ParseException" %>
<%@ page import="java.io.OutputStream" %>
<%@ page import="java.io.InputStream" %>
<%@ page import="java.io.InputStreamReader" %>
<%@ page import="java.io.Reader" %>
<%@ page import="java.nio.charset.StandardCharsets" %>


<%
  String path = "http://127.0.0.1/Samples";
  String orderId = "virtualaccount-" + String.valueOf(System.currentTimeMillis());
  String amount = "";//amount -> balanceAmount
  String customerEmail = "customer@email.com";
  String customerName = "박토스";
  String orderName = "토스 가상계좌 결제";
  String bank = "국민";
  String validHours = "72";
  String virtualAccountCallbackUrl = path + "/va_callback.jsp";
  String customerMobilePhone = "01000001234";
  String useEscrow = "false";

  String type = "소득공제";
  String registrationNumber  = "01000001234";

  String secretKey = "test_ak_ZORzdMaqN3wQd5k6ygr5AkYXQGwy:";
  
  Encoder encoder = Base64.getEncoder(); 
  byte[] encodedBytes = encoder.encode(secretKey.getBytes("UTF-8"));
  String authorizations = "Basic "+ new String(encodedBytes, 0, encodedBytes.length);
  
  URL url = new URL("https://api.tosspayments.com/v1/virtual-accounts");
  
  HttpURLConnection connection = (HttpURLConnection) url.openConnection();
  connection.setRequestProperty("Authorization", authorizations);
  connection.setRequestProperty("Content-Type", "application/json");
  connection.setRequestMethod("POST");
  connection.setDoOutput(true);
  JSONObject obj = new JSONObject();
  obj.put("orderId", orderId);
  obj.put("amount", amount);
  obj.put("customerEmail", customerEmail);
  obj.put("customerName", customerName);
  obj.put("orderName", orderName);
  obj.put("bank", bank);
  obj.put("validHours", validHours);
  obj.put("virtualAccountCallbackUrl", virtualAccountCallbackUrl);
  obj.put("customerMobilePhone", customerMobilePhone);
  obj.put("useEscrow", useEscrow);

  JSONObject cashReceipt = new JSONObject();
  cashReceipt.put("type", type);
  cashReceipt.put("registrationNumber", registrationNumber);

  obj.put("cashReceipt", cashReceipt);
  
  OutputStream outputStream = connection.getOutputStream();
  outputStream.write(obj.toString().getBytes("UTF-8"));
  
  int code = connection.getResponseCode();
  boolean isSuccess = code == 200 ? true : false;
  
  InputStream responseStream = isSuccess? connection.getInputStream(): connection.getErrorStream();
  
  Reader reader = new InputStreamReader(responseStream, StandardCharsets.UTF_8);
  JSONParser parser = new JSONParser();
  JSONObject jsonObject = (JSONObject) parser.parse(reader);
  responseStream.close();
%>

<!DOCTYPE html>
<html lang="ko">
<head>
    <title>결제 성공</title>
    <meta http-equiv="x-ua-compatible" content="ie=edge"/>
    <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no"/>
    <style>
    tr,td{
    margin : 0 10px;
    border : 1px solid black;
    width : 140px;
    height : 60px;
    font-size:12px;
    }
    </style>
</head>
<body>
<section>
    <%
    if (isSuccess) { %>
        <h1>결제 성공</h1>
        
        
        <table style="border: 1px solid black;">
        	<tr>
        		<td> 결제 정보</td>
        		<td ><%= jsonObject.get("orderName") %></td>
        	</tr>
        	<tr>
        		<td> 결제 금액 </td>
        		<td > <%= jsonObject.get("balanceAmount") %></td>
        	</tr>
        	<tr>
        		<td> 계좌 번호 </td>
        		<td><%= ((JSONObject)jsonObject.get("virtualAccount")).get("accountNumber") %></td>
        	</tr>
        	<tr>
        		<td> 결제 은행 </td>
        		<td > <%= ((JSONObject)jsonObject.get("virtualAccount")).get("bank") %></td>
        	</tr>
        </table>
        
     
        
       
    <%} else { %>
        <h1>결제 실패</h1>
        <p><%= jsonObject.get("message") %></p>
        <span>에러코드: <%= jsonObject.get("code") %></span>
        <%
    }
    %>

</section>
</body>
</html>