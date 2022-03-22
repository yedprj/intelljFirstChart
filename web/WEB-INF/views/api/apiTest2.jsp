<%--
  Created by IntelliJ IDEA.
  User: samin
  Date: 2022-03-21
  Time: 오후 5:20
  To change this template use File | Settings | File Templates.
--%>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.2/dist/css/bootstrap.min.css" rel="stylesheet">

    <title>서울시 현재 미세먼지 농도 측정표</title>

</head>
<body>
    <h1>서울시 현재 미세먼지 농도 측정표</h1>
    <table id="table-box" class="table table-dark table-striped">
        <thead>
            <tr>
                <td>#</td>
                <td>측정일시</td>
                <td>지역</td>
                <td>미세먼지 상태</td>
                <td>미세먼지 지수</td>
            </tr>
        </thead>

    </table>
</body>
<script>

    $(document).ready(function (){
        $.ajax({
            type: "GET",
            url : "http://openapi.seoul.go.kr:8088/6c65735470646e673935624a507246/json/RealtimeCityAir/1/99",
            data : {},
            success : function (response) {
                let dusty_data = response['RealtimeCityAir']['row'];

                for (let i = 0; i < dusty_data.length; i++) {
                    put_data(i, dusty_data[i]['MSRDT'], dusty_data[i]['MSRSTE_NM'], dusty_data[i]['IDEX_NM'], dusty_data[i]['IDEX_MVL']);
                }
            }
        })

        function put_data(num, date, district, index_estimation, index){
            let table_html = '<tbody>\
                <tr>\
                    <th scope="row">'+(num+1)+'</th>\
                    <td>'+date+'</td>\
                    <td>'+district+'</td>\
                    <td>'+index_estimation+'</td>\
                    <td>'+index+'</td>\
                </tr>\
            </tbody>'

            $('#table-box').append(table_html);
        }
    });
</script>
</html>
