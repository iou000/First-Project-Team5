<%--
  작성자 : 김지혜
  Date: 3/11/22
--%>
<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
<%@ include file="../header.jsp" %>
<head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages':['corechart', 'bar']});
        google.charts.setOnLoadCallback(drawStuff);

        function drawStuff() {

            let button = document.getElementById('change-chart');
            let chartDiv = document.getElementById('chart_div');
            let categoryStr = '${categoryStr}';
            console.log(categoryStr);
            let categoryJSON = JSON.parse(categoryStr)
            console.log(categoryJSON)

            let data = google.visualization.arrayToDataTable([
                ['음식 분류', '조회수', '평점수'],
                [categoryJSON[0].category, categoryJSON[0].view_average, categoryJSON[0].grade_average],
                [categoryJSON[1].category, categoryJSON[1].view_average, categoryJSON[1].grade_average],
                [categoryJSON[2].category, categoryJSON[2].view_average, categoryJSON[2].grade_average],
                [categoryJSON[3].category, categoryJSON[3].view_average, categoryJSON[3].grade_average],
                [categoryJSON[4].category, categoryJSON[4].view_average, categoryJSON[4].grade_average],
                [categoryJSON[5].category, categoryJSON[5].view_average, categoryJSON[5].grade_average],
                [categoryJSON[6].category, categoryJSON[6].view_average, categoryJSON[6].grade_average]
            ]);

            let materialOptions = {
                width: 900,
                chart: {
                    title: '음식 분류별 조회수 & 평점수',
                    subtitle: '미리 분류한 한식 .. 양식 별 사용자의 조회수와 평점수이 평균을 column chart 를 통해 나타내었습니다.'
                },
                series: {
                    0: { axis: 'distance' }, // Bind series 0 to an axis named 'distance'.
                    1: { axis: 'brightness' } // Bind series 1 to an axis named 'brightness'.
                },
                axes: {
                    y: {
                        distance: {label: '조회수'}, // Left y-axis.
                        brightness: {side: 'right', label: '평점수'} // Right y-axis.
                    }
                }
            };

            let classicOptions = {
                width: 900,
                series: {
                    0: {targetAxisIndex: 0},
                    1: {targetAxisIndex: 1}
                },
                title: '음식 분류별 조회수 & 평점수',
                vAxes: {
                    // Adds titles to each axis.
                    0: {title: '조회수'},
                    1: {title: '평점수'}
                }
            };

            function drawMaterialChart() {
                let materialChart = new google.charts.Bar(chartDiv);
                materialChart.draw(data, google.charts.Bar.convertOptions(materialOptions));
                button.innerText = 'Change to Classic';
                button.onclick = drawClassicChart;
            }

            function drawClassicChart() {
                let classicChart = new google.visualization.ColumnChart(chartDiv);
                classicChart.draw(data, classicOptions);
                button.innerText = 'Change to Material';
                button.onclick = drawMaterialChart;
            }

            drawMaterialChart();
        };
    </script>
</head>
<div id="wrap" class="chart">
    <button id="change-chart">Change to Classic</button>
    <h2>Hello ${loginUser.username}</h2>
    <h2>${categoryList[0].category}</h2>
    <br><br>
    <div id="chart_div" style="width: 800px; height: 500px;"></div>
</div>
