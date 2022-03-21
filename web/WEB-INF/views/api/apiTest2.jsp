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
    <title>Document</title>
</head>
<body>
    <h1>대구광역시 공연 정보</h1>
    <hr>

    <div id="wrap" class="container">
        <!-- 공연 정보가 카드 형태로 들어갈 곳 -->
    </div>

    <div class="d-flex justify-content-center">
        <ul id="paging" class="pagination flex-wrap">
            <!-- 오늘의 주제 페이지 처리 버튼 부분 -->
        </ul>
    </div>

    <script>
        // 페이지 내 목록 제한
        const LIMIT = 3;

        // 카드리스트 컨테이너 노드
        let wrap = document.querySelector("#wrap");

        //페이지 처리 컨테이너 노드
        let paging = document.querySelector("#paging");

        // origin 경로
        let origin = window.location.origin;

        // 페이지 경로
        // origin+path로 request.getParameter를 만들고 태그에 파라미터 넘기기 위함
        let path = window.location.pathname;

        // Festv객체가 담길 배열 생성
        let jsonList = new Array();

        // 자바와 달리 파라미터 값 조회 기능이 없어서 만들어줍니다
        let request = {
            // window 프로퍼티에 전역객체 window를 저장합니다.
            // 객체 함수의 함수 내에서 this가 객체 자신이 되어서 window가 잡히지 않습니다.
            window: window,
            getParameter: function(param){
                if (typeof param == 'string'){
                    let map = new Map();
                    // search에서 ?기호를 잘라내고 이후 파라미터 증가 대비하여 &기호로 나눕니다.
                    let params = this.window.location.search.slice(1).split("&");

                    // = 기호로 다시 나누어 map에 key-value로 담습니다.
                    for (let key of params){
                        let sep = key.split("=");
                        map.set(sep[0], sep[1]);
                    }

                    if (map.get(param) == undefined){
                        throw "파라미터가 존재하지 않습니다.";
                    } else {
                        return mqp.get(param);
                    }
                } else {
                    throw "형식이 잘못되었습니다."
                }
            }
        }

        /*
        * XMLHttpRequest로 사용했습니다.
        * jquery의 ajax를 사용해도 좋습니다.
        * 간단하게 보여드리기 위해 동기식으로 가져와 구현
        * 참고로 XMLHttpRequest에서 open함수의 async = false는 Deprecate 되었습니다.*/
        let xhr = new XMLHttpRequest();
        xhr.onreadystatechange = function (){
            if (xhr.readyState === xhr.DONE){
                if (xhr.status === 200 || xhr.status === 201){
                    let num = 0; // 공연 객체 인덱스 번호

                    for (let key of JSON.parse(xhr.responseText)){
                        console.log(key);
                    }
                }
            }
        }
        xhr.open("GET", "list.json", false);
        xhr.send();

        function Festv(num, subject, content, place, start, end, type, payment) {
            this.num = num + 1;
            this.subject = subject;
            this.content = content;
            this.palce = place;
            this.start = start;
            this.end = end;
            this.type = type;
            this.payment = payment;
            this.template = function (){
                return `
                <div id="card" class="bg-light p-4 rounded-3 border border-primary mb-3">
                    <h3 class="text-truncate" title="${this.subject}">${this.num}-${this.subject}</h3>
                    <div class="my-3">${this.content==null?"내용이없습니다":this.content}</div>
                    <div>${this.place}</div>
                    <div>
                        <span class="badge bg-info">${this.start}</span>
                        <span class="badge bg-secondary">${this.end}</span>
                    </div>
                    <div class="fw-bold">${this.type}</div>
                    <div>${this.payment}`

            }
        }
    </script>
</body>
</html>
