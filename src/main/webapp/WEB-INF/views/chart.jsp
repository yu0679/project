<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>Title</title>
    <script src="../../js/jquery/jquery-2.2.4.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/chart.js"></script>

</head>
<body>

<div>

    <canvas id="line-chart" width="40%" height="10%"></canvas>
</div>

<script type="text/javascript">
    var mychart = document.getElementById('line-chart').getContext('2d');



    var myLineChart = new Chart(mychart, {
        type: 'line',
        data: {
            labels: ['Sun', 'Mun', 'Tue', 'Wed', 'Thu', 'Fri', 'Sat'],
            datasets: [{
                label: '일일 방문자수',
                data: [${sun}, ${mon}, ${tue}, ${wed}, ${thu}, ${fri}, ${sat}],
                stepSize: 1
            }]
        },
        options: {
            scales: {
                y: {
                    ticks: {
                        stepSize: 1
                    }
                }
            }
        }

    });

    document.addEventListener("DOMContentLoaded", function(event) {
        console.log("DOM fully loaded and parsed");
    });
</script>
</body>
</html>