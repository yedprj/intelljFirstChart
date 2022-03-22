<%--
  Created by IntelliJ IDEA.
  User: samin
  Date: 2022-03-21
  Time: 오전 10:24
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
  <head>
    <title>차트 적용하기</title>
    <!-- chart.js CDN 추가 -->
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.4.0/Chart.min.js"></script>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
  </head>
  <body>
    <button id="bar" name="bar"> Bar 형식 그래프 </button>
    <button id="line" name="line"> Line 형식 그래프 </button>
    <button id="pie" name="pie"> Pie 형식 그래프 </button>
    <button id="doughnut" name="doughnut"> Doughnut 형식 그래프 </button>
    <button id="horizontalBar" name="horizontalBar"> HorizontalBar 형식 그래프 </button>
    <button type="button" onClick="location.href='${pageContext.request.contextPath}/api/apiTest'"> Api 테스트 페이지로 </button>
    <button type="button" onClick="location.href='${pageContext.request.contextPath}/api/apiTest2'"> Api 테스트2 페이지로 </button>
    <button type="button" onClick="location.href='${pageContext.request.contextPath}/api/chartTest'"> google chart 테스트 페이지로 </button>
    <button type="button" onClick="location.href='${pageContext.request.contextPath}/api/apiChartTest'"> API CHART 테스트 페이지로 </button>
    <div id="canvas_Chart">
      <canvas id="myChart" width="600" height="600"></canvas>
    </div>
  </body>

  <script>
    let types = "";

    $("#line").on('click', function(e){
      e.preventDefault();

      types = "line";
      chartDraw(types);
    })


    $("#bar").on("click",function(e){
      e.preventDefault();

      types = 'bar';
      chartDraw(types);
    })


    $("#pie").on("click",function(e){
      e.preventDefault();

      types = 'pie';
      chartDraw(types);
    })

    $("#doughnut").on("click",function(e){
      e.preventDefault();

      types = 'doughnut';
      chartDraw(types);
    })

    $("#horizontalBar").on("click",function(e){
      e.preventDefault();

      types = 'horizontalBar';
      chartDraw(types);
    })

    function chartDraw(types){
      $("#myChart").remove();
      $("#canvas_Chart").append('<canvas id="myChart" width="600" height="600"></canvas>');

      const ctx = document.getElementById("myChart").getContext('2d');

      const myChart = new Chart(ctx, {
        type: types,
        data: {
          labels: ['Red', 'Blue', 'Yellow', 'Green', 'Purple', 'Orange'],
          datasets: [{
            label: '# of Votes',
            data: [12, 19, 3, 5, 10, 3],
            backgroundColor: [
              'rgba(255, 99, 132, 0.2)',
              'rgba(54, 162, 235, 0.2)',
              'rgba(255, 206, 86, 0.2)',
              'rgba(75, 192, 192, 0.2)',
              'rgba(153, 102, 255, 0.2)',
              'rgba(255, 159, 64, 0.2)'
            ],
            borderColor: [
              'rgba(255, 99, 132, 1)',
              'rgba(54, 162, 235, 1)',
              'rgba(255, 206, 86, 1)',
              'rgba(75, 192, 192, 1)',
              'rgba(153, 102, 255, 1)',
              'rgba(255, 159, 64, 1)'
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
