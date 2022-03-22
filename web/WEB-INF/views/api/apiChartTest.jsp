<%--
  Created by IntelliJ IDEA.
  User: samin
  Date: 2022-03-22
  Time: 오후 5:12
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>API 차트 혼합 테스트</title>

    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
</head>
<body>
    <div id="canvas_Chart">
        <canvas id="myChart" width="1000" height="800"></canvas>
    </div>
</body>

<script>
    const gu_name = new Array();
    const gu_mise = new Array();

    $.ajax({
        type : "GET",
        url :  "http://openapi.seoul.go.kr:8088/6d4d776b466c656533356a4b4b5872/json/RealtimeCityAir/1/99",
        data : {},
        success: function (response){
            let mise = response['RealtimeCityAir']['row'];
            for (let i = 0; i < mise.length; i++){
                let gu_name1 = mise[i]["MSRSTE_NM"];
                gu_name[i] = gu_name1;
                let gu_mise1 = mise[i]["IDEX_MVL"];

                if (gu_mise1 > 50) {
                    gu_mise[i] = gu_mise1;
                }
            }
            chartDraw(gu_name,gu_mise);
        }
    });

    function chartDraw(gu_name, gu_mise){

        const ctx = document.getElementById("myChart").getContext('2d');

        const myChart = new Chart(ctx, {
            type: "bar",
            data: {
                labels: gu_name,
                datasets: [{
                    label: '서울시 구역별 미세먼지 농도',
                    data: gu_mise,
                    backgroundColor: [
                        'rgba(172, 22, 53, 0.7)',
                        'rgba(16, 94, 147, 0.7)',
                        'rgba(225, 174, 53, 0.7)',
                        'rgba(31, 168, 168, 0.7)',
                        'rgba(120, 72, 218, 0.7)',
                        'rgba(175, 49, 183, 0.7)',
                        'rgba(102, 157, 99, 0.7)',
                        'rgba(68, 85, 122, 0.7)',
                        'rgba(231, 128, 25, 0.7)',
                        'rgba(189, 37, 92, 0.7)',
                        'rgba(14, 11, 8, 0.7)',
                        'rgba(131, 191, 194, 0.7)',
                        'rgba(228, 232, 126, 0.7)',
                        'rgba(157, 64, 47, 0.7)',
                        'rgba(47, 19, 169, 0.7)',
                        'rgba(148, 9, 9, 0.7)',
                        'rgba(97, 124, 22, 0.7)'

                    ],
                    borderColor: [
                        'rgb(172, 22, 53)',
                        'rgb(16, 94, 147)',
                        'rgb(225, 174, 53)',
                        'rgb(31, 168, 168)',
                        'rgb(120, 72, 218)',
                        'rgb(210, 142, 73)',
                        'rgb(102, 157, 99)',
                        'rgb(68, 85, 122)',
                        'rgb(231, 128, 25)',
                        'rgb(189, 37, 92)',
                        'rgb(14, 11, 8)',
                        'rgb(131, 191, 194)',
                        'rgb(228, 232, 126)',
                        'rgb(157, 64, 47)',
                        'rgb(47, 19, 169)',
                        'rgb(148, 9, 9)',
                        'rgb(97, 124, 22)'
                    ],
                    borderWidth: 1
                }]
            },
            options: {
                responsive : false,
                scales: {
                    y: {
                        beginAtZero: true
                    }
                }
            }
        })
    }
</script>
</html>
