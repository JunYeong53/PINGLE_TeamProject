<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="EUC-KR">
<title>PINGLE</title>

<link href="../testcss2/css/common.css" rel="stylesheet" type="text/css">
<link href="../testcss2/css/selflove.css" rel="stylesheet" type="text/css">
<link href="../testcss2/css/sub_laylout.css" rel="stylesheet" type="text/css">


<script type="text/javascript" src="../testcss2/js/jquery-1.11.0.min.js"></script>
<script type="text/javascript" src="../testcss2/js/include_ex_script.js"></script>


<script type="text/javascript">
   var main_step = 0;
   var array_answer = "";
   var array_question = [ "���� ������ ���� ���� �ʴ´�.", "���� ���� ���� ���� �����Ѵ�.",
         "���� ��� ���� ��ȹ�� ������ �Ѵ�.", "���� ����� ���̵����� ���� ������ �ִ�.",
         "���� ����� ���ϰ� �Ѵ�.", "���� ������ ���� �� �� ���ڸ��� ���� ����<br />���� ���� �ش´�.",
         "���� ������ ����.", "���� ��ƴ��� �������� �͵��� �д� ����<br />�����Ѵ�.",
         "���� �����ؼ��� ¥������ �ʴ´�.", "���� �ٸ� ������� ���� �ٰ����� ���Ѵ�.", "���� ������ �����ϴ�.",
         "���� ������ �ؾ� �ϴ� ������ �ϵ���<br />�̷��� �ʰ� �ٷ� �� ġ���.",
         "���� ��ȭ�� ���� �����ϴ� ���̴�.", "���� � ���� �� ���ο� �������<br />�غ��⸦ �����Ѵ�.",
         "�� ������� ���� Ǯ���� ������ �Ǹ����� �״�� ǥ���Ѵ�.", "���� ��Ʈ������ �� �޴´�." ];

   function change_answer_state(obj) {
      var now_index;

      now_index = $("#SLForm").find(":radio[name='answer']").index(obj);

      if (array_answer != "") {
         array_answer = array_answer
               + ","
               + $("#SLForm").find(":radio[name='answer']").eq(now_index)
                     .val();
      } else {
         array_answer = $("#SLForm").find(":radio[name='answer']").eq(
               now_index).val();
      }

      $(".answer").eq(0).removeClass("on");
      $(".answer").eq(1).removeClass("on");
      $(".answer").eq(2).removeClass("on");
      $(".answer").eq(3).removeClass("on");

      if (now_index == 0) {
         $(".answer").eq(0).addClass("on");
         $(".answer").eq(1).removeClass("on");
         $(".answer").eq(2).removeClass("on");
         $(".answer").eq(3).removeClass("on");

         $("#SLForm").find(":radio[name='answer']").eq(0).prop("checked",
               true);
         $("#SLForm").find(":radio[name='answer']").eq(1).prop("checked",
               false);
         $("#SLForm").find(":radio[name='answer']").eq(2).prop("checked",
               false);
         $("#SLForm").find(":radio[name='answer']").eq(3).prop("checked",
               false);
      } else if (now_index == 1) {
         $(".answer").eq(0).removeClass("on");
         $(".answer").eq(1).addClass("on");
         $(".answer").eq(2).removeClass("on");
         $(".answer").eq(3).removeClass("on");

         $("#SLForm").find(":radio[name='answer']").eq(0).prop("checked",
               false);
         $("#SLForm").find(":radio[name='answer']").eq(1).prop("checked",
               true);
         $("#SLForm").find(":radio[name='answer']").eq(2).prop("checked",
               false);
         $("#SLForm").find(":radio[name='answer']").eq(3).prop("checked",
               false);
      } else if (now_index == 2) {
         $(".answer").eq(0).removeClass("on");
         $(".answer").eq(1).removeClass("on");
         $(".answer").eq(2).addClass("on");
         $(".answer").eq(3).removeClass("on");

         $("#SLForm").find(":radio[name='answer']").eq(0).prop("checked",
               false);
         $("#SLForm").find(":radio[name='answer']").eq(1).prop("checked",
               false);
         $("#SLForm").find(":radio[name='answer']").eq(2).prop("checked",
               true);
         $("#SLForm").find(":radio[name='answer']").eq(3).prop("checked",
               false);
      } else if (now_index == 3) {
         $(".answer").eq(0).removeClass("on");
         $(".answer").eq(1).removeClass("on");
         $(".answer").eq(2).removeClass("on");
         $(".answer").eq(3).addClass("on");

         $("#SLForm").find(":radio[name='answer']").eq(0).prop("checked",
               false);
         $("#SLForm").find(":radio[name='answer']").eq(1).prop("checked",
               false);
         $("#SLForm").find(":radio[name='answer']").eq(2).prop("checked",
               false);
         $("#SLForm").find(":radio[name='answer']").eq(3).prop("checked",
               true);
      }

      setTimeout("change_question()", 500);
   }

   function change_question() {
      main_step = main_step + 1;

      if (main_step == 16) {
         //alert(array_answer);

         document.trForm.answer.value = array_answer;
         document.trForm.submit();
         return;
      }

      $(".question_text").html(
            (main_step + 1) + ". " + array_question[main_step]);

      if (main_step > 8) {
         $(".count_text").html("[ " + ((16 - main_step)) + "���� ���ҽ��ϴ� ]");
      }

      $(".answer").eq(0).removeClass("on");
      $(".answer").eq(1).removeClass("on");
      $(".answer").eq(2).removeClass("on");
      $(".answer").eq(3).removeClass("on");

      $("#SLForm").find(":radio[name='answer']").eq(0).prop("checked", false);
      $("#SLForm").find(":radio[name='answer']").eq(1).prop("checked", false);
      $("#SLForm").find(":radio[name='answer']").eq(2).prop("checked", false);
      $("#SLForm").find(":radio[name='answer']").eq(3).prop("checked", false);
   }

   $(document).ready(function() {
      var toggled = true;
      $("img").on('click', function() {
         $(this).attr("src", "/html/love_test/self_love/img/btn_02.png");
         setTimeout(function() {
            $("#step_area").animate({
               "marginTop" : "-=723px"
            }, 300);
         }, 500);
      });

      $(".main_bg").fadeIn(800, function() {
         $("#flip").slideDown(300, function() {
            $(".second").show();
         });
      });
   });
</script>


<script
   src="https://googleads.g.doubleclick.net/pagead/viewthroughconversion/4445655678/?random=1580794638527&amp;cv=9&amp;fst=1580794638527&amp;num=1&amp;guid=ON&amp;resp=GooglemKTybQhCsO&amp;u_h=864&amp;u_w=1536&amp;u_ah=824&amp;u_aw=1536&amp;u_cd=24&amp;u_his=6&amp;u_tz=540&amp;u_java=false&amp;u_nplug=3&amp;u_nmime=4&amp;gtm=2wg1m0&amp;sendb=1&amp;ig=1&amp;frm=0&amp;url=https%3A%2F%2Fwww.duo.co.kr%2Fhtml%2Flove_test%2Fself_love%2Fself_love_main.asp%3Fu_div%3D&amp;ref=https%3A%2F%2Fwww.duo.co.kr%2Fhtml%2Flove_test%2Fmain.asp&amp;tiba=%EB%93%80%EC%98%A4-%ED%95%9C%EA%B5%AD%EB%8C%80%ED%91%9C%EA%B2%B0%ED%98%BC%EC%A0%95%EB%B3%B4%ED%9A%8C%EC%82%AC&amp;hn=www.googleadservices.com&amp;async=1&amp;rfmt=3&amp;fmt=4"></script>
</head>


 
</head>    
<body> 
<div id="selflove" style="height:723px;overflow:hidden;">
      <form name="trForm" method="post" action="self_love_result.shop">
         <input type="hidden" name="answer" value="">  
         <input type="hidden" name="u_div" value="">  
      </form>
      <div id="step_area" style="margin-top: -723px;">
         <div class="first main_bg" style="height: 723px;">
            <div class="temp">
               <h1>����� �󸶳� ���ָ� ���� �غ� �Ǿ� �ֳ���? ���������˻�</h1>
               <div>����޸ն����������ҿ��� ���� ������ ü������ �м��� ���� ������<br>���������˻�� ����� �󸶳� ������ ���� �غ� �Ǿ� �ִ���<br>����� ������ �帳�ϴ�.</div>
               <a id="flip" style="cursor: pointer;"><img src="/html/love_test/self_love/img/btn_02.png"></a>
            </div>
         </div>

         <div class="second" style="height: 723px;">
         <form name="SLForm" id="SLForm" method="post" class="temp">
            <input type="hidden" name="array_answer" value="">

            <h1>����� �󸶳� ���ָ� ���� �غ� �Ǿ� �ֳ���? ���������˻�</h1>         
            <div class="q">
            <div class="middle question_text">      
            <!--
            1. ���� ������ ���� ���� �ʴ´�.
            2. ���� ���� ���� ���� �����Ѵ�.
            3. ���� ��� ���� ��ȹ�� ������ �Ѵ�.
            4. ���� ����� ���̵����� ���� ������ �ִ�.
            5. ���� ����� ���ϰ� �Ѵ�.
            6. ���� ������ ���� �� �� ���ڸ��� ���� ����<br />���� ���� �ش´�.
            7. ���� ������ ����.
            8. ���� ��ƴ��� �������� �͵��� �д� ����<br />�����Ѵ�.
            9. ���� �����ؼ��� ¥������ �ʴ´�.
            10. ���� �ٸ� ������� ���� �ٰ����� ���Ѵ�.
            11. ���� ������ �����ϴ�.
            12. ���� ������ �ؾ� �ϴ� ������ �ϵ���<br />�̷��� �ʰ� �ٷ� �� ġ���.
            13. ���� ��ȭ�� ���� �����ϴ� ���̴�.
            14. ���� � ���� �� ���ο� �������<br />�غ��⸦ �����Ѵ�.
            15. �� ������� ���� Ǯ���� ������ �Ǹ����� �״�� ǥ���Ѵ�.
            16. ���� ��Ʈ������ �� �޴´�.
            -->
            1. ���� ������ ���� ���� �ʴ´�.
            </div>
            </div>
            <div class="a">
               <table width="100%" border="0" cellspacing="0" cellpadding="0">
                  <tbody><tr>
                     <td width="11" height="89"></td>
                     <td width="89">
                        <label class="answer">
                           <input type="radio" name="answer" value="1" onclick="change_answer_state(this);">
                        </label>
                     </td>
                     <td width="11"></td>
                     <td width="11"></td>
                     <td width="89">
                        <label class="answer"> 
                           <input type="radio" name="answer" value="3" onclick="change_answer_state(this);">
                        </label>
                     </td>
                     <td width="11"></td>
                     <td width="11"></td>
                     <td width="89">
                        <label class="answer">
                           <input type="radio" name="answer" value="5" onclick="change_answer_state(this);">
                        </label>
                     </td>
                     <td width="11"></td>
                     <td width="11"></td>
                     <td width="89">
                        <label class="answer">
                           <input type="radio" name="answer" value="7" onclick="change_answer_state(this);">
                        </label>
                     </td>
                     <td width="11"></td>
                     <!--
                     <td width="11"></td>
                     <td width="89">
                        <label class="answer">
                           <input type="radio" name="answer" value="5" onclick="change_answer_state(this);" />
                        </label>
                     </td>
                     <td width="11"></td-->
                  </tr>
               </tbody></table>
            </div>
            <div class="state">  
               <div>�׷����ʴ�</div>
               <img src="../testcss2/img/self_01.png">
               <div>�����̴�</div>
               <img src="../testcss2/img/self_02.png">
               <div>�ſ�׷���</div>
            </div>   
            <div class="remain count_text"></div>
         </form>
         </div> 
      </div>
   </div>
</body>
</html>