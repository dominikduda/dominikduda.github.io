CHARTS = [
  '^DJT',
  '^SPX',
  '^DAX',
  'TLT.US',
  'LIT.US',
  'ARKG.US',
  'PBD.US',
  'DRIV.US',
  'ACES.US',
  'BUG.US',
  'IYE.US',
  'BATT.US',
  'XME.US',
  'AIQ.US',
  'SMH.US',
  '------',
  'CDR',
  'HUGE',
  'PLUG.US',
  'LTHM.US',
  'CDNA.US',
  'VRTX.US',
  'TWST.US',
  'REGN.US',
  'PACB.US',
  'NTLA.US',
  'EXAS.US',
  'TDOC.US',
  'PBE.US',
  'CRSP.US',
  'TSLA.US',
  'NVDA.US',
  'DIS.US',
  'MSFT.US',
  'AAPL.US',
  'PEP.US',
  'INTC.US',
  'AMZN.US',
  'KO.US',
  'BAC.US',
  'V.US',
  'SBUX.US',
  'ADBE.US',
  'FDX.US',
  'PYPL.US',
  'MCD.US',
  'SELB.US',
  'OSCR.US',
  'BYND.US',
  'EDIT.US',
  'CCJ.US',
  'WFC.US',
  '------',
  'XAUUSD',
  '------',
  'ZEC.V',
  'DOGE.V',
  'XMR.V',
  'ETH.V',
  'AMPL.V',
  'BTCUSD',
  '------',
  'eurusd',
  'gbpusd',
  'audcad',
  'audchf',
  'audjpy',
  'audnzd',
  'audusd',
  'cadchf',
  'cadjpy',
  'chfjpy',
  'chfsgd',
  'euraud',
  'eurchf',
  'eurgbp',
  'eurjpy',
  'eurnzd',
  'gbpaud',
  'gbpchf',
  'gbpjpy',
  'gbpnzd',
  'nzdcad',
  'nzdchf',
  'nzdjpy',
  'nzdusd',
  'usdcad',
  'usdchf',
  'usdjpy'
].freeze
TIMEFRAMES = %w[5m 2y 10y 30y 100y].freeze
AUTO_RELOAD_INTERVAL_MS = 300000
CHART_RENDER_DELAY_INCREMENT = 2000

output = ''
output << <<~PAGE_TOP
      <html>
        <head>
        <script>
        setTimeout(() => {
          const canvas = document.getElementById("canvas");
          const parentDiv = document.getElementById("parentDiv");
          const ctx = canvas.getContext("2d");
  #{'  '}
          const onResize = () => {
            let cw = canvas.width = parentDiv.clientWidth,
              cx = cw / 2;
            let ch = canvas.height = parentDiv.clientHeight,
              cy = ch / 2;
            ctx.strokeStyle = "#FF0000";
            ctx.lineWidth = 2;
          }
          onResize();
          window.myCustomOnResize = onResize;
          document.addEventListener('scroll', onResize);
          window.addEventListener('resize', onResize);
  #{'  '}
          let drawing = false;
  #{'  '}
          // a function to detect the mouse position
          function oMousePos(element, evt) {
                var ClientRect = element.getBoundingClientRect();
                     return { //objeto
                       x: Math.round(evt.clientX - ClientRect.left),
                       y: Math.round(evt.clientY - ClientRect.top)
                     }
          }
  #{'  '}
          parentDiv.addEventListener('mousedown', function(evt) {
                drawing = true; // you can draw now
                 let m = oMousePos(parentDiv, evt);
                 ctx.beginPath();
                 ctx.moveTo(m.x,m.y);
          }, false);
  #{'  '}
            parentDiv.addEventListener('mouseup', function(evt) {
                drawing = false; // you can't draw anymore
  #{'  '}
          }, false);
            parentDiv.addEventListener('mouseleave', function(evt) {
                drawing = false; // you can't draw anymore
  #{'  '}
          }, false);
  #{'  '}
            parentDiv.addEventListener("mousemove", function(evt) {
                if (drawing) {
                  let m = oMousePos(parentDiv, evt);
                  ctx.lineTo(m.x, m.y);
                  ctx.stroke();
                }
          }, false);
        }, 200)
        </script>
    <script src='https://kit.fontawesome.com/a076d05399.js'></script>
          <style>
.timer {
  z-index: 1;
  margin-left: 15px;
  margin-top: 50px;
  position: fixed;
  left: 0;
  width: 100px;
  height: 100px;
  animation-name: spin;
  animation-duration: #{AUTO_RELOAD_INTERVAL_MS}ms;
  animation-iteration-count: infinite;
  animation-timing-function: linear;
  border-radius: 50%;
  border: solid;
  opacity: 1;
}

.timerdot {
  animation-name: morph;
  animation-duration: #{AUTO_RELOAD_INTERVAL_MS}ms;
  animation-iteration-count: infinite;
  animation-timing-function: linear;
  margin-top: 11px;
  margin-left: 11px;
  height: 20px;
  width: 20px;
  border-radius: 50%;
  display: inline-block;
}

@keyframes morph {
    from {
        background-color: green;
    }
    to {
        background-color: red;
    }
}

@keyframes spin {
    from {
        transform:rotate(45deg);
    }
    to {
        transform:rotate(405deg);
    }
}
    canvas {
        width:100%;
        height:100%;
        position: fixed;
        z-index: 2;
        top: 0;
    }
    #parentDiv {
        width:100%;
        height:100%;
        position: fixed;
        z-index: 2;
        top: 0;
    }
  #{'  '}
    canvas {pointer-events:none;}
      .arrow {
        font-size: 80;
        cursor: pointer;
        background-color: yellow;
      }
      img {
        width: auto;
        flex: 100;
      }
      .chart {
        height: 1920px;
      }
      .chart_title {
      }
      body {
        margin: 0px
      }
      .overlay {
        height: 80%;
        width: auto;
        position: fixed;
        z-index: 3;
        top: 0;
        left: 0;
      }
      .down-arrow-container {
        height: 20px;
        margin-left: 70px;
        position: fixed;
        top: 0;
        left: 0;
        max-width: 600px;
      }
      .down-arrow-content {
        position: relative;
        text-align: center;
        opacity: 0.00;
        max-width: 200px;
      }
      .down-arrow-content:hover {
        opacity: 1;
      }
      .down-arrow-content{animation: 2s ease-out 0s 1 FadeIn;}
      @keyframes FadeIn {
        0% {
          opacity:1;
        }
        100% {
          opacity:0;
        }
      }
      .down-arrow-content:hover{animation: 0s ease-out 0s 1 FadeIn;}
      @keyframes FadeIn {
        0% {
          opacity:1;
        }
        100% {
          opacity:0;
        }
      }
      .up-arrow-container {
        height: 20px;
        margin-left: 20px;
        position: fixed;
        top: 0;
        left: 0;
        max-width: 600px;
      }
      .up-arrow-content {
        position: relative;
        text-align: center;
        opacity: 0.00;
        max-width: 200px;
      }
      .up-arrow-content:hover {
        opacity: 1;
      }
      .up-arrow-content{animation: 2s ease-out 0s 1 FadeIn;}
      @keyframes FadeIn {
        0% {
          opacity:1;
        }
        100% {
          opacity:0;
        }
      }
      .up-arrow-content:hover{animation: 0s ease-out 0s 1 FadeIn;}
      @keyframes FadeIn {
        0% {
          opacity:1;
        }
        100% {
          opacity:0;
        }
      }
      .overlay-content {
        display: flex;
        flex-wrap: wrap;
        flex-direction: column;
        position: relative;
        text-align: center;
        top: 92px;
        opacity: 0.00;
        z-index: 5;
        height: 100%;
      }
      .overlay-content:hover {
        opacity: 1;
      }
      .overlay-content{animation: 2s ease-out 0s 1 FadeIn;}
      @keyframes FadeIn {
        0% {
          opacity:1;
        }
        100% {
          opacity:0;
        }
      }
      .overlay-content:hover{animation: 0s ease-out 0s 1 FadeIn;}
      @keyframes FadeIn {
        0% {
          opacity:1;
        }
        100% {
          opacity:0;
        }
      }
      .chart-link {
        background-color: blue;
        color: white;
        padding-left: 5px;
        padding-right: 5px;
        padding-top: 5px;
        padding-bottom: 5px;
        margin-left: 0px;
        margin-top: 0px;
        cursor: pointer;
        font-size: 20px;
      }
      .chart-link:hover {
        color: red;
      }
      .chart-wrapper {
        display: flex;
        flex-wrap: wrap;
        width: 100%;
      }
      body {
        // overflow: hidden;
      }
          </style>
          <script>
            (() => {
              window.list = #{CHARTS};
              window.current_index = 0;
            })()
          </script>
        </head>
        <body>
        <script >
          (
            () => {
                setTimeout('window.location.reload()', #{AUTO_RELOAD_INTERVAL_MS});
            }
          )()
        </script>
          <div class="grid-container">
PAGE_TOP

$next_chart_render_delay = 0

def chart(market_id, timeframe)
  <<~CHART
    <img src="https://stooq.com/c/?s=#{market_id}&c=#{timeframe}&t=c&a=lg&b&g"/>
  CHART
end

up_arr = ''
up_arr << '<div class="up-arrow-container">'
up_arr << '<div class="up-arrow-content">'
up_arr << <<~UP_ARROW
  <div
    onClick="(function() {
      if (window.current_index > 0) {
        document.getElementById(window.list[window.current_index - 1]).scrollIntoView()
        window.current_index = window.current_index - 1
      }
    })()"
  >
    <div class="arrow">&#8593;</div>
  </div>
UP_ARROW
up_arr << '</div>'
up_arr << '</div>'
menu_html = ''
menu_html << '<div class="overlay">'
menu_html << up_arr
menu_html << '<div class="overlay-content">'
output << <<~SPINNER
<div class="timer">
  <div class="timerdot"></div>
</div>
SPINNER
output << "<div id='parentDiv'>"

output << "<canvas id='canvas'></canvas>"
output << '</div>'
CHARTS.each do |market_id|
  output << "<div class='grid-item divider' style='visibility: hidden' id=#{market_id}>" + market_id + '</div>'
  output << "<div class='chart-wrapper'>"
  TIMEFRAMES.each do |timeframe|
    output << chart(market_id, timeframe)
  end
  output << '</div>'
  output << '<hr><hr><hr><hr><hr>'
  first_divider_id = market_id + TIMEFRAMES.first
  menu_html << <<~MENU
    <div
      class="chart-link"
      tabindex="-1"
      id="#{market_id}"
      onClick="(function() {
        document.getElementById('#{market_id}').scrollIntoView()
        window.current_index = window.list.indexOf('#{market_id}')
      })()"
    >
      <span>#{market_id}</span>
    </div>
  MENU
end
down_arr = ''
down_arr << '<div class="down-arrow-container">'
down_arr << '<div class="down-arrow-content">'
down_arr << <<~DOWN_ARROW
  <div
    onClick="(function() {
      if (window.current_index + 1 < window.list.length) {
        document.getElementById(window.list[window.current_index + 1]).scrollIntoView()
        window.current_index = window.current_index + 1
      }
    })()"
  >
    <div class="arrow">&#8595;</div>
  </div>
DOWN_ARROW
down_arr << '</div>'
down_arr << '</div>'

menu_html << '</div>'
menu_html << down_arr
menu_html << '</div>'

output << menu_html

output << <<~PAGE_BOTTOM
      </div>
    </body>
  </html>
PAGE_BOTTOM

File.write('./index.html', output)
