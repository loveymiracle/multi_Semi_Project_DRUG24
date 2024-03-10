<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<c:set var="path" value="${pageContext.request.contextPath}"/>

<jsp:include page="/WEB-INF/views/common/header.jsp"/>
	<style>
      table {
        width: 100%;
        border-collapse: collapse;
      }

      th, td {
        border: 1px solid black;
        padding: 8px;
        text-align: center;
      }

      .counsel_tab {
        display: flex;
        justify-content: center;
      }

      .form_container {
        margin: 0 auto;
        text-align: center;
      }

      .ico {
        background-color: #f0f0f0;
        padding: 10px;
        text-align: center;
      }

      .form_info {
        list-style: none;
        padding: 0;
      }

      .form_info li {
        border: 1px solid #ddd;
        margin-bottom: 5px;
      }

      .form_info a {
        display: block;
        padding: 10px;
        text-decoration: none;
        color: #333;
        cursor: pointer;
      }

      .result-container {
        margin-top: 20px;
        padding: 20px;
        border: 1px solid #ddd;
      }
    </style>
    	<div class="container body-content">
        <div class="row" style="margin-top:5px;">
          <h2 style="text-align:center;">제형별 복약정보</h2>
          <div class="alert alert-info d-flex fs-md mb-1" role="alert">
            <div class="alert-icon fs-lg"><i class="ci-announcement"></i></div>
            <div><strong>약물 형태에 따른 일반적인 복용법이나 사용법을 확인하실 수 있습니다.</strong></div>
          </div>
          <article class="counsel_tab">
            <div class="form_container" id="form1">
              <h4 class="ico">경구제</h4>
              <table class="form_info">
                <tr>
                  <td><a onclick="moveform('result01')">건조시럽제</a></td>
                  <td><a onclick="moveform('result02')">구강붕해정</a></td>
                  <td><a onclick="moveform('result03')">박칼정</a></td>
                </tr>
                <tr>
                  <td><a onclick="moveform('result04')">발포정</a></td>
                  <td><a onclick="moveform('result05')">산제</a></td>
                  <td><a onclick="moveform('result06')">설하정</a></td>
                </tr>
                <tr>
                  <td><a onclick="moveform('result07')">액제</a></td>
                  <td><a onclick="moveform('result08')">정제, 캡슐제</a></td>
                  <td><a onclick="moveform('result09')">츄어블정</a></td>
                </tr>
              </table>
            </div>
            <div class="form_container" id="form2">
              <h4 class="ico">외용제</h4>
              <table class="form_info" style="margin-bottom: 10%;">
                <tr>
                  <td><a onclick="moveform('result10')">가글제</a></td>
                  <td><a onclick="moveform('result11')">관장액</a></td>
                  <td><a onclick="moveform('result12')">비강분무제</a></td>
                  <td><a onclick="moveform('result13')">연고, 크림, 로션</a></td>
                </tr>
                <tr>
                  <td><a onclick="moveform('result14')">점비제(코)</a></td>
                  <td><a onclick="moveform('result15')">점안제</a></td>
                  <td><a onclick="moveform('result16')">점이제(귀)</a></td>
                  <td><a onclick="moveform('result17')">질 좌제</a></td>
                </tr>
                <tr>
                  <td><a onclick="moveform('result18')">패취제</a></td>
                  <td><a onclick="moveform('result19')">항문 좌제(좌약)</a></td>
                  <td><a onclick="moveform('result20')">흡입제(에어로졸)</a></td>
                  <td><a onclick="moveform('result21')">흡입제(터부헬러)</a></td>
                </tr>
              </table>
            </div>
          </article>
          <article id="result">
            <div id="result10" class="druginfo">
              <h4 class="title_dept3 ico">가글제</h4>
              <p>삼키지 말고 입안에 약 15~30초 머금고 있은 후 뱉도록 합니다.</p>
            </div>
            <div i d="result01" class="druginfo">
              <h4 id="result01" class="title_dept3 ico">건조시럽제</h4>
              <p>정확한 양의 물을 부어 복용 직전에 충분히 흔들어 섞은 후, 거품이 가라앉은 뒤에 복용합니다. 일부 건조시럽은 냉장고에 보관해야 합니다. 건조시럽에 따라 유효기간이 다르므로 주의해야 합니다.</p>
            </div>
            <div id="result11" class="druginfo">
              <h4 class="title_dept3 ico">관장액</h4>
              <p>가능한 배변 후에 사용하도록 합니다.</p>
              <p>왼쪽으로 누운 자세에서 약을 흔들어 녹인 다음 항문을 통해 직장 내로 삽입하도록 합니다.</p>
              <p>사용 전 노즐 부분에 바셀린 또는 윤활유 젤을 바르도록 합니다.</p>
            </div>
            <div id="result02" class="druginfo">
              <h4 class="title_dept3 ico">구강붕해정</h4>
              <p>혀 위에 놓고 녹여서 물과 함께 복용하거나 물 없이 복용할 수 있습니다.</p>
              <p>구강 내에서 타액으로 신속하게 녹는 약이므로 물을 삼키기 어려운 환자들에게 좋습니다.</p>
            </div>
            <div id="result03" class="druginfo">
              <h4 class="title_dept3 ico">박칼정</h4>
              <p>뺨과 잇몸 사이에 넣어서 천천히 녹여서 복용합니다. 씹거나 그대로 삼키지 않도록 주의합니다.</p>
            </div>
            <div id="result04" class="druginfo">
              <h4 class="title_dept3 ico">발포정</h4>
              <p>물에 녹이면 기포가 발생하도록 만든 것으로 정제 한 알을 한 컵의 물에 녹여서 복용하도록 합니다.</p>
            </div>
            <div id="result12" class="druginfo">
              <h4 class="title_dept3 ico">비강분무제</h4>
              <p>사용 전 아래 위로 잘 흔든 후 시험 분사를 해보도록 합니다.</p>
              <p>코를 풀어 코 안을 깨끗이 한 후 고개를 약간만 뒤로 젖혀 용기의 주입 부분을 비공에 삽입하도록 합니다. 입은 다물고 다른 쪽 비공은 한 손가락으로 막은 채 숨을 가볍게 들이 쉬면서 약을 분무 합니다. 4~5초간 숨을 멈춘 후 입으로 서서히 내쉬도록 합니다.</p>
              <p>비공에서 흡입제 용기를 빼고 약이 흘러내리지 않도록 계속 코를 훌쩍이며 들이쉬도록 합니다.</p>
            </div>
            <div id="result05" class="druginfo">
              <h4 class="title_dept3 ico">산제</h4>
              <p>적당량의 물에 섞어서 복용하거나 미리 입에 물을 머금은 후 복용합니다.</p>
              <p>맛이나 냄새가 강하여 먹기 어려운 경우에는 가루를 싸서 먹는 오블라이트나 캡슐에 넣어서 먹으면 복용하기가 용이합니다.</p>
              <p>변질되기 쉬우므로 고온, 습기가 많은 곳이나 직사광선이 닿는 장소에 두지 않도록 합니다.</p>
            </div>
            <div id="result06" class="druginfo">
              <h4 class="title_dept3 ico">설하정</h4>
              <p>혀 밑에 넣고 녹을 때까지 천천히 기다립니다. 혀 점막을 통해 바로 흡수되는 약이므로 물과 함께 삼키면 약효가 떨어질 수도 있습니다. 복용 직후에 음식을 먹거나 양치질을 하지 않도록 합니다.</p>
            </div>
            <div id="result07" class="druginfo">
              <h4 class="title_dept3 ico">액제</h4>
              <p>계량컵이나 숟가락 등을 이용하여 정확한 양을 복용하도록 합니다.</p>
              <p>현탁액일 경우에는 복용 직전에 충분히 흔들어 잘 섞이게 한 후 복용하고 냉장고 등 냉암소에 보관하도록 합니다.</p>
            </div>
            <div id="result13" class="druginfo">
              <h4 class="title_dept3 ico">연고, 크림, 로션</h4>
              <p>손을 깨끗이 씻은 후 환부를 잘 씻고 수건 등으로 가볍게 닦은 후 바르도록 합니다.</p>
              <p>바르는 방법에는 ① 그대로 바르는 방법 ② 거즈나 천에 발라서 붙이는 방법 ③ 바른 위에 랩으로 싸는 방법 등이 있습니다. 약물에 따라 정해진 용법을 잘 따라야 합니다.</p>
              <p>피부에 바르는 약은 너무 많은 양을 바르게 되면 부작용을 나타낼 수 있는 반면 너무 적은 양을 바르면 원하는 약효를 기대할 수 없습니다.</p>
              <p>바르는 도중 가려움증, 발진 등 과민 증상이 나타나면, 사용을 중지하고 의사나 약사와 상담하도록 합니다.</p>
              <p>뚜껑을 잘 닫지 않으면 굳거나 변색될 수 있으므로 뚜껑을 잘 닫아 냉암소에 보관하도록 합니다.</p>
            </div>
            <div id="result14" class="druginfo">
              <h4 class="title_dept3 ico">점비제(코)</h4>
              <p>코를 풀어 코 안을 깨끗이 한 후 똑바로 눕거나 고개를 약간만 뒤로 젖혀서 비강을 위로 향하게 하여 액을 정해진 양 만큼 떨어뜨리거나 분무 합니다.</p>
              <p>약의 흡수율을 높이기 위해 그 자세 그대로 2~3분간 유지합니다.</p>
            </div>
            <div id="result15" class="druginfo">
              <h4 class="title_dept3 ico">점안제</h4>
              <p>손을 깨끗이 씻은 후 고개를 뒤로 젖히거나 누운 자세를 취해 눈을 위로 향하게 한 후 아래 눈꺼풀을 가볍게 당긴 후 지시된 양의 약을 넣습니다.</p>
              <p>눈을 감고 손가락으로 눈의 안쪽을 1분 정도 눌러줍니다. 이것은 눈으로 약물이 흡수되는 것을 증가시킬 뿐만 아니라 코와 입을 통해 약이 흡수되는 것을 줄여 전신 부작용의 위험을 줄여줍니다.</p>
              <p>두 개 이상의 점안제를 동시에 사용하는 경우에는 하나의 점안제를 넣은 후 적어도 5분이 경과한 다음에 다른 점안제를 점안하는 것이 좋습니다.</p>
              <p>연고형 점안제의 경우에는 약물 투여 후 일시적으로 시야가 흐려질 수도 있습니다.</p>
            </div>
            <div id="result16" class="druginfo">
              <h4 class="title_dept3 ico">점이제(귀)</h4>
              <p>손을 깨끗이 씻은 후 머리를 옆으로 하거나 옆으로 누운 자세로 귀가 위로 향하게 하고, 귓볼을 당겨서 지시된 약액을 떨어뜨리도록 합니다.</p>
              <p>그 후 약이 흘러 나오지 않도록 약 5분 정도 같은 자세를 유지하도록 합니다.</p>
            </div>
            <div id="result08" class="druginfo">
              <h4 class="title_dept3 ico">정제, 캡슐제</h4>
              <p>의사나 약사의 특별한 지시가 없는 한 물과 함께 복용해야 합니다. 커피, 차, 주스, 탄산음료 등과 복용할 경우 일부 약물의 작용에 영향을 미칠 수 있으니 주의하세요</p>
              <p>특정 약물은 충분한 물과 함께 복용해야 합니다. 식도에 자극을 줄 수 있기 때문에 복용 후 적어도 30분 동안은 똑바로 앉거나 서있는 자세를 유지해야 합니다.</p>
              <p>일부 약물은 위 점막을 보호하거나 흡수속도를 조절하기 위해서 특수하게 처리되기도 합니다. 따라서 씹어도 가능한 정제를 제외하고는 정제를 씹거나 부수지 말고 통째로 삼키도록 합니다. 캡슐제의 경우도 열거나 씹어서 복용하지 말고 통째로 삼키도록 합니다.</p>
            </div>
            <div id="result17" class="druginfo">
              <h4 class="title_dept3 ico">질 좌제</h4>
              <p>손 및 외음부를 깨끗이 씻은 후 약을 넣기 쉬운 자세를 취하도록 합니다.</p>
              <p>허리를 약간 구부리거나 옆으로 누워 다리를 상체에 붙이는 자세로 하면 투입하기가 편리합니다.</p>
              <p>검지, 중지를 이용하여 질 내로 넣은 후 질의 깊숙이 검지로 밀어 넣은 후 약 5분 정도 누운 자세를 취하도록 합니다.</p>
              <p>삽입이 어려운 경우는 물을 약간 묻혀 사용하도록 합니다.</p>
              <p>약은 냉장고에 보관하도록 하며 가능한 취침 전에 사용하도록 합니다.</p>
            </div>
            <div id="result09" class="druginfo">
              <h4 class="title_dept3 ico">츄어블정</h4>
              <p>츄어블정은 씹어서 먹어야 구강 내 모세혈관을 통해 흡수됩니다. 만약 그냥 삼킬 경우에는 위 장관 에서 분해 또는 용해되지 않아 흡수율이 저하되므로 꼭 씹어서 복용하도록 합니다.</p>
            </div>
            <div id="result18" class="druginfo">
              <h4 class="title_dept3 ico">패취제</h4>
              <p>손을 깨끗이 씻은 후 해당 부위에 붙이되 체모가 많은 부위는 피하도록 합니다.</p>
              <p>제제마다 작용시간이 다르므로 약효시간에 맞추어 갈아 붙이도록 합니다.</p>
            </div>
            <div id="result19" class="druginfo">
              <h4 class="title_dept3 ico">항문 좌제(좌약)</h4>
              <p>손을 깨끗이 씻은 후 뾰족한 부분을 항문 쪽으로 하여 삽입 한 후 밀려나지 않도록 약 1분 정도 누르고 있도록 합니다.</p>
              <p>허리를 약간 구부리거나 옆으로 누워 다리를 상체에 붙이는 자세로 하면 투입하기가 편리합니다.</p>
              <p>삽입이 어려운 경우에는 물을 약간 묻혀 사용하도록 합니다.</p>
              <p>배변 전에는 사용하지 않도록 합니다.</p>
            </div>
            <div id="result20" class="druginfo">
              <h4 class="title_dept3 ico">흡입제(에어로졸)</h4>
              <p>사용 전 용기를 흔들어서 약을 잘 섞은 후 숨을 끝까지 천천히 내쉬도록 합니다.</p>
              <p>머리를 뒤로 약간 젖히고 흡입구를 입술로 감싸듯이 문 다음 손가락으로 용기를 세게 누르며 천천히 숨을 들이 쉬면서 약을 흡입하도록 합니다.</p>
              <p>약이 충분히 흡수되도록 하기 위해 약 10초간 숨을 멈춘 다음 코를 통해 천천히 숨을 내쉬도록 합니다.</p>
              <p>2회 이상 사용하는 경우에는 적어도 1분 이상 간격을 두고 사용하도록 합니다.</p>
              <p>스테로이드제 의 경우에는 사용 후에 입안을 물로 잘 헹구고 흡입구는 주 1~2회 온수로 씻은 후 말려서 사용하도록 합니다.</p>
            </div>
            <div id="result21" class="druginfo">
              <h4 class="title_dept3 ico">흡입제(터부헬러)</h4>
              <p>겉 뚜껑을 돌려서 연 후 흡입기를 세운 상태로 아래쪽 손잡이를 오른쪽으로 끝까지 돌립니다.</p>
              <p>손잡이를 다시 왼쪽으로 돌리면 "딸깍" 소리가 나면서 1회 흡입용량이 준비 됩니다.</p>
              <p>숨을 깊게 내쉰 후 흡입기를 물고 숨을 재빨리, 깊게 들이마십니다.</p>
              <p>약 5~10초간 숨을 멈춘 뒤 천천히 내쉬도록 합니다.</p>
            </div>
            <div class="intro">
              <p class="ml0">이 정보는 허가사항과 학술문헌을 근거로 약학정보원에서 작성한 자료입니다. 개별 환자에 따른 상세한 복약정보는 의사나 약사에게 문의하시기 바랍니다.</p>
            </div>
          </article>
        </div>
      </div>
    
    
    
    
    
    
    
    
    </main>











<jsp:include page="/WEB-INF/views/common/footer.jsp"/>



