const xixis_padding = 10; //x축 패딩
const yixis_padding = 25; //y축 패딩

const duration = 1000 * 30;
const max_value = 20;
const ytix_count = 5;
const top_padding = 30; //y축 윗쪽패딩


class LineChart {
    constructor(id) {
        this.canvas = document.getElementById(id);
        this.ctx = this.canvas.getContext("2d");

        this.canvasWidth = this.canvas.clientWidth;
        this.canvasHeight = this.canvas.clientHeight;
        this.chartWidth = this.canvasWidth - yixis_padding;
        this.chartHeight = this.canvasHeight - xixis_padding - top_padding;

        this.drawChart();
    }

    //시간을 실시간으로 세팅
    setTime = () => {

    }

    //차트 그리는 함수
    drawChart = () => {
        const {
            ctx,
            canvasWidth,
            canvasHeight,
            chartHeight,
            chartWidth
        } = this // end-const

        ctx.beginPath();
        ctx.moveTo(yixis_padding, top_padding);
        ctx.lineTo(yixis_padding, this.chartHeight + top_padding);
        const yInterval = max_value / (ytix_count -1);


        for (let i = 0; i < ytix_count; i++) {
            const value = i * yInterval;
            const yPoint = top_padding + chartHeight - value / max_value * chartHeight;
            ctx.fillText(value, 0, yPoint);
        }


        ctx.lineTo(this.canvasWidth, this.chartHeight + top_padding);
        ctx.stroke();

        const day =new Date();
        const weekday=new Array(7);

        weekday[0]="Sunday";
        weekday[1]="Monday";
        weekday[2]="Tuesday";
        weekday[3]="Wednesday";
        weekday[4]="Thursday";
        weekday[5]="Friday";
        weekday[6]="Saturday";

        ctx.fillText(weekday,0, chartHeight + top_padding + 10)



    }

    //데이터 갱신
    updateData = () => {

    }



}

document.addEventListener("DOMContentLoaded", () => {
    new LineChart("lineChart");
    }

)