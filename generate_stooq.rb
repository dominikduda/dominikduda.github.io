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
  'usdjpy',
].freeze
TIMEFRAMES = %w[5m 10y 30y].freeze
CHART_RENDER_DELAY_INCREMENT = 2000

output = ''
output << <<~PAGE_TOP
  <html>
    <head>
<script src='https://kit.fontawesome.com/a076d05399.js'></script>
      <style>
  i {
    font-size: 100;
  }
  img {
    width: auto;
    height: 70%;
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
    height: 100%;
    width: 100%;
    position: fixed;
    z-index: 1;
    top: 0;
    left: 0;
    max-width: 200px;
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
    top: -20px;
    opacity: 0.04;
    max-width: 200px;
  }
  .down-arrow-content:hover {
    opacity: 1;
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
    top: -20px;
    opacity: 0.04;
    max-width: 200px;
  }
  .up-arrow-content:hover {
    opacity: 1;
  }
  .overlay-content {
    position: relative;
    text-align: center;
    top: 50px;
    opacity: 0.04;
    max-width: 200px;
    z-index: 2;
  }
  .overlay-content:hover {
    opacity: 1;
  }
  .chart-link {
    background-color: blue;
    color: white;
    margin-left: 20px;
    margin-top: 0px;
    max-width: 100px;
    height: 15px;
    cursor: pointer;
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
          window.list = #{CHARTS.to_s};
          window.current_index = 0;
        })()
      </script>
    </head>
    <body>
    <script >
      (
        () => {
            setTimeout('window.location.reload()', 120000);
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
    <i class="fas fa-angle-up" ></i>
  </div>
UP_ARROW
up_arr << '</div>'
up_arr << '</div>'
menu_html = ''
menu_html << '<div class="overlay">'
menu_html <<  up_arr
menu_html << '<div class="overlay-content">'
CHARTS.each do |market_id|
  output << "<div class='grid-item divider' style='visibility: hidden' id=#{market_id}>" + market_id + '</div>'
    output << "<div class='chart-wrapper'>"
  TIMEFRAMES.each do |timeframe|
    output << chart(market_id, timeframe)
  end
    output << "</div>"
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
    <i class="fas fa-angle-down" ></i>
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
