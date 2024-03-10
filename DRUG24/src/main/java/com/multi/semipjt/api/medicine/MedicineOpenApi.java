package com.multi.semipjt.api.medicine;

import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.HashMap;
import java.util.Iterator;
import java.util.List;
import java.util.Map;
import java.util.Random;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class MedicineOpenApi {
	public static Connection conn = null;
	public static PreparedStatement pstmt = null; // ★★★★★
	public static ResultSet rs = null;
	
	public static String driverClass = "com.mysql.cj.jdbc.Driver";
	public static String url = "jdbc:mysql://localhost:3306/drug";  //drug <- db이름
	public static String user = "user";
	public static String password = "1234";
	
	public static final String KEY = "=QRde7O0zENfHCVsmkGqb6YvtADsDS5Ya7AQXR8Td1%2FLmdnVKo7cSx66kb9JtRvTmoIslxxvjeE6hZ7tSbzwMAA%3D%3D";
    public static final String DUR1_INFO_XML_URL = "http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList"; 				// 전체 데이터 - 4699개
    public static final String DUR2_INFO_XML_URL = "https://apis.data.go.kr/1471000/DURPrdlstInfoService03/getUsjntTabooInfoList03"; 		// 병용 금기 - 30975 페이지 
    public static final String DUR3_INFO_XML_URL = "https://apis.data.go.kr/1471000/DURPrdlstInfoService03/getOdsnAtentInfoList03"; 		// 노인 금기 - 227 페이지
    public static final String DUR4_INFO_XML_URL = "https://apis.data.go.kr/1471000/DURPrdlstInfoService03/getPwnmTabooInfoList03"; 		// 임부 금기 - 1705 페이지
    public static final String DUR5_INFO_XML_URL = "https://apis.data.go.kr/1471000/DURPrdlstInfoService03/getMdctnPdAtentInfoList03"; 		// 투여기간주의 - 74 페이지 (파싱X)
    public static final String DUR6_INFO_XML_URL = "https://apis.data.go.kr/1471000/DURPrdlstInfoService03/getCpctyAtentInfoList03"; 		// 용량주의 -  745 페이지
    public static final String DUR7_INFO_XML_URL = "https://apis.data.go.kr/1471000/DURPrdlstInfoService03/getSpcifyAgrdeTabooInfoList03"; 	// 연령 금기 -  290 페이지
    
	public static final int DUR1_AMMOUNT = (int) Math.ceil(469 / 10) + 1;
	public static final int DUR2_AMMOUNT = (int) Math.ceil(500 / 10) + 1; //다하면 너무많아서 줄임 (원래 30975페이지)
	public static final int DUR3_AMMOUNT = (int) Math.ceil(227 / 10) + 1;
	public static final int DUR4_AMMOUNT = (int) Math.ceil(500 / 10) + 1; //다하면 너무많아서 줄임 (원래 1705페이지)
	public static final int DUR5_AMMOUNT = (int) Math.ceil(74 / 10) + 1;
	public static final int DUR6_AMMOUNT = (int) Math.ceil(500 / 10) + 1; //다하면 너무많아서 줄임 (원래 745페이지)
	public static final int DUR7_AMMOUNT = (int) Math.ceil(290 / 10) + 1;

    
    public static void main(String[] args) {
    	Map<Integer, Medicine> map = new HashMap<>();
    	List<Medicine> allList = new ArrayList<Medicine>();
    	for(int i = 1; i < DUR1_AMMOUNT; i++) {
    		List<Medicine> list = parseStep1(i); 
    		if(list.size() == 0) {
    			break;
    		}
    		allList.addAll(list);
    	}
    	System.out.println("1차 파싱 완료! 결과 : " + allList.size() +"개");
    	System.out.println("--------------------------------------------------------------------\n");
    	
    	// print
//    	for(Medicine m : allList) {
//    		System.out.println(m);
//    	}
    	
    	for(Medicine m : allList) {
    		map.put(m.getdNO(), m);
    	}
    	
    	//step2 - getUsjntTabooInfoList03 업데이트 병용금기
    	int updateStep2Count = 0;
    	for(int i = 1; i < DUR2_AMMOUNT; i++) {
    		updateStep2Count += parseStep2(i, map); 
    	}
    	System.out.println("2차 파싱 완료! 결과 : " + updateStep2Count);
    	System.out.println("--------------------------------------------------------------------\n");
    	
    	
    	//step3 - getOdsnAtentInfoList03 업데이트 노인금기
    	int updateStep3Count = 0;
    	for(int i = 1; i < DUR3_AMMOUNT; i++) {
    		updateStep3Count += parseStep3(i, map); 
    	}
    	System.out.println("3차 파싱 완료! 결과 : " + updateStep3Count);
    	System.out.println("--------------------------------------------------------------------\n");
    	
    	//step4 - getPwnmTabooInfoList03 업데이트 임부금기
    	int updateStep4Count = 0;
    	for(int i = 1; i < DUR4_AMMOUNT; i++) {
    		updateStep4Count += parseStep4(i, map); 
    	}
    	System.out.println("4차 파싱 완료! 결과 : " + updateStep4Count);
    	System.out.println("--------------------------------------------------------------------\n");
    	
    	//step6 - getCpctyAtentInfoList03 업데이트 용량주의 (step5생략)
    	int updateStep6Count = 0;
    	for(int i = 1; i < DUR6_AMMOUNT; i++) {
    		updateStep6Count += parseStep6(i, map); 
    	}
    	System.out.println("6차 파싱 완료! 결과 : " + updateStep6Count);
    	System.out.println("--------------------------------------------------------------------\n");
    	
    	//step7 - getPwnmTabooInfoList03 업데이트 임부금기
    	int updateStep7Count = 0;
    	for(int i = 1; i < DUR7_AMMOUNT; i++) {
    		updateStep7Count += parseStep7(i, map); 
    	}
    	System.out.println("7차 파싱 완료! 결과 : " + updateStep7Count);
    	System.out.println("--------------------------------------------------------------------\n");
    	
    	//map.forEach((k,v)-> System.out.println("key: " + k + ", value1:" + v.d1TYPE + "\t value2:" + v.d2TYPE + "\t value3:" + v.d3TYPE + "\t value4:" + v.d4TYPE + "\t value5:" + v.d5TYPE));

    	// insert 
		try {
			Class.forName(driverClass);
			conn = DriverManager.getConnection(url, user, password);
			conn.setAutoCommit(false);
		} catch (Exception e) {
			e.printStackTrace();
		}
		
		int countSuccess = 0;
		int countFail = 0;
		Iterator<Integer> keys = map.keySet().iterator();
		while (keys.hasNext()) {
		    Integer key = keys.next();
		    try {
				if(insert(map.get(key))==0) {
					countSuccess++;
				} else {
					countFail++;
				}
			} catch (SQLException e) {
				e.printStackTrace();
			}
		}
		
		try {
			System.out.println("insert 성공: " + countSuccess + "개, 실패: " + countFail +"개");
			conn.commit();
		} catch (SQLException e) {
			e.printStackTrace();
		}
    }
    
	
//    public static void main2(String[] args) throws IOException {
//    	
//        
//        Medicine med = new Medicine();
//        ArrayList<HashMap<String, Medicine>> list = new ArrayList<>();
//        
//    	Random random = new Random();
//    	String tempDate;
//    	String[] splitDate;
//    	
//		int dNO = 0;
//		String dNAME = new String();
//		String dCOMPANY = new String();
//		int price = 0;      
//    	String 	dEFFECT = new String();;     
//    	String 	dUSAGE = new String();;      
//    	String 	dWARNC = new String();;      
//    	String 	dWARN = new String();;       
//    	String 	dintERACTION = new String();;
//    	String 	dNEGATIVE = new String();;   
//    	String 	dSAVE = new String();;       
//    	String 	dIMGURL = new String();;     
//    	String 	d1TYPE = new String();;      
//    	String 	d1PROHBT = new String();;    
//    	String 	d2TYPE = new String();;      
//    	String 	d2PROHBT = new String();;    
//    	String 	d3TYPE = new String();;      
//    	String 	d3PROHBTv = new String();;    
//    	String 	d4TYPE = new String();;      
//    	String 	d4PROHBT = new String();;    
//    	String 	d5TYPE = new String();;      
//    	String 	d5PROHBT = new String();;    
//    	Calendar CREATE_DATE = Calendar.getInstance();
//    	Calendar MODIFY_DATE = Calendar.getInstance();
//    	String 	status = new String();;      
//    	String 	dOTC_CODE = new String();;
//    	
//		try {
//			Class.forName(driverClass);
//			conn = DriverManager.getConnection(url, user, password);
//			conn.setAutoCommit(false);
//		} catch (Exception e) {
//			e.printStackTrace();
//		}
//		
//    	
//    	try {
////    		for(int i = 0; i < 471; i++) {
//			for(int i = 0; i < 5; i++) {
//		        StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList"); /*URL*/
//		        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + "=sHpLWgiDMLTAM872BhYNCvIMekwE38WDEWlRi14j7FuNOn7oRMkfFoVCne1d7TmSS3G1KtCBCq2wOjpbmkNNyzA3D3D"); /*Service Key*/
//		        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(String.valueOf(i+1), "UTF-8")); /*페이지번호*/
//		        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("10", "UTF-8")); /*한 페이지 결과 수*/
//
//		        URL url = new URL(urlBuilder.toString());
//		        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
//		        conn.setRequestMethod("GET");
//		        conn.setRequestProperty("Content-type", "application/json");
//		        if(conn.getResponseCode() < 200 || conn.getResponseCode() >=300) {
//		        	System.out.println("페이지를 찾을수 없습니다.");
//		        	return;
//		        }
//		        
//		
//		        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
//		        DocumentBuilder db = dbf.newDocumentBuilder();
//		        Document doc = db.parse(conn.getInputStream());
//		        doc.normalizeDocument();
//        
//		        try {
//		        	System.out.println("현재 페이지 : " + doc.getElementsByTagName("pageNo").item(0).getTextContent());
//		        } catch(Exception e) {}
//		        try {
//		        	
//		        } catch(Exception e) {}
//		        
//		        for(int j = 0; j < 10; j++) {
//			        try {
//			        	HashMap<String, Medicine> medMap = new HashMap<>();
//			        	String[] medStat = new String[] {"일반의약품","전문의약품"};
//			        	try {
//			        		dNO = Integer.parseInt(doc.getElementsByTagName("itemSeq").item(j).getTextContent());
//			        	}catch(Exception e) {}
//			        	try {
//			        		dNAME = doc.getElementsByTagName("itemName").item(j).getTextContent();
//			        	}catch(Exception e) {}
//			        	try {
//			        		dCOMPANY = doc.getElementsByTagName("entpName").item(j).getTextContent();
//			        	}catch(Exception e) {}
//			        		price = random.nextInt(100) * 300 + 1000;
//			        	try {
//			        		dEFFECT = doc.getElementsByTagName("efcyQesitm").item(j).getTextContent();
//			        	}catch(Exception e) {}
//			        	try {
//			        		dUSAGE = doc.getElementsByTagName("useMethodQesitm").item(j).getTextContent();
//			        	}catch(Exception e) {}
//			        	try {
//			        		dWARNC = doc.getElementsByTagName("atpnWarnQesitm").item(j).getTextContent();
//			        	}catch(Exception e) {}
//			        	try {
//			        		dWARN = doc.getElementsByTagName("atpnQesitm").item(j).getTextContent();
//			        	}catch(Exception e) {}
//			        	try {
//			        		dintERACTION = doc.getElementsByTagName("intrcQesitm").item(j).getTextContent();
//			        	}catch(Exception e) {}
//			        	try {
//			        		dNEGATIVE= doc.getElementsByTagName("seQesitm").item(j).getTextContent();
//			        	}catch(Exception e) {}
//			        	try {
//			        		dSAVE = doc.getElementsByTagName("depositMethodQesitm").item(j).getTextContent();
//			        	}catch(Exception e) {}
//			        	try {
//			        		dIMGURL = doc.getElementsByTagName("itemImage").item(j).getTextContent();
//			        	}catch(Exception e) {}
//			        		status  = medStat[random.nextInt(2)];
//			        	System.out.println("데이터삽입 품목번호: " + dNO +", 제품이름: " + dNAME +", 회사이름: " + dCOMPANY);
//			        	
//			        	try {
//				        	tempDate = doc.getElementsByTagName("openDe").item(j).getTextContent();
//				        	tempDate = tempDate.substring(0, 10);
//				        	splitDate = tempDate.split("-");
//				        	CREATE_DATE.set(Integer.parseInt(splitDate[0]), Integer.parseInt(splitDate[1]), Integer.parseInt(splitDate[2]));
//	
//				        	tempDate = doc.getElementsByTagName("updateDe").item(j).getTextContent();
//				        	tempDate = tempDate.substring(0, 10);
//				        	splitDate = tempDate.split("-");
//				        	MODIFY_DATE.set(Integer.parseInt(splitDate[0]), Integer.parseInt(splitDate[1]), Integer.parseInt(splitDate[2]));
//			        	}catch(Exception e) {
//			        		e.printStackTrace();
//			        	}
    
//  med.setCREATE_DATE(CREATE_DATE.getTime());
//	med.setMODIFY_DATE(MODIFY_DATE.getTime());
//			        	
//			        	try {
//							med.setdNO(dNO);			
//							med.setdNAME(dNAME);
//							med.setdCOMPANY(dCOMPANY);
//							med.setPrice(price);
//							med.setdEFFECT(dEFFECT);
//							med.setdUSAGE(dUSAGE);
//							med.setdWARNC(dWARNC);
//							med.setdWARN(dWARN);
//							med.setDintERACTION(dintERACTION);
//							med.setdNEGATIVE(dNEGATIVE);
//							med.setdSAVE(dSAVE);
//							med.setdIMGURL(dIMGURL);
//							med.setCREATE_DATE(CREATE_DATE.getTime());
//							med.setMODIFY_DATE(MODIFY_DATE.getTime());
//							med.setdOTC_CODE(status);
//			        	}catch(Exception e) {}
//			        		System.out.println("-------------------------------------------------");
//			        		System.out.println("dbg7 넣기전: " + med.toString() + "\nkey,value=(" + Integer.toString(dNO) + med +")");
//			        		System.out.println("-------------------------------------------------");
//			        		
//			        		medMap.put(Integer.toString(dNO), med);
//			        		list.add(medMap);
//
//			        } catch(Exception e) {}
//		        }
//		        conn.disconnect();
//	        }   		
//    		
//    	} catch(Exception e) {
//    		
//    	}
//    	System.out.println("dbg8: 한번에출력");
//    	list.forEach(map ->System.out.println(map));
//    	for (String key : medMap.keySet()) {
//    	    System.out.println(medMap.get(key).toString());
//    	}
    	
    	
//    	System.out.println("---------------------------------------------------------------");
//    	System.out.println("dbg1 : DUR정보 삽입 시작");
//    	System.out.println("dbg1 : 노인금기 파싱중... (1/5)");
//    	medMap = new HashMap<String, Medicine>(OldInfoByXML(medMap)); //노인금기
//    	System.out.println("dbg1 : 임부금기 파싱중... (2/5)");
//    	medMap = PregInfoByXML(medMap); //임부 금기
//    	System.out.println("dbg1 : 용량금기 파싱중... (3/5)");
//    	medMap = CpatentInfoByXML(medMap); //용량주의
//    	System.out.println("dbg1 : 병용금기 파싱중... (4/5)");
//    	medMap = conbinedInfoByXML(medMap); //병용금기
//    	System.out.println("dbg1 : 연령금기 파싱중... (5/5)");
//    	medMap = AgeInfoByXML(medMap);//연령금기
    	
//    	System.out.println("---------------------------------------------------------------");
//    	System.out.println("임시 MAP 출력1");
//    	medMap.forEach((key, value) -> {	
//    		System.out.println("dbg1: " + key + " : " + value);	
//    	});	
    	
//    	Iterator<String> keys = medMap.keySet().iterator();
//    	while(keys.hasNext()) {
//            String key = keys.next();
//            try {
//				insert(medMap.get(key));
//			} catch (SQLException e) {
//				e.printStackTrace();
//			}
//        }
//    }
    
    
    
	public static List<Medicine> parseStep1(int page) {
		List<Medicine> list = new ArrayList<>();
		Random random = new Random();
		String tempDate;
		String[] splitDate;
    	
		try {
	        StringBuilder urlBuilder = new StringBuilder(DUR1_INFO_XML_URL); /*URL*/
	        urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + KEY); /*Service Key*/
	        urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(""+page, "UTF-8")); /*페이지번호*/
	        urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
	
	        //System.out.println("parseStep1 request URL : " + urlBuilder.toString());
	        
	        URL url = new URL(urlBuilder.toString());
	        HttpURLConnection conn = (HttpURLConnection) url.openConnection();
	        conn.setRequestMethod("GET");
	        conn.setRequestProperty("Content-type", "application/json");
	        if(conn.getResponseCode() < 200 || conn.getResponseCode() >=300) {
	        	System.out.println("페이지를 찾을수 없습니다.");
	        	return list;
	        }
			        
	        DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
	        DocumentBuilder db = dbf.newDocumentBuilder();
	        Document doc = db.parse(conn.getInputStream());
	        doc.normalizeDocument();
	        System.out.println("현재 페이지 : " + doc.getElementsByTagName("pageNo").item(0).getTextContent());
	        
	        NodeList nList = doc.getElementsByTagName("item");
	        
	        for (int i = 0; i < nList.getLength(); i++) {
	        	Node node = nList.item(i);
//	        	System.out.println("\nCurrent Element : " + node.getNodeName());
	        	if (node.getNodeType() == Node.ELEMENT_NODE) {
					try {
						Element eElement = (Element) node;
		        		int dNO = getIntData(eElement, "itemSeq"); // itemSeq
		        		String dNAME = getStrData(eElement, "itemName");
						String dCOMPANY = getStrData(eElement, "entpName");
		        		int price = (100 + new Random().nextInt(100)) * 200;
						String dEFFECT = getStrData(eElement, "efcyQesitm");
						if(dEFFECT.length() != 0) {
							dEFFECT = dEFFECT.substring(5, dEFFECT.length() - 8);
						}
						String dUSAGE = getStrData(eElement, "useMethodQesitm");
						String dWARNC = getStrData(eElement, "atpnWarnQesitm");
						String dWARN = getStrData(eElement, "atpnQesitm");
						String dintERACTION = getStrData(eElement, "intrcQesitm");
						String dNEGATIVE = getStrData(eElement, "seQesitm");
						String dSAVE = getStrData(eElement, "depositMethodQesitm");
						String dIMGURL = getStrData(eElement, "itemImage");
						String[] medStat = new String[] {"일반의약품","전문의약품"};
				    	Calendar CREATE_DATE = Calendar.getInstance();
				    	Calendar MODIFY_DATE = Calendar.getInstance();
				    	
			        	try {
				        	tempDate = getStrData(eElement, "openDe");
				        	if(tempDate.length() != 0) {
					        	tempDate = tempDate.substring(0, 10);
					        	splitDate = tempDate.split("-");
					        	CREATE_DATE.set(Integer.parseInt(splitDate[0]), Integer.parseInt(splitDate[1]), Integer.parseInt(splitDate[2]));
				        	} else {
				        		CREATE_DATE.set(2023,10,30);
				        	}
	
				        	tempDate = getStrData(eElement, "updateDe");
				        	if(tempDate.length() != 0) {
					        	tempDate = tempDate.substring(0, 10);
					        	splitDate = tempDate.split("-");
					        	MODIFY_DATE.set(Integer.parseInt(splitDate[0]), Integer.parseInt(splitDate[1]), Integer.parseInt(splitDate[2]));
				        	} else {
				        		CREATE_DATE.set(2024,01,26);
				        	}
			        	}catch(Exception e) {
			        		e.printStackTrace();
			        	}
			        	
						String status = null;
						String dOTC_CODE = medStat[random.nextInt(2)];
						
						
						Medicine medicine = new Medicine(dNO, dNAME, dCOMPANY, price, dEFFECT, dUSAGE, dWARNC, dWARN, dintERACTION, dNEGATIVE, dSAVE, dIMGURL, null, null, null, null, null, null, null, null, null, null, CREATE_DATE.getTime(), MODIFY_DATE.getTime(), null, dOTC_CODE);
		        		list.add(medicine);
					} catch(Exception e) {
						e.printStackTrace();
					}
	        	}
	        }
		    
		} catch (Exception e) {
			e.printStackTrace();
		}
		return list;
	}
	
	public static int parseStep2(int page, Map<Integer, Medicine> map) {
		int updateCount = 0;
		try {
			StringBuilder urlBuilder = new StringBuilder(DUR2_INFO_XML_URL); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + KEY); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(""+page, "UTF-8")); /*페이지번호*/
			urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
			
			//System.out.println("parseStep2 request URL : " + urlBuilder.toString());
			
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			if(conn.getResponseCode() < 200 || conn.getResponseCode() >=300) {
				System.out.println("페이지를 찾을수 없습니다.");
				return updateCount;
			}
			
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc = db.parse(conn.getInputStream());
			doc.normalizeDocument();
			System.out.println("현재 페이지 : " + doc.getElementsByTagName("pageNo").item(0).getTextContent());
			
			NodeList nList = doc.getElementsByTagName("item");
			
			for (int i = 0; i < nList.getLength(); i++) {
				Node node = nList.item(i);
//	        	System.out.println("\nCurrent Element : " + node.getNodeName());
				if (node.getNodeType() == Node.ELEMENT_NODE) {
					try {
						Element eElement = (Element) node;
						int dNO = getIntData(eElement, "ITEM_SEQ"); // itemSeq
						if(map.containsKey(dNO) == false) {
							continue;
						}
						Medicine m = map.get(dNO);
						// 파싱하는 부분 시작!
						String TYPE = getStrData(eElement, "TYPE_NAME");
						m.setD1TYPE(TYPE);
						
						String dUSAGE = getStrData(eElement, "PROHBT_CONTENT");
						m.setD1PROHBT(dUSAGE);

						updateCount++;
					} catch(Exception e) {
						e.printStackTrace();
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return updateCount;
	}
	
	public static int parseStep3(int page, Map<Integer, Medicine> map) {
		int updateCount = 0;
		try {
			StringBuilder urlBuilder = new StringBuilder(DUR3_INFO_XML_URL); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + KEY); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(""+page, "UTF-8")); /*페이지번호*/
			urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
			
			//System.out.println("parseStep3 request URL : " + urlBuilder.toString());
			
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			if(conn.getResponseCode() < 200 || conn.getResponseCode() >=300) {
				System.out.println("페이지를 찾을수 없습니다.");
				return updateCount;
			}
			
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc = db.parse(conn.getInputStream());
			doc.normalizeDocument();
			System.out.println("현재 페이지 : " + doc.getElementsByTagName("pageNo").item(0).getTextContent());
			
			NodeList nList = doc.getElementsByTagName("item");
			
			for (int i = 0; i < nList.getLength(); i++) {
				Node node = nList.item(i);
//	        	System.out.println("\nCurrent Element : " + node.getNodeName());
				if (node.getNodeType() == Node.ELEMENT_NODE) {
					try {
						Element eElement = (Element) node;
						int dNO = getIntData(eElement, "ITEM_SEQ"); // itemSeq
						if(map.containsKey(dNO) == false) {
							continue;
						}
						Medicine m = map.get(dNO);
						// 파싱하는 부분 시작!
						String TYPE = getStrData(eElement, "TYPE_NAME");
						m.setD2TYPE(TYPE);
						
						String dUSAGE = getStrData(eElement, "PROHBT_CONTENT");
						m.setD2PROHBT(dUSAGE);
						
						updateCount++;
					} catch(Exception e) {
						e.printStackTrace();
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return updateCount;
	}
	
	public static int parseStep4(int page, Map<Integer, Medicine> map) {
		int updateCount = 0;
		try {
			StringBuilder urlBuilder = new StringBuilder(DUR4_INFO_XML_URL); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + KEY); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(""+page, "UTF-8")); /*페이지번호*/
			urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
			
			//System.out.println("parseStep3 request URL : " + urlBuilder.toString());
			
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			if(conn.getResponseCode() < 200 || conn.getResponseCode() >=300) {
				System.out.println("페이지를 찾을수 없습니다.");
				return updateCount;
			}
			
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc = db.parse(conn.getInputStream());
			doc.normalizeDocument();
			System.out.println("현재 페이지 : " + doc.getElementsByTagName("pageNo").item(0).getTextContent());
			
			NodeList nList = doc.getElementsByTagName("item");
			
			for (int i = 0; i < nList.getLength(); i++) {
				Node node = nList.item(i);
//	        	System.out.println("\nCurrent Element : " + node.getNodeName());
				if (node.getNodeType() == Node.ELEMENT_NODE) {
					try {
						Element eElement = (Element) node;
						int dNO = getIntData(eElement, "ITEM_SEQ"); // itemSeq
						if(map.containsKey(dNO) == false) {
							continue;
						}
						Medicine m = map.get(dNO);
						// 파싱하는 부분 시작!
						String TYPE = getStrData(eElement, "TYPE_NAME");
						m.setD3TYPE(TYPE);
						
						String dUSAGE = getStrData(eElement, "PROHBT_CONTENT");
						m.setD3PROHBT(dUSAGE);
						
						updateCount++;
					} catch(Exception e) {
						e.printStackTrace();
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return updateCount;
	}
	
	public static int parseStep6(int page, Map<Integer, Medicine> map) {
		int updateCount = 0;
		try {
			StringBuilder urlBuilder = new StringBuilder(DUR6_INFO_XML_URL); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + KEY); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(""+page, "UTF-8")); /*페이지번호*/
			urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
			
			//System.out.println("parseStep3 request URL : " + urlBuilder.toString());
			
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			if(conn.getResponseCode() < 200 || conn.getResponseCode() >=300) {
				System.out.println("페이지를 찾을수 없습니다.");
				return updateCount;
			}
			
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc = db.parse(conn.getInputStream());
			doc.normalizeDocument();
			System.out.println("현재 페이지 : " + doc.getElementsByTagName("pageNo").item(0).getTextContent());
			NodeList nList = doc.getElementsByTagName("item");
			
			for (int i = 0; i < nList.getLength(); i++) {
				Node node = nList.item(i);
//	        	System.out.println("\nCurrent Element : " + node.getNodeName());
				if (node.getNodeType() == Node.ELEMENT_NODE) {
					try {
						Element eElement = (Element) node;
						int dNO = getIntData(eElement, "ITEM_SEQ"); // itemSeq
						if(map.containsKey(dNO) == false) {
							continue;
						}
						Medicine m = map.get(dNO);
						// 파싱하는 부분 시작!
						String TYPE = getStrData(eElement, "TYPE_NAME");
						m.setD4TYPE(TYPE);
						
						String dUSAGE = getStrData(eElement, "PROHBT_CONTENT");
						m.setD4PROHBT(dUSAGE);
						
						updateCount++;
					} catch(Exception e) {
						e.printStackTrace();
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return updateCount;
	}

	public static int parseStep7(int page, Map<Integer, Medicine> map) {
		int updateCount = 0;
		try {
			StringBuilder urlBuilder = new StringBuilder(DUR7_INFO_XML_URL); /*URL*/
			urlBuilder.append("?" + URLEncoder.encode("serviceKey","UTF-8") + KEY); /*Service Key*/
			urlBuilder.append("&" + URLEncoder.encode("pageNo","UTF-8") + "=" + URLEncoder.encode(""+page, "UTF-8")); /*페이지번호*/
			urlBuilder.append("&" + URLEncoder.encode("numOfRows","UTF-8") + "=" + URLEncoder.encode("100", "UTF-8")); /*한 페이지 결과 수*/
			
			//System.out.println("parseStep3 request URL : " + urlBuilder.toString());
			
			URL url = new URL(urlBuilder.toString());
			HttpURLConnection conn = (HttpURLConnection) url.openConnection();
			conn.setRequestMethod("GET");
			conn.setRequestProperty("Content-type", "application/json");
			if(conn.getResponseCode() < 200 || conn.getResponseCode() >=300) {
				System.out.println("페이지를 찾을수 없습니다.");
				return updateCount;
			}
			
			DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
			DocumentBuilder db = dbf.newDocumentBuilder();
			Document doc = db.parse(conn.getInputStream());
			doc.normalizeDocument();
			System.out.println("현재 페이지 : " + doc.getElementsByTagName("pageNo").item(0).getTextContent());
			
			NodeList nList = doc.getElementsByTagName("item");
			
			for (int i = 0; i < nList.getLength(); i++) {
				Node node = nList.item(i);
//	        	System.out.println("\nCurrent Element : " + node.getNodeName());
				if (node.getNodeType() == Node.ELEMENT_NODE) {
					try {
						Element eElement = (Element) node;
						int dNO = getIntData(eElement, "ITEM_SEQ"); // itemSeq
						if(map.containsKey(dNO) == false) {
							continue;
						}
						Medicine m = map.get(dNO);
						// 파싱하는 부분 시작!
						String TYPE = getStrData(eElement, "TYPE_NAME");
						m.setD5TYPE(TYPE);
						
						String dUSAGE = getStrData(eElement, "PROHBT_CONTENT");
						m.setD5PROHBT(dUSAGE);
						
						updateCount++;
					} catch(Exception e) {
						e.printStackTrace();
					}
				}
			}
		} catch (Exception e) {
			e.printStackTrace();
		}
		return updateCount;
	}
	
    
    
	
	private static int insert(Medicine m) throws SQLException {
		System.out.println("Insert 시작!");
		String sql = "INSERT INTO medicine(dNO, dNAME, dCOMPANY, price, dEFFECT, dUSAGE, dWARNC, dWARN, dINTERACTION, dNEGATIVE, dSAVE, dIMGURL, "
				+ "d1TYPE, d1PROHBT, d2TYPE, d2PROHBT, d3TYPE, d3PROHBT, d4TYPE, d4PROHBT, d5TYPE, d5PROHBT, CREATE_DATE, MODIFY_DATE, status, dOTC_CODE) "
				+ "VALUES(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
		pstmt = conn.prepareStatement(sql);
		
//		int count = 1; // count 활용해도 된다!
		pstmt.setString(1, Integer.toString(m.dNO));
		pstmt.setString(2, m.dNAME);
		pstmt.setString(3, m.dCOMPANY);
		pstmt.setInt(4, m.price);
		pstmt.setString(5, m.dEFFECT);
		pstmt.setString(6, m.dUSAGE);
		pstmt.setString(7, m.dWARNC);
		pstmt.setString(8, m.dWARN);
		pstmt.setString(9, m.dintERACTION);
		pstmt.setString(10, m.dNEGATIVE);
		pstmt.setString(11, m.dSAVE);
		pstmt.setString(12, m.dIMGURL);
		pstmt.setString(13, m.d1TYPE);
		pstmt.setString(14, m.d1PROHBT);
		pstmt.setString(15, m.d2TYPE);
		pstmt.setString(16, m.d2PROHBT);
		pstmt.setString(17, m.d3TYPE);
		pstmt.setString(18, m.d3PROHBT);
		pstmt.setString(19, m.d4TYPE);
		pstmt.setString(20, m.d4PROHBT);
		pstmt.setString(21, m.d5TYPE);
		pstmt.setString(22, m.d5PROHBT);

		try {
			pstmt.setDate(23, new java.sql.Date(m.CREATE_DATE.getTime()));
			pstmt.setDate(24, new java.sql.Date(m.MODIFY_DATE.getTime()));
		} catch (NullPointerException e) {
			pstmt.setDate(23, null);
			pstmt.setDate(24, null);
		}
		
		pstmt.setString(25, m.status);
		pstmt.setString(26, m.dOTC_CODE);
		System.out.println("중복검사: "+m.toString());

		
		int result = pstmt.executeUpdate();
		
		if(result > 0) {
			System.out.println("insert 성공");
			return 0;
		} else {
			System.out.println("insert 실패");
			return 1;
		}
	}


	private static void update(String id, String name) throws SQLException {
		System.out.println("Update 시작!!");
		String sql = "update Medicine set name = ? where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, name);
		pstmt.setString(2, id);
		
		int result = pstmt.executeUpdate();
		if(result > 0) { // 0보다 커야 성공!
			System.out.println("Update 성공!");
		} else {
			System.out.println("Update 실패.");
		}
		System.out.println("Update 종료\n");
	}
	

	private static void delete(String id) throws SQLException {
		System.out.println("delete 시작!!");
		String sql = "delete from Medicine where id = ?";
		pstmt = conn.prepareStatement(sql);
		pstmt.setString(1, id);
		
		int result = pstmt.executeUpdate();
		if(result > 0) { // 0보다 커야 성공!
			System.out.println("delete 성공!");
		} else {
			System.out.println("delete 실패.");
		}
		System.out.println("delete 종료\n");
	}
	
	private static HashMap<String, Medicine> conbinedInfoByXML(HashMap<String, Medicine> medMap) {
    	try {
            int page = 1;
            int numOfRows = 10;

            while (true) {
                StringBuilder urlBuilder = new StringBuilder(DUR2_INFO_XML_URL); /*URL*/
                urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + KEY); /*Service Key*/
                urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(page), "UTF-8")); /*페이지번호*/
                urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(numOfRows), "UTF-8")); /*한 페이지 결과 수*/

                URL url = new URL(urlBuilder.toString());
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("GET");
                conn.setRequestProperty("Content-type", "application/json");
                

                if (conn.getResponseCode() < 200 || conn.getResponseCode() >= 300) {
                    System.out.println("페이지를 찾을 수 없습니다.");
                    return null;
                }

                DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
                DocumentBuilder db = dbf.newDocumentBuilder();
                Document doc = db.parse(conn.getInputStream());
                doc.normalizeDocument();

                NodeList items = doc.getElementsByTagName("item");
                for (int i = 0; i < items.getLength(); i++) {
                    Node node = items.item(i);
                    if (node.getNodeType() == Node.ELEMENT_NODE) {
                        Element e = (Element) node;
                        
                        //HashMap<String, Medicine> medMap = new HashMap<>();
                        //String code = getString(e, "ITEM_SEQ");
                        String code = getString(e, "ITEM_SEQ");
                        String name = getString(e, "TYPE_NAME");
                        String content = getString(e, "PROHBT_CONTENT");
                        System.out.println("품목번호,이름,내용: " + code + ", " + name + ", " + content);
                        
                        Medicine tempMed = new Medicine();

						if (medMap.containsKey(code)) {
							System.out.println("중복항목있음! 품목번호:" + code );
							tempMed = medMap.get(code);
							tempMed.setD1TYPE(name);
							tempMed.setD1PROHBT(content);
							medMap.put(code, tempMed);
						}
                    }
                }

                int totalCount = Integer.parseInt(getString(doc, "totalCount"));
                int totalPage = (totalCount + numOfRows - 1) / numOfRows;

                System.out.println("현재 페이지 번호: " + page);
                System.out.println("총 페이지 수: " + totalPage);

                if (page >= totalPage) {
                    System.out.println("파싱 완료");
                    return medMap;
                }

                page++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    	
    	return null;
	}

	private static HashMap<String, Medicine> CpatentInfoByXML(HashMap<String, Medicine> medMap) {
    	try {
            int page = 1;
            int numOfRows = 10;

            while (true) {
                StringBuilder urlBuilder = new StringBuilder(DUR6_INFO_XML_URL); /*URL*/
                urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + KEY); /*Service Key*/
                urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(page), "UTF-8")); /*페이지번호*/
                urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(numOfRows), "UTF-8")); /*한 페이지 결과 수*/

                URL url = new URL(urlBuilder.toString());
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("GET");
                conn.setRequestProperty("Content-type", "application/json");
                

                if (conn.getResponseCode() < 200 || conn.getResponseCode() >= 300) {
                    System.out.println("페이지를 찾을 수 없습니다.");
                    return null;
                }

                DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
                DocumentBuilder db = dbf.newDocumentBuilder();
                Document doc = db.parse(conn.getInputStream());
                doc.normalizeDocument();

                NodeList items = doc.getElementsByTagName("item");
                for (int i = 0; i < items.getLength(); i++) {
                    Node node = items.item(i);
                    if (node.getNodeType() == Node.ELEMENT_NODE) {
                        Element e = (Element) node;
                        
                        
                        String code = getString(e, "ITEM_SEQ");
                        String name = getString(e, "TYPE_NAME");
                        String content = getString(e, "PROHBT_CONTENT");
                        System.out.println("품목번호,이름,내용: " + code + ", " + name + ", " + content);
                        
                        Medicine tempMed = new Medicine();

						if (medMap.containsKey(code)) {
							System.out.println("중복항목있음! 품목번호:" + code );
							tempMed = medMap.get(code);
							tempMed.setD4TYPE(name);
							tempMed.setD4PROHBT(content);
							medMap.put(code, tempMed);
						}
                    }
                }

                int totalCount = Integer.parseInt(getString(doc, "totalCount"));
                int totalPage = (totalCount + numOfRows - 1) / numOfRows;

                System.out.println("현재 페이지 번호: " + page);
                System.out.println("총 페이지 수: " + totalPage);

                if (page >= totalPage) {
                    System.out.println("파싱 완료");
                    return medMap;
                }

                page++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    	return null;
	}


	private static HashMap<String, Medicine> PregInfoByXML(HashMap<String, Medicine> medMap) {
    	try {
            int page = 1;
            int numOfRows = 10;

            while (true) {
                StringBuilder urlBuilder = new StringBuilder(DUR4_INFO_XML_URL); /*URL*/
                urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + KEY); /*Service Key*/
                urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(page), "UTF-8")); /*페이지번호*/
                urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(numOfRows), "UTF-8")); /*한 페이지 결과 수*/

                URL url = new URL(urlBuilder.toString());
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("GET");
                conn.setRequestProperty("Content-type", "application/json");
                

                if (conn.getResponseCode() < 200 || conn.getResponseCode() >= 300) {
                    System.out.println("페이지를 찾을 수 없습니다.");
                    return null;
                }

                DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
                DocumentBuilder db = dbf.newDocumentBuilder();
                Document doc = db.parse(conn.getInputStream());
                doc.normalizeDocument();

                NodeList items = doc.getElementsByTagName("item");
                for (int i = 0; i < items.getLength(); i++) {
                    Node node = items.item(i);
                    if (node.getNodeType() == Node.ELEMENT_NODE) {
                        Element e = (Element) node;
                        
                        
                        String code = getString(e, "ITEM_SEQ");
                        String name = getString(e, "TYPE_NAME");
                        String content = getString(e, "PROHBT_CONTENT");
                        System.out.println("품목번호,이름,내용: " + code + ", " + name + ", " + content);
                        
                        Medicine tempMed = new Medicine();

						if (medMap.containsKey(code)) {
							System.out.println("중복항목있음! 품목번호:" + code );
							tempMed = medMap.get(code);
							tempMed.setD3TYPE(name);
							tempMed.setD3PROHBT(content);
							medMap.put(code, tempMed);
						}
                    }
                }

                int totalCount = Integer.parseInt(getString(doc, "totalCount"));
                int totalPage = (totalCount + numOfRows - 1) / numOfRows;

                System.out.println("현재 페이지 번호: " + page);
                System.out.println("총 페이지 수: " + totalPage);

                if (page >= totalPage) {
                    System.out.println("파싱 완료");
                    return medMap;
                }

                page++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    	return null;
	}

	private static HashMap<String, Medicine> OldInfoByXML(HashMap<String, Medicine> medMap) {
    	try {
            int page = 1;
            int numOfRows = 10;

            while (true) {
                StringBuilder urlBuilder = new StringBuilder(DUR3_INFO_XML_URL); /*URL*/
                urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + KEY); /*Service Key*/
                urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(page), "UTF-8")); /*페이지번호*/
                urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(numOfRows), "UTF-8")); /*한 페이지 결과 수*/

                URL url = new URL(urlBuilder.toString());
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("GET");
                conn.setRequestProperty("Content-type", "application/json");
                

                if (conn.getResponseCode() < 200 || conn.getResponseCode() >= 300) {
                    System.out.println("페이지를 찾을 수 없습니다.");
                    return null;
                }

                DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
                DocumentBuilder db = dbf.newDocumentBuilder();
                Document doc = db.parse(conn.getInputStream());
                doc.normalizeDocument();

                NodeList items = doc.getElementsByTagName("item");
                for (int i = 0; i < items.getLength(); i++) {
                    Node node = items.item(i);
                    if (node.getNodeType() == Node.ELEMENT_NODE) {
                        Element e = (Element) node;
                        
                        
                        String code = getString(e, "ITEM_SEQ");
                        String name = getString(e, "TYPE_NAME");
                        String content = getString(e, "PROHBT_CONTENT");
                        System.out.println("품목번호,이름,내용: " + code + ", " + name + ", " + content);
                        
                        Medicine tempMed = new Medicine();
                        	System.out.print("dbg2222222: ");

						if (medMap.containsKey(code)) {
							System.out.println("중복항목있음! 품목번호:" + code );
							tempMed = medMap.get(code);
							tempMed.setD2TYPE(name);
							tempMed.setD2PROHBT(content);
							System.out.println("dbg3: " + tempMed.toString());
							medMap.put(code, tempMed);
						}
                    }
                }

                int totalCount = Integer.parseInt(getString(doc, "totalCount"));
                int totalPage = (totalCount + numOfRows - 1) / numOfRows;
                
                System.out.println("현재 페이지 번호: " + page);
                System.out.println("총 페이지 수: " + totalPage);

                if (page == 10) { //>= totalPage
                    System.out.println("파싱 완료");
                    return medMap;
                }

                page++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    	return null;
    }
	
	private static HashMap<String, Medicine> AgeInfoByXML(HashMap<String, Medicine> medMap) {
    	try {
            int page = 1;
            int numOfRows = 10;

            while (true) {
                StringBuilder urlBuilder = new StringBuilder(DUR7_INFO_XML_URL); /*URL*/
                urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + KEY); /*Service Key*/
                urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(page), "UTF-8")); /*페이지번호*/
                urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(numOfRows), "UTF-8")); /*한 페이지 결과 수*/

                URL url = new URL(urlBuilder.toString());
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("GET");
                conn.setRequestProperty("Content-type", "application/json");
                

                if (conn.getResponseCode() < 200 || conn.getResponseCode() >= 300) {
                    System.out.println("페이지를 찾을 수 없습니다.");
                    return null;
                }

                DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
                DocumentBuilder db = dbf.newDocumentBuilder();
                Document doc = db.parse(conn.getInputStream());
                doc.normalizeDocument();

                NodeList items = doc.getElementsByTagName("item");
                for (int i = 0; i < items.getLength(); i++) {
                    Node node = items.item(i);
                    if (node.getNodeType() == Node.ELEMENT_NODE) {
                        Element e = (Element) node;
                        
                        
                        String code = getString(e, "ITEM_SEQ");
                        String name = getString(e, "TYPE_NAME");
                        String content = getString(e, "PROHBT_CONTENT");
                        System.out.println("품목번호,이름,내용: " + code + ", " + name + ", " + content);
                        
                        Medicine tempMed = new Medicine();

						if (medMap.containsKey(code)) {
							System.out.println("중복항목있음! 품목번호:" + code );
							tempMed = medMap.get(code);
							tempMed.setD5TYPE(name);
							tempMed.setD5PROHBT(content);
							medMap.put(code, tempMed);
						}
                    }
                }

                int totalCount = Integer.parseInt(getString(doc, "totalCount"));
                int totalPage = (totalCount + numOfRows - 1) / numOfRows;
                
                System.out.print("현재 페이지 번호: " + page);
                System.out.println("\t\t 총 페이지 수: " + totalPage);

                if (page >= totalPage) {
                    System.out.println("파싱 완료");
                    return medMap;
                }

                page++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    	
    	return null;
	}

	private static String getString(Element eElement, String tagName) {
		try {
			return eElement.getElementsByTagName(tagName).item(0).getTextContent();
		} catch (Exception e) {
			return "-";
		}
	}
	
	private static String getString(Document eElement, String tagName) {
		try {
			return eElement.getElementsByTagName(tagName).item(0).getTextContent();
		} catch (Exception e) {
			return "-";
		}
	}
	
	
	private static String getStrData(Element eElement, String tagName) {
		try {
			return eElement.getElementsByTagName(tagName).item(0).getTextContent();
		} catch (Exception e) {
			return "-";
		}
	}

	private static int getIntData(Element eElement, String tagName) {
		try {
			return Integer.parseInt(eElement.getElementsByTagName(tagName).item(0).getTextContent());
		} catch (Exception e) {
			return 0;
		}
	}

	private static long getLongData(Element eElement, String tagName) {
		try {
			return Long.parseLong(eElement.getElementsByTagName(tagName).item(0).getTextContent());
		} catch (Exception e) {
			return 0;
		}
	}

	private static double getDoubleData(Element eElement, String tagName) {
		try {
			return Double.parseDouble(eElement.getElementsByTagName(tagName).item(0).getTextContent());
		} catch (Exception e) {
			return 0.0;
		}
	}


	private static SimpleDateFormat sdf = new SimpleDateFormat("yyyy-MM-dd");
	private static Date getDateData(Element eElement, String tagName) {
		try {
			String str =eElement.getElementsByTagName(tagName).item(0).getTextContent();
			return sdf.parse(str);
		} catch (Exception e) {
			return null;
		}
	}

}