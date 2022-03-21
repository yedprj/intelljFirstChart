<%--
  Created by IntelliJ IDEA.
  User: samin
  Date: 2022-03-21
  Time: 오후 2:53
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Api 연습</title>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <style type="text/css">
        div.question-box {
            margin : 10px 0 20px 0;
        }
        .red {
            color : red;
        }
        .blue {
            color : blue;
        }
    </style>
</head>
<body>
    <h1>웹 페이지에 나타내보기</h1>

    <hr/>

    <div class="question-box">
        <h2>1. 서울시 OpenAPI(실시간 미세먼지 상태)를 이용</h2>
        <p>업데이트 버튼을 누를 때마다 지웠다 새로 씌어져야 한다.</p>
        <button onclick="ql()">업데이트</button>
        <ul id="names-ql">
            <li>중구 : 82</li>
            <li>종로구 : 87</li>
            <li>용산구 : 84</li>
            <li>은평구 : 82</li>
        </ul>
    </div>
</body>

<script>

    function ql(){
        $.ajax({
            type: "GET",
            url : "http://openapi.seoul.go.kr:8088/6d4d776b466c656533356a4b4b5872/json/RealtimeCityAir/1/99",
            data: {},
            success: function (response){
                $("#names-ql").empty();
                let mise = response['RealtimeCityAir']['row'];
                for (let i = 0; i < mise.length; i++){
                    let gu_name = mise[i]["MSRSTE_NM"];
                    let gu_mise = mise[i]["IDEX_MVL"];

                    let str_mise = '';

                    if(gu_mise >= 55){
                        str_mise = "<li class='red'>" + gu_name + " : " +gu_mise + "</li>";
                    } else {
                        str_mise = "<li class='blue'>" + gu_name + " : " +gu_mise + "</li>";
                    }
                    $("#names-ql").append(str_mise);
                }
                console.log(response);
            }
        })
    }
</script>
</html>
