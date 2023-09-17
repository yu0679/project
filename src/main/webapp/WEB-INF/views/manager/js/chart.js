const xixis_padding = 10; //x축 패딩
const yixis_padding = 50; //y축 패딩

// const duration = 1000 * 30;
const max_value = 20;
const ytix_count = 2;
const top_padding = 15; //y축 윗쪽패딩


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
            chartHeight
        } = this // end-const

        ctx.beginPath();
        ctx.moveTo(yixis_padding, top_padding);
        ctx.lineTo(yixis_padding, this.canvasHeight + top_padding);

        const yInertval = max_value / (ytix_count -1);
        for (let i = 0; i < ytix_count; i++) {
            const value = i * yInertval;
            const yPoint = top_padding + chartHeight - value / max_value* canvasHeight;
            ctx.fillText(value,0, yPoint);
        }


        ctx.lineTo(this.canvasWidth, this.canvasHeight);



        ctx.stroke();

    }

    //데이터 갱신
    updateData = () => {

    }



}

document.addEventListener("DOMContentLoaded", () => {
    new LineChart("lineChart");
    }

)