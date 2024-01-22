package com.multi.semipjt.api.pharmacy;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

public class PharmacyInfoApi {
    public static final String KEY = "sHpLWgiDMLTAM87%2BhYNCvIMekwE38WDEWlRi14j7FuNOn7oRMkfFoVCne1d7TmSS3G1KtCBCq2wOjpbmkNNyzA%3D%3D";

    public static void main(String[] args) throws IOException {
        parsePharmacyByXML();
    }

    public static void parsePharmacyByXML() {
        try {
            String pageNo = "1";
            String numRow = "10";
            int num = Integer.parseInt(numRow);

            int totalPage = (24482 + num - 1) / num;
            System.out.println("총페이지 수 : " + totalPage);
            int count = 0;
            System.out.println("현재 페이지 번호 : " + count);
            while (true) {
                count++;
                pageNo = String.valueOf(count);

                StringBuilder urlBuilder = new StringBuilder("http://apis.data.go.kr/B552657/ErmctInsttInfoInqireService/getParmacyFullDown"); /* URL */
                urlBuilder.append("?" + URLEncoder.encode("serviceKey", "UTF-8") + "=" + KEY); /* Service Key */
                urlBuilder.append("&" + URLEncoder.encode("pageNo", "UTF-8") + "=" + URLEncoder.encode(pageNo, "UTF-8")); /* 페이지 번호 */
                urlBuilder.append("&" + URLEncoder.encode("numOfRows", "UTF-8") + "=" + URLEncoder.encode(numRow, "UTF-8")); /* 목록 건수 */
                URL url = new URL(urlBuilder.toString());
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("GET");
                conn.setRequestProperty("Content-type", "application/json");

                if (conn.getResponseCode() < 200 || conn.getResponseCode() >= 300) {
                    System.out.println("페이지를 찾을수 없습니다.");
                    return;
                }

                DocumentBuilderFactory dbf = DocumentBuilderFactory.newInstance();
                DocumentBuilder db = dbf.newDocumentBuilder();
                Document doc = db.parse(conn.getInputStream());
                doc.normalizeDocument();

                System.out.println("----------------------------------------------------------------");
                System.out.println("페이지 수 : " + pageNo);
                NodeList items = doc.getElementsByTagName("item");
                for (int j = 0; j < items.getLength(); j++) {
                    Node item = items.item(j);
                    if (item.getNodeType() == Node.ELEMENT_NODE) {
                        Element e = (Element) item;
                        printPharmacyInfo(e);
                    }
                }

                System.out.println();
                try {
                    System.out.println("현재 파싱 갯수 : " + num * count + " / 24482 (" + String.format("%.3f", (((double) num * (double) count) / 24482) * 100) + "%)");
                    System.out.println(count);
                } catch (Exception e) {
                    e.printStackTrace();
                }

                if (count > totalPage) {
                    System.out.println("파싱 완료");
                    break;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
    }

    private static void printPharmacyInfo(Element e) {
        try {
            System.out.println("주소지 : " + getString(e, "dutyAddr"));
        } catch (Exception ex) {
        }
        try {
            System.out.println("팩스번호 : " + getString(e, "dutyFax"));
        } catch (Exception ex) {
        }
        try {
            System.out.println("약국 이름 : " + getString(e, "dutyName"));
        } catch (Exception ex) {
        }
        try {
            System.out.println("약국 전화번호 : " + getString(e, "dutyTel1"));
        } catch (Exception ex) {
        }

        try {
            System.out.println("비고 : " + getString(e, "dutyEtc"));
        } catch (Exception ex) {
        }

        try {
            System.out.println("약국 설명상세 : " + getString(e, "dutyInf"));
        } catch (Exception ex) {
        }

        try {
            System.out.println("약국 약도 : " + getString(e, "dutyMapimg"));
        } catch (Exception ex) {
        }

        printOperatingHours(e);

        try {
            System.out.println("기관ID : " + getString(e, "hpid"));
        } catch (Exception ex) {
        }

        try {
            System.out.println("우편번호 : " + getString(e, "postCdn1") + getString(e, "postCdn2"));
        } catch (Exception ex) {
        }

        try {
            System.out.println("병원좌표(경도,위도) : (" + getString(e, "wgs84Lat") + "," + getString(e, "wgs84Lon") + ")");
        } catch (Exception ex) {
        }
    }

    private static void printOperatingHours(Element e) {
        try {
            for (int i = 1; i <= 8; i++) {
                String startTimeTag = "dutyTime" + i + "s";
                String endTimeTag = "dutyTime" + i + "c";
                System.out.println("영업시간(" + getDayOfWeek(i) + ") : " + getString(e, startTimeTag) + "~" + getString(e, endTimeTag));
            }
        } catch (Exception ex) {
        }
    }

    private static String getDayOfWeek(int day) {
        switch (day) {
            case 1:
                return "월";
            case 2:
                return "화";
            case 3:
                return "수";
            case 4:
                return "목";
            case 5:
                return "금";
            case 6:
                return "토";
            case 7:
                return "일";
            case 8:
                return "공휴일";
            default:
                return "";
        }
    }

    private static String getString(Element e, String name) {
        try {
            return e.getElementsByTagName(name).item(0).getTextContent();
        } catch (Exception e2) {
        }
        return null;
    }
}
