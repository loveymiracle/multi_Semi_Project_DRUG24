package com.multi.semipjt.api.pharmacy;

import java.io.IOException;
import java.net.HttpURLConnection;
import java.net.URL;
import java.net.URLEncoder;
import java.util.ArrayList;
import java.util.List;

import javax.xml.parsers.DocumentBuilder;
import javax.xml.parsers.DocumentBuilderFactory;

import org.w3c.dom.Document;
import org.w3c.dom.Element;
import org.w3c.dom.Node;
import org.w3c.dom.NodeList;

import com.multi.semipjt.pharmacy.model.vo.Pharmacy;

public class PharmacyInfoApi {
    public static final String KEY = "sHpLWgiDMLTAM87%2BhYNCvIMekwE38WDEWlRi14j7FuNOn7oRMkfFoVCne1d7TmSS3G1KtCBCq2wOjpbmkNNyzA%3D%3D";

    public static void main(String[] args) throws IOException {
        parsePharmacyByXML();
    }
    
    public static List<Pharmacy> parsePharmacyByXML() {
    	List<Pharmacy> list = new ArrayList<>();
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
                System.out.println("@@@" + urlBuilder.toString());
                HttpURLConnection conn = (HttpURLConnection) url.openConnection();
                conn.setRequestMethod("GET");
                conn.setRequestProperty("Content-type", "application/json");

                if (conn.getResponseCode() < 200 || conn.getResponseCode() >= 300) {
                    System.out.println("페이지를 찾을수 없습니다.");
                    return null;
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
                        Pharmacy p = printPharmacyInfo(e);
                        list.add(p);
                    }
                }

                System.out.println();
                try {
                    System.out.println("현재 파싱 갯수 : " + num * count + " / 24482 (" + String.format("%.3f", (((double) num * (double) count) / 24482) * 100) + "%)");
                    System.out.println(count);
                } catch (Exception e) {
                    e.printStackTrace();
                }
                
                // 임시코드@@@ 없애면 40개 넘어감!!!
                if(count > 3) {
                	break;
                }
                
                if (count > totalPage) {
                    System.out.println("파싱 완료");
                    break;
                }
            }

        } catch (Exception e) {
            e.printStackTrace();
        }
		return list;  
	}

    private static Pharmacy printPharmacyInfo(Element e) {
    	Pharmacy pharmacy = new Pharmacy();
        try {
        	pharmacy.setPhaddress(getString(e, "dutyAddr"));
            System.out.println("주소지 : " + getString(e, "dutyAddr"));
        } catch (Exception ex) {
        }
        try {
            System.out.println("팩스번호 : " + getString(e, "dutyFax"));
        } catch (Exception ex) {
        }
        try {
        	pharmacy.setPhname(getString(e, "dutyName"));
            System.out.println("약국 이름 : " + getString(e, "dutyName"));
        } catch (Exception ex) {
        }
        try {
        	pharmacy.setPhtel(getString(e, "dutyTel1"));
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
        
        try {
        	String startTimeTag;
        	String endTimeTag;
        	
            startTimeTag = "dutyTime" + 1 + "s";
            endTimeTag = "dutyTime" + 1 + "c";
            System.out.println("영업시간(" + getDayOfWeek(1) + ") : " + getString(e, startTimeTag) + "~" + getString(e, endTimeTag));
            if(getString(e, startTimeTag) != null) {
            	String startTime = getString(e, startTimeTag);
            	String endTime = getString(e, endTimeTag);
            	pharmacy.setPhop1s(startTime);
            	pharmacy.setPhop1e(endTime);
            }
            
            startTimeTag = "dutyTime" + 2 + "s";
            endTimeTag = "dutyTime" + 2 + "c";
            System.out.println("영업시간(" + getDayOfWeek(2) + ") : " + getString(e, startTimeTag) + "~" + getString(e, endTimeTag));
            if(getString(e, startTimeTag) != null) {
            	String startTime = getString(e, startTimeTag);
            	String endTime = getString(e, endTimeTag);
            	pharmacy.setPhop2s(startTime);
            	pharmacy.setPhop2e(endTime);
            }
            
            startTimeTag = "dutyTime" + 3 + "s";
            endTimeTag = "dutyTime" + 3 + "c";
            System.out.println("영업시간(" + getDayOfWeek(3) + ") : " + getString(e, startTimeTag) + "~" + getString(e, endTimeTag));
            if(getString(e, startTimeTag) != null) {
            	String startTime = getString(e, startTimeTag);
            	String endTime = getString(e, endTimeTag);
            	pharmacy.setPhop3s(startTime);
            	pharmacy.setPhop3e(endTime);
            }
            
            startTimeTag = "dutyTime" + 4 + "s";
            endTimeTag = "dutyTime" + 4 + "c";
            System.out.println("영업시간(" + getDayOfWeek(4) + ") : " + getString(e, startTimeTag) + "~" + getString(e, endTimeTag));
            if(getString(e, startTimeTag) != null) {
            	String startTime = getString(e, startTimeTag);
            	String endTime = getString(e, endTimeTag);
            	pharmacy.setPhop4s(startTime);
            	pharmacy.setPhop4e(endTime);
            }
            
            startTimeTag = "dutyTime" + 5 + "s";
            endTimeTag = "dutyTime" + 5 + "c";
            System.out.println("영업시간(" + getDayOfWeek(5) + ") : " + getString(e, startTimeTag) + "~" + getString(e, endTimeTag));
            if(getString(e, startTimeTag) != null) {
            	String startTime = getString(e, startTimeTag);
            	String endTime = getString(e, endTimeTag);
            	pharmacy.setPhop5s(startTime);
            	pharmacy.setPhop5e(endTime);
            }
            
            startTimeTag = "dutyTime" + 6 + "s";
            endTimeTag = "dutyTime" + 6 + "c";
            System.out.println("영업시간(" + getDayOfWeek(6) + ") : " + getString(e, startTimeTag) + "~" + getString(e, endTimeTag));
            if(getString(e, startTimeTag) != null) {
            	String startTime = getString(e, startTimeTag);
            	String endTime = getString(e, endTimeTag);
            	pharmacy.setPhop6s(startTime);
            	pharmacy.setPhop6e(endTime);
            }
            
            startTimeTag = "dutyTime" + 7 + "s";
            endTimeTag = "dutyTime" + 7 + "c";
            System.out.println("영업시간(" + getDayOfWeek(7) + ") : " + getString(e, startTimeTag) + "~" + getString(e, endTimeTag));
            if(getString(e, startTimeTag) != null) {
            	String startTime = getString(e, startTimeTag);
            	String endTime = getString(e, endTimeTag);
            	pharmacy.setPhop7s(startTime);
            	pharmacy.setPhop7e(endTime);
            }
            
            
            startTimeTag = "dutyTime" + 8 + "s";
            endTimeTag = "dutyTime" + 8 + "c";
            System.out.println("영업시간(" + getDayOfWeek(8) + ") : " + getString(e, startTimeTag) + "~" + getString(e, endTimeTag));
            if(getString(e, startTimeTag) != null) {
            	String startTime = getString(e, startTimeTag);
            	String endTime = getString(e, endTimeTag);
            	pharmacy.setPhop8s(startTime);
            	pharmacy.setPhop8e(endTime);
            }
            
		} catch (Exception e2) {
		}

        try {
            System.out.println("기관ID : " + getString(e, "hpid"));
        } catch (Exception ex) {
        }

        try {
            System.out.println("우편번호 : " + getString(e, "postCdn1") + getString(e, "postCdn2"));
        } catch (Exception ex) {
        }

        try {
        	pharmacy.setPhlong(getString(e, "wgs84Lon"));
        	pharmacy.setPhlati(getString(e, "wgs84Lat"));
            System.out.println("병원좌표(경도,위도) : (" + getString(e, "wgs84Lat") + "," + getString(e, "wgs84Lon") + ")");
        } catch (Exception ex) {
        }
        
		return pharmacy;
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
