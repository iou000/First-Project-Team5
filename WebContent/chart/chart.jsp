<%--
  작성자 : 김지혜
  Date: 3/11/22
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%--<html>--%>
<%--<head>--%>
<%--    <script type="text/javascript" src="https://www.gstatic.com/charts/loader.js"></script>--%>
<%--    <script type="text/javascript">--%>
<%--        google.charts.load('current', {'packages': ['corechart', 'bar']});--%>
<%--        google.charts.setOnLoadCallback();--%>

<%--        function drawStuff() {--%>

<%--            let button = document.getElementById('change-chart');--%>
<%--            let chartDiv = document.getElementById('chart_div');--%>
<%--            console.log(categoryList)--%>

<%--            // categoryList 에서 데이터 받아서 넣어줘야 하는데 안들어감;--%>

<%--            let data = google.visualization.arrayToDataTable(--%>
<%--                [--%>
<%--                    ['Category', 'view_average', 'grade_average'],--%>
<%--                    [${categoryList[0].category}, ${categoryList[0].view_average}, ${categoryList[0].grade_average}],--%>
<%--                    [${categoryList[1].category}, ${categoryList[1].view_average}, ${categoryList[1].grade_average}],--%>
<%--                    [${categoryList[2].category}, ${categoryList[2].view_average}, ${categoryList[2].grade_average}],--%>
<%--                    [${categoryList[3].category}, ${categoryList[3].view_average}, ${categoryList[3].grade_average}],--%>
<%--                    [${categoryList[4].category}, ${categoryList[4].view_average}, ${categoryList[4].grade_average}],--%>
<%--                    [${categoryList[5].category}, ${categoryList[5].view_average}, ${categoryList[5].grade_average}],--%>
<%--                    [${categoryList[6].category}, ${categoryList[6].view_average}, ${categoryList[6].grade_average}],--%>
<%--                ]--%>
<%--            );--%>

<%--            let data = google.visualization.arrayToDataTable([--%>
<%--                ['Galaxy', 'Distance', 'Brightness'],--%>
<%--                ['Canis Major Dwarf', 8000, 23.3],--%>
<%--                ['Sagittarius Dwarf', 24000, 4.5],--%>
<%--                ['Ursa Major II Dwarf', 30000, 14.3],--%>
<%--                ['Lg. Magellanic Cloud', 50000, 0.9],--%>
<%--                ['Bootes I', 60000, 13.1]--%>
<%--            ]);--%>
<%--            --%>

<%--            let materialOptions = {--%>
<%--                width : 900,--%>
<%--                chart : {--%>
<%--                    title   : '분류별 레시피 조회수 & 평점수',--%>
<%--                    subtitle: '왼쪽이 조회수 오른쪽이 평점수'--%>
<%--                },--%>
<%--                series: {--%>
<%--                    0: {axis: '조회수'}, // Bind series 0 to an axis named '조회수'.--%>
<%--                    1: {axis: '평점수'} // Bind series 1 to an axis named '평점수'.--%>
<%--                },--%>
<%--                axes  : {--%>
<%--                    y: {--%>
<%--                        view_average  : {label: '조회수'}, // Left y-axis.--%>
<%--                        grade_average: {side: 'right', label: 'apparent magnitude'} // Right y-axis.--%>
<%--                    }--%>
<%--                }--%>
<%--            };--%>

<%--            let classicOptions = {--%>
<%--                width : 900,--%>
<%--                series: {--%>
<%--                    0: {targetAxisIndex: 0},--%>
<%--                    1: {targetAxisIndex: 1}--%>
<%--                },--%>
<%--                title : 'Nearby galaxies - view_average on the left, grade_average on the right',--%>
<%--                vAxes : {--%>
<%--                    // Adds titles to each axis.--%>
<%--                    0: {title: 'view_average'},--%>
<%--                    1: {title: 'grade_average'}--%>
<%--                }--%>
<%--            };--%>

<%--            function drawMaterialChart() {--%>
<%--                let materialChart = new google.charts.Bar(chartDiv);--%>
<%--                materialChart.draw(data, google.charts.Bar.convertOptions(materialOptions));--%>
<%--                button.innerText = 'Change to Classic';--%>
<%--                button.onclick = drawClassicChart;--%>
<%--            }--%>

<%--            function drawClassicChart() {--%>
<%--                let classicChart = new google.visualization.ColumnChart(chartDiv);--%>
<%--                classicChart.draw(data, classicOptions);--%>
<%--                button.innerText = 'Change to Material';--%>
<%--                button.onclick = drawMaterialChart;--%>
<%--            }--%>

<%--            drawMaterialChart();--%>
<%--        };--%>
<%--    </script>--%>
<%--</head>--%>
<%--<body>--%>
<%--<button id="change-chart">Change to Classic</button>--%>
<%--<h2>Hello ${loginUser.username}</h2>--%>
<%--<h2>${categoryList[0].category}</h2>--%>
<%--<br><br>--%>
<%--<div id="chart_div" style="width: 800px; height: 500px;"></div>--%>
<%--</body>--%>
<%--</html>--%>

<html>
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
<body>
<button id="change-chart">Change to Classic</button>
<h2>Hello ${loginUser.username}</h2>
<h2>${categoryList[0].category}</h2>
<br><br>
<div id="chart_div" style="width: 800px; height: 500px;"></div>
</body>
</html>
