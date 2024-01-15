import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class InfoAPI {
	public static final String KEY = "QRde7O0zENfHCVsmkGqb6YvtADsDS5Ya7AQXR8Td1%2FLmdnVKo7cSx66kb9JtRvTmoIslxxvjeE6hZ7tSbzwMAA%3D%3D";
    public static final String DUR1_INFO_XML_URL = "https://apis.data.go.kr/1471000/DURPrdlstInfoService03/getUsjntTabooInfoList03"; // 병용 금기 - 30975 페이지
    public static final String DUR2_INFO_XML_URL = "https://apis.data.go.kr/1471000/DURPrdlstInfoService03/getOdsnAtentInfoList03"; // 노인 금기 - 227 페이지
    public static final String DUR3_INFO_XML_URL = "https://apis.data.go.kr/1471000/DURPrdlstInfoService03/getPwnmTabooInfoList03"; // 임부 금기 - 1705 페이지
    public static final String DUR4_INFO_XML_URL = "https://apis.data.go.kr/1471000/DURPrdlstInfoService03/getMdctnPdAtentInfoList03"; // 투여기간주의 - 74 페이지
    public static final String DUR5_INFO_XML_URL = "https://apis.data.go.kr/1471000/DURPrdlstInfoService03/getCpctyAtentInfoList03"; // 용량주의 -  745 페이지
    public static final String DUR6_INFO_XML_URL = "https://apis.data.go.kr/1471000/DURPrdlstInfoService03/getSpcifyAgrdeTabooInfoList03"; // 연령 금기 -  290 페이지 -> 건강보험심사평가원_연령별 금기 의약품목록_20230501 (csv)가 필요내용 보유
    
    
    public static void main(String[] args) {
//    	ConcomitantInfoByXML();
//    	OldInfoByXML();
//    	PregInfoByXML();
//    	PdatentInfoByXML();
//    	CpatentInfoByXML();
    	AgeInfoByXML();
	}

    private static void AgeInfoByXML() {
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
                System.out.println("Response code: " + conn.getResponseCode());

                if (conn.getResponseCode() < 200 || conn.getResponseCode() >= 300) {
                    System.out.println("페이지를 찾을 수 없습니다.");
                    return;
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
                        System.out.println("금기: " + getString(e, "TYPE_NAME"));
                        System.out.println("제품명: " + getString(e, "ITEM_NAME"));
                        System.out.println("내용: " + getString(e, "PROHBT_CONTENT"));
                    }
                }

                int totalCount = Integer.parseInt(getString(doc, "totalCount"));
                int totalPage = (totalCount + numOfRows - 1) / numOfRows;

                System.out.println("현재 페이지 번호: " + page);
                System.out.println("총 페이지 수: " + totalPage);

                if (page >= totalPage) {
                    System.out.println("파싱 완료");
                    break;
                }

                page++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

	private static void CpatentInfoByXML() {
    	try {
            int page = 1;
            int numOfRows = 10;

            while (true) {
                StringBuilder urlBuilder = new StringBuilder(DUR5_INFO_XML_URL); /*URL*/
                urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + KEY); /*Service Key*/
                urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(page), "UTF-8")); /*페이지번호*/
                urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(numOfRows), "UTF-8")); /*한 페이지 결과 수*/

                URL url = new URL(urlBuilder.toString());
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("GET");
                conn.setRequestProperty("Content-type", "application/json");
                System.out.println("Response code: " + conn.getResponseCode());

                if (conn.getResponseCode() < 200 || conn.getResponseCode() >= 300) {
                    System.out.println("페이지를 찾을 수 없습니다.");
                    return;
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
                        System.out.println("금기: " + getString(e, "TYPE_NAME"));
                        System.out.println("제품명: " + getString(e, "ITEM_NAME"));
                        System.out.println("내용: " + getString(e, "PROHBT_CONTENT"));
                    }
                }

                int totalCount = Integer.parseInt(getString(doc, "totalCount"));
                int totalPage = (totalCount + numOfRows - 1) / numOfRows;

                System.out.println("현재 페이지 번호: " + page);
                System.out.println("총 페이지 수: " + totalPage);

                if (page >= totalPage) {
                    System.out.println("파싱 완료");
                    break;
                }

                page++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

	private static void PdatentInfoByXML() {
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
                System.out.println("Response code: " + conn.getResponseCode());

                if (conn.getResponseCode() < 200 || conn.getResponseCode() >= 300) {
                    System.out.println("페이지를 찾을 수 없습니다.");
                    return;
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
                        System.out.println("금기: " + getString(e, "TYPE_NAME"));
                        System.out.println("제품명: " + getString(e, "ITEM_NAME"));
                        System.out.println("내용: " + getString(e, "PROHBT_CONTENT"));
                    }
                }

                int totalCount = Integer.parseInt(getString(doc, "totalCount"));
                int totalPage = (totalCount + numOfRows - 1) / numOfRows;

                System.out.println("현재 페이지 번호: " + page);
                System.out.println("총 페이지 수: " + totalPage);

                if (page >= totalPage) {
                    System.out.println("파싱 완료");
                    break;
                }

                page++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

	private static void PregInfoByXML() {
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
                System.out.println("Response code: " + conn.getResponseCode());

                if (conn.getResponseCode() < 200 || conn.getResponseCode() >= 300) {
                    System.out.println("페이지를 찾을 수 없습니다.");
                    return;
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
                        System.out.println("금기: " + getString(e, "TYPE_NAME"));
                        System.out.println("제품명: " + getString(e, "ITEM_NAME"));
                        System.out.println("임부금기 내용: " + getString(e, "PROHBT_CONTENT"));
                    }
                }

                int totalCount = Integer.parseInt(getString(doc, "totalCount"));
                int totalPage = (totalCount + numOfRows - 1) / numOfRows;

                System.out.println("현재 페이지 번호: " + page);
                System.out.println("총 페이지 수: " + totalPage);

                if (page >= totalPage) {
                    System.out.println("파싱 완료");
                    break;
                }

                page++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
	}

	private static void OldInfoByXML() {
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
                System.out.println("Response code: " + conn.getResponseCode());

                if (conn.getResponseCode() < 200 || conn.getResponseCode() >= 300) {
                    System.out.println("페이지를 찾을 수 없습니다.");
                    return;
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
                        System.out.println("금기: " + getString(e, "TYPE_NAME"));
                        System.out.println("제품명: " + getString(e, "ITEM_NAME"));
                        System.out.println("노인금기 내용: " + getString(e, "PROHBT_CONTENT"));
                        System.out.println("병용금지약_제품명: " + getString(e, "MIXTURE_INGR_KOR_NAME"));
                    }
                }

                int totalCount = Integer.parseInt(getString(doc, "totalCount"));
                int totalPage = (totalCount + numOfRows - 1) / numOfRows;

                System.out.println("현재 페이지 번호: " + page);
                System.out.println("총 페이지 수: " + totalPage);

                if (page >= totalPage) {
                    System.out.println("파싱 완료");
                    break;
                }

                page++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
	

	private static void ConcomitantInfoByXML() {
    	try {
            int page = 1;
            int numOfRows = 10;

            while (true) {
                StringBuilder urlBuilder = new StringBuilder(DUR1_INFO_XML_URL); /*URL*/
                urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + KEY); /*Service Key*/
                urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(page), "UTF-8")); /*페이지번호*/
                urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(numOfRows), "UTF-8")); /*한 페이지 결과 수*/

                URL url = new URL(urlBuilder.toString());
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("GET");
                conn.setRequestProperty("Content-type", "application/json");
                System.out.println("Response code: " + conn.getResponseCode());

                if (conn.getResponseCode() < 200 || conn.getResponseCode() >= 300) {
                    System.out.println("페이지를 찾을 수 없습니다.");
                    return;
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
                        System.out.println("금기: " + getString(e, "TYPE_NAME"));
                        System.out.println("제품명: " + getString(e, "ITEM_NAME"));
                        System.out.println("병용금지약_제품명: " + getString(e, "MIXTURE_INGR_KOR_NAME"));
                        System.out.println("금기 내용: " + getString(e, "PROHBT_CONTENT"));
                    }
                }

                int totalCount = Integer.parseInt(getString(doc, "totalCount"));
                int totalPage = (totalCount + numOfRows - 1) / numOfRows;

                System.out.println("현재 페이지 번호: " + page);
                System.out.println("총 페이지 수: " + totalPage);

                if (page >= totalPage) {
                    System.out.println("파싱 완료");
                    break;
                }

                page++;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    public static String getString(Element e, String name) {
        try {
            return e.getElementsByTagName(name).item(0).getTextContent();
        } catch (Exception e2) {
            return null;
        }
    }

    public static String getString(Document doc, String name) {
        try {
            return doc.getElementsByTagName(name).item(0).getTextContent();
        } catch (Exception e) {
            return null;
        }
    }
}
