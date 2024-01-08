import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class MeicineInfoOpenApi {
    public static final String KEY = "QRde7O0zENfHCVsmkGqb6YvtADsDS5Ya7AQXR8Td1%2FLmdnVKo7cSx66kb9JtRvTmoIslxxvjeE6hZ7tSbzwMAA%3D%3D";
    public static final String DRUG_INFO_XML_URL = "http://apis.data.go.kr/1471000/DrbEasyDrugInfoService/getDrbEasyDrugList";
    
//    <response>
//    <header>
//    <resultCode>00</resultCode>
//    <resultMsg>NORMAL SERVICE.</resultMsg>
//    </header>
//    <body>
//    <numOfRows>10</numOfRows>
//    <pageNo>1</pageNo>
//    <totalCount>4702</totalCount>
//    <items>
//    <item>
//    <entpName>동화약품(주)</entpName>
//    <itemName>활명수</itemName>
//    <itemSeq>195700020</itemSeq>
//    <efcyQesitm>이 약은 식욕감퇴(식욕부진), 위부팽만감, 소화불량, 과식, 체함, 구역, 구토에 사용합니다. </efcyQesitm>
//    <useMethodQesitm>만 15세 이상 및 성인은 1회 1병(75 mL), 만 11세이상~만 15세미만은 1회 2/3병(50 mL), 만 8세 이상~만 11세 미만은 1회 1/2병(37.5 mL), 만 5세 이상~만 8세 미만은 1회 1/3병(25 mL), 만 3세 이상~만 5세 미만은 1회 1/4병(18.75 mL), 만 1세 이상~만 3세 미만은 1회 1/5병(15 mL), 1일 3회 식후에 복용합니다. 복용간격은 4시간 이상으로 합니다. </useMethodQesitm>
//    <atpnWarnQesitm/>
//    <atpnQesitm>만 3개월 미만의 젖먹이는 이 약을 복용하지 마십시오. 이 약을 복용하기 전에 만 1세 미만의 젖먹이, 임부 또는 임신하고 있을 가능성이 있는 여성, 카라멜에 과민증 환자 또는 경험자, 나트륨 제한 식이를 하는 사람은 의사 또는 약사와 상의하십시오. 정해진 용법과 용량을 잘 지키십시오. 어린이에게 투여할 경우 보호자의 지도 감독하에 투여하십시오. 1개월 정도 복용하여도 증상의 개선이 없을 경우 복용을 즉각 중지하고 의사 또는 약사와 상의하십시오. </atpnQesitm>
//    <intrcQesitm/>
//    <seQesitm/>
//    <depositMethodQesitm>습기와 빛을 피해 실온에서 보관하십시오. 어린이의 손이 닿지 않는 곳에 보관하십시오. </depositMethodQesitm>
//    <openDe>2021-01-29 00:00:00</openDe>
//    <updateDe>2023-01-25</updateDe>
//    <itemImage/>
//    <bizrno>1108100102</bizrno>
//    </item>
//    </body>
//    </response>

    public static void main(String[] args) {
        parseMedicineInfoByXML();
    }

    private static void parseMedicineInfoByXML() {
        try {
            int page = 1;
            int numOfRows = 10;

            while (true) {
                StringBuilder urlBuilder = new StringBuilder(DRUG_INFO_XML_URL); /*URL*/
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
                        System.out.println("업체명: " + getString(e, "entpName"));
                        System.out.println("제품명: " + getString(e, "itemName"));
                        System.out.println("효능: " + getString(e, "efcyQesitm"));
                        System.out.println("사용법: " + getString(e, "useMethodQesitm"));
                        System.out.println("주의사항경고: " + getString(e, "atpnWarnQesitm"));
                        System.out.println("주의사항: " + getString(e, "atpnQesitm"));
                        System.out.println("상호작용: " + getString(e, "intrcQesitm"));
                        System.out.println("부작용: " + getString(e, "seQesitm"));
                        System.out.println("보관법: " + getString(e, "depositMethodQesitm"));
                        System.out.println("이미지정보: " + getString(e, "itemImage"));
                        System.out.println("error: " + getString(e, "error"));
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
