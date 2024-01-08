import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class generateHTML {
	public static final String KEY = "QRde7O0zENfHCVsmkGqb6YvtADsDS5Ya7AQXR8Td1%2FLmdnVKo7cSx66kb9JtRvTmoIslxxvjeE6hZ7tSbzwMAA%3D%3D";
    public static final String SAFELETTER_XML_URL = "https://apis.data.go.kr/1471000/DrugSafeLetterService02/getDrugSafeLetterList02";
    
//    <item>
//    <SAFT_LETT_NO>508</SAFT_LETT_NO>
//    <TITLE>의약품 정보 서한 등 배포 알림(오셀타미비르, 발록사비르, 페라미비르, 자나미비르 성분 제제)</TITLE>
//    <PBANC_NO/>
//    <PBANC_DIVS_CD>01</PBANC_DIVS_CD>
//    <PBANC_DIVS_NM>안전성서한</PBANC_DIVS_NM>
//    <PBANC_YMD>2023-12-06</PBANC_YMD>
//    <RLS_BGNG_YMD>2023-12-06 00:00:00</RLS_BGNG_YMD>
//    <SUMRY_CONT/>
//    <PBANC_CONT>1. 우리 처는 독감치료제를 안전하게 사용할 수 있도록 올바른 정보를 제공하기 위해 인플루엔자 바이러스 치료제(오셀타미비르, 발록사비르, 페라미비르, 자나미비르 성분 제제)에 대하여 국내 의약전문가 및 소비자 단체 등에 붙임과 같이 안전성 서한 등을 배포하오니, 2. 관련 단체(협회) 등에서는 회원사 및 비회원사에 동 정보사항을 널리 전파해 주시기 바라며, 의약품 등 사전·사후 관리 관련 기관(부서) 등에서는 관련 업무에 참고하시기 바랍니다. 3. 아울러, 붙임의 리플릿 및 카드뉴스는 우리 처 누리집에서 찾아보실 수 있음을 알려드립니다. 붙임 1. 의약품 정보 서한 1부 2. 인플루엔자 바이러스치료제 안전사용 길라집이 리플릿 및 카드뉴스 1부. 끝. ※ 붙임의 의약품 정보 서한은 의약품안전나라 홈페이지(http://nedrug.mfds.go.kr) 상단 메뉴 "고시/공고/알림 → 안전성 정보 → 안전성 서한(속보)"에서 내려받으실 수 있습니다. 끝.</PBANC_CONT>
//    <ACTN_MTTR_CONT/>
//    <INQ_CNT>1647</INQ_CNT>
//    <RGSTN_ID>정시연</RGSTN_ID>
//    <CHRG_DEP>의약품안전평가과</CHRG_DEP>
//    <ATTACH_FILE_URL>https://nedrug.mfds.go.kr/cmn/edms/down/1Omzc4bQjtn</ATTACH_FILE_URL>
//    </item>
    
    public static void main(String[] args) {
		SafeLetterListByXML();
	}

	public static void SafeLetterListByXML() {
		try {
            int page = 1;
            int numOfRows = 10;
            
            StringBuilder tableHtml = new StringBuilder("""
                    <table class="table table-striped table-hover">
                      <thead>
                          <tr>
                              <th style="text-align:center;">#</th>
                              <th style="text-align:center;">공고일자</th>
                              <th style="text-align:center;">제목</th>
                              <th style="text-align:center;">담당부서</th>
                          </tr>
                      </thead>
                      <tbody>
                    """);

            while (true) {
                StringBuilder urlBuilder = new StringBuilder(SAFELETTER_XML_URL); /*URL*/
                urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + KEY); /*Service Key*/
                urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(page), "UTF-8")); /*페이지번호*/
                urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode(String.valueOf(numOfRows), "UTF-8")); /*한 페이지 결과 수*/

                URL url = new URL(urlBuilder.toString());
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("GET");
                conn.setRequestProperty("Content-type", "application/json");
//                System.out.println("Response code: " + conn.getResponseCode());

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
                        
                        String saftLettNo = getString(e, "SAFT_LETT_NO");
                        String pbancYmd = getString(e, "PBANC_YMD");
                        String title = getString(e, "TITLE");
                        String chrgDep = getString(e, "CHRG_DEP");
                        
                        tableHtml.append(String.format("""
                                <tr style="cursor:pointer;" data-saft_lett_no="%s">
                                    <th class="col-md-1" style="text-align:center;" scope="row">%s</th>
                                    <td class="col-md-1" style="text-align:center;">%s</td>
                                    <td class="col-md-6">%s</td>
                                    <td class="col-md-3" style="text-align:center;">%s</td>
                                </tr>
                                """, saftLettNo, saftLettNo, pbancYmd, title, chrgDep));
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
                
                tableHtml.append("</tbody></table>");
                System.out.println(tableHtml.toString());
            }
		} catch (Exception e) {
			// TODO: handle exception
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
