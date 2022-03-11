<jsp:useBean id="categoryList" scope="request" type="java.util.List"/>
<%--
  작성자 : 김지혜
  Date: 3/11/22
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>
    <script type="text/javascript">
        google.charts.load('current', {'packages': ['corechart', 'bar']});
        google.charts.setOnLoadCallback(drawStuff(${categoryList}));

        function drawStuff(categoryList) {

            let button = document.getElementById('change-chart');
            let chartDiv = document.getElementById('chart_div');
            console.log(categoryList)

            let data = google.visualization.arrayToDataTable(
                [
                    ['Category', 'view', 'grade'],
                    [${categoryList[0].category}, ${categoryList[0].view}, ${categoryList[0].grade}],
                    [${categoryList[1].category}, ${categoryList[1].view}, ${categoryList[1].grade}],
                    [${categoryList[2].category}, ${categoryList[2].view}, ${categoryList[2].grade}],
                    [${categoryList[3].category}, ${categoryList[3].view}, ${categoryList[3].grade}],
                    [${categoryList[4].category}, ${categoryList[4].view}, ${categoryList[4].grade}],
                    [${categoryList[5].category}, ${categoryList[5].view}, ${categoryList[5].grade}],
                    [${categoryList[6].category}, ${categoryList[6].view}, ${categoryList[6].grade}],
                ]
            );
            

            let materialOptions = {
                width : 900,
                chart : {
                    title   : '분류별 레시피 조회수 & 평점수',
                    subtitle: '왼쪽이 조회수 오른쪽이 평점수'
                },
                series: {
                    0: {axis: '조회수'}, // Bind series 0 to an axis named '조회수'.
                    1: {axis: '평점수'} // Bind series 1 to an axis named '평점수'.
                },
                axes  : {
                    y: {
                        view  : {label: '조회수'}, // Left y-axis.
                        grade: {side: 'right', label: 'apparent magnitude'} // Right y-axis.
                    }
                }
            };

            let classicOptions = {
                width : 900,
                series: {
                    0: {targetAxisIndex: 0},
                    1: {targetAxisIndex: 1}
                },
                title : 'Nearby galaxies - view on the left, grade on the right',
                vAxes : {
                    // Adds titles to each axis.
                    0: {title: 'view'},
                    1: {title: 'grade'}
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
<body>
<button id="change-chart">Change to Classic</button>
<h2>Hello ${loginUser.username}</h2>
<h2>${categoryList[0].category}</h2>
<br><br>
<div id="chart_div" style="width: 800px; height: 500px;"></div>
</body>
</html>
