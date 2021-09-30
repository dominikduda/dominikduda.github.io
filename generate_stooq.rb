TIMEFRAMES = %w[5d 5m 2y 10y 30y 100y].freeze
AUTO_RELOAD_INTERVAL_MS = 600_000
CHARTS = [
  '-Indices-',
  '^SPX',
  '^DJT',
  '^DAX',
  'WIG',
  'WIG20',
  '-ETFs-',
  'ACES.US',
  'AIQ.US',
  'ARKG.US',
  'BATT.US',
  'BUG.US',
  'DRIV.US',
  'IYE.US',
  'LIT.US',
  'PBD.US',
  'SMH.US',
  'TLT.US',
  'XME.US',
  '-Stocks-',
  'AAPL.US',
  'ADBE.US',
  'BAC.US',
  'AMZN.US',
  'BYND.US',
  'CCJ.US',
  'CDNA.US',
  'CDR',
  'CRSP.US',
  'DIS.US',
  'EDIT.US',
  'EXAS.US',
  'FDX.US',
  'HUGE',
  'INTC.US',
  'KO.US',
  'LTHM.US',
  'MCD.US',
  'MSFT.US',
  'NTLA.US',
  'NVDA.US',
  'OSCR.US',
  'PACB.US',
  'PBE.US',
  'PEP.US',
  'PLUG.US',
  'PYPL.US',
  'REGN.US',
  'SBUX.US',
  'SELB.US',
  'TDOC.US',
  'TSLA.US',
  'TWST.US',
  'V.US',
  'VRTX.US',
  'WFC.US',
  '-Metals-',
  'XAGUSD',
  'XAUUSD',
  'XPDUSD',
  'XPTUSD',
  '-Cryptos-',
  'AMPL.V',
  'BNB.V',
  'BTCUSD',
  'DOGE.V',
  'ETH.V',
  'SC.V',
  'XLM.V',
  'XMR.V',
  'ZEC.V',
  '-FX_majors-',
  'audusd',
  'eurusd',
  'gbpusd',
  'usdcad',
  'usdchf',
  'usdjpy',
  '-FX_minors-',
  'audcad',
  'audchf',
  'audjpy',
  'audnzd',
  'cadchf',
  'cadjpy',
  'chfjpy',
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
  '-FX_exotics-',
  'audsgd',
  'chfsgd',
  'eursgd',
  'gbpsgd',
  'nokjpy',
  'sekjpy',
  'sgdjpy',
  'usdhkd',
  'usdsgd'
].freeze
CHART_RENDER_DELAY_INCREMENT = 2000

output = ''
output << <<~PAGE_TOP
              <html>
                <head>
                <link rel="shortcut icon" type="image/png" href="favicon.png">
                <script src="watcher.js"> </script>
                  <style>
h4 {
  margin: 0;
}

.noselect {
  -webkit-touch-callout: none; /* iOS Safari */
    -webkit-user-select: none; /* Safari */
     -khtml-user-select: none; /* Konqueror HTML */
       -moz-user-select: none; /* Old versions of Firefox */
        -ms-user-select: none; /* Internet Explorer/Edge */
            user-select: none; /* Non-prefixed version, currently
                                  supported by Chrome, Edge, Opera and Firefox */
}

.minimized {
    animation: enters 0.3s ease-in-out;
    transform-origin: 46px 46px;
    opacity: 0;
    transform: scale(0.1);
}

.maximized {
    animation: leaves 0.3s ease-in-out;
    transform-origin: 46px 46px;
    transform: scale(1);
    opacity: 1;
}

@keyframes leaves {
    0% {
        transform: scale(0.01);
        opacity: 0;
    }
    100% {
        transform: scale(1.0);
        opacity: 1;
    }
}
@keyframes enters {
    0% {
        transform: scale(1.0);
        opacity: 1;
    }
    100% {
        transform: scale(0.01);
        opacity: 0;
    }
}

    .active {
      border-color: #99ed38 !important;
    }
  #{'  '}
    .divider {
      text-align: center;
      background-color: #005880;
      color: white;
      padding-top: 5px;
      padding-bottom: 5px;
      font-size: 20px;
    }
    .divider-link {
                background-color: #2f2751;
                color: white;
                border: solid 1px #131313;
                padding-left: 5px;
                padding-right: 5px;
                padding-top: 8px;
                padding-bottom: 8px;
                margin-left: 0px;
                margin-top: 0px;
                cursor: pointer;
                font-size: 20px;
    }
  #{'  '}
    .marked {
      color: #009cff !important;
    }
  #{'  '}
    .marked:hover {
      color: #ffbf00 !important;
    }
  #{'  '}
    .darkMode > .divider {
      filter: invert(1);
    }
  #{'  '}
    .darkMode > .section-divider {
      filter: invert(1);
    }
  #{'  '}
    .section-divider {
      text-align: center;
      color: white;
      padding-top: 5px;
      padding-bottom: 5px;
      font-size: 60px;
      background-color: #00385f;
    }
  #{'  '}
    .darkMode {
      filter: invert(1);
      background-color: white;
    }
  #{'  '}
    .loaderWrapper {
    top: 40%;
      z-index: 1;
      position: fixed;
      left: 0;
      right: 0;
    }
    .fade-out {
      animation: fade 1s;
      -webkit-animation: fade 1s;
      -moz-animation: fade 1s;
      opacity: 0;
    }
  #{'  '}
    /* Animate opacity */
    @keyframes fade {
      from { opacity: 1 }
      to { opacity: 0 }
    }
    @-moz-keyframes fade {
      from { opacity: 1 }
      to { opacity: 0 }
    }
    @-webkit-keyframes fade {
      from { opacity: 1 }
      to { opacity: 0 }
    }
  #{'  '}
  #{'  '}
  #{'  '}
  #{'  '}
    .loader,
    .loader:after {
      border-radius: 50%;
      width: 10em;
      height: 10em;
    }
    .loader {
      margin: 60px auto;
      font-size: 10px;
      position: relative;
      text-indent: -9999em;
      border-top: 1.1em solid rgba(30,22,141, 0.2);
      border-right: 1.1em solid rgba(30,22,141, 0.2);
      border-bottom: 1.1em solid rgba(30,22,141, 0.2);
      border-left: 1.1em solid #1e168d;
      -webkit-transform: translateZ(0);
      -ms-transform: translateZ(0);
      transform: translateZ(0);
      -webkit-animation: load8 1.1s infinite linear;
      animation: load8 1.1s infinite linear;
    }
    @-webkit-keyframes load8 {
      0% {
        -webkit-transform: rotate(0deg);
        transform: rotate(0deg);
      }
      100% {
        -webkit-transform: rotate(360deg);
        transform: rotate(360deg);
      }
    }
    @keyframes load8 {
      0% {
        -webkit-transform: rotate(0deg);
        transform: rotate(0deg);
      }
      100% {
        -webkit-transform: rotate(360deg);
        transform: rotate(360deg);
      }
    }
  #{'  '}
  #{'  '}
  #{'  '}
  #{'  '}
  #{'  '}
  #{'  '}
  #{'  '}
  #{'  '}
  #{'  '}
  #{'  '}
  #{'  '}
  #{'  '}
  #{'  '}
        .timer {
          opacity: 0.8;
          z-index: 4;
          margin-left: 1px;
          margin-top: 1px;
          position: fixed;
          left: 0;
          width: 93px;
          height: 93px;
          animation-name: spin;
          animation-duration: #{AUTO_RELOAD_INTERVAL_MS}ms;
          animation-iteration-count: infinite;
          animation-timing-function: linear;
          background-image: url('https://raw.githubusercontent.com/dominikduda/config_files/master/dd_logo_blue_bg.png');
          background-size: auto 100%;
          background-position: center;

  border-radius: 50px;/* specify the radius */
        }
        .force-non-opaque {
          opacity: 1;
        }
        .timer:hover {
          opacity: 1;
        }
      #{'  '}
        @keyframes spin {
            from {
                transform:rotate(0deg);
            }
            to {
                transform:rotate(360deg);
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
                display: flex;
                justify-content: center;
                align-items: center;
                min-width: 92px;
                min-height: 92px;
                font-size: 40;
                cursor: pointer;
                border: solid 1px #4174c8;
                background-color: #001138;
                color: #b8b6b4;
              }
              .arrow:hover {
                color: white;
              }
  #{'  '}
              .color-btn {
                display: flex;
                justify-content: center;
                align-items: center;
                min-width: 92px;
                min-height: 92px;
                border: solid 1px #4174c8;
                font-size: 15;
                cursor: pointer;
                background-color: #001138;
                color: #b8b6b4;
                max-width: 40px;
                overflow-wrap: anywhere;
              }
              .color-btn:hover {
                color: white;
              }



              .menu-button-container {
                height: 20px;
                margin-left: 0px;
                position: fixed;
                top: 0;
                left: 0;
                max-width: 600px;
                max-width: 90px;
                max-height: 90px;
              }
              .menu-button-content {
                font-size: 5;
                position: relative;
                text-align: center;
                max-width: 200px;
              }
              .menu-btn {

                display: flex;
                justify-content: center;
                align-items: center;
                min-width: 92px;
                min-height: 92px;
                border: solid 1px #444055;
                font-size: 15;
                cursor: pointer;
                background-color: #444055;
                max-width: 40px;
                overflow-wrap: anywhere;
              }
              .menu-btn:hover {
                color: #005ef7;
              }







  #{'  '}
              .fav-button-container {

                height: 20px;
                margin-left: 188px;
                position: fixed;
                top: 0;
                left: 0;
                max-width: 600px;
                max-width: 90px;
                max-height: 90px;
              }
              .fav-button-content {
                font-size: 5;
                position: relative;
                text-align: center;
                max-width: 200px;
              }
              .fav-btn {
                display: flex;
                justify-content: center;
                align-items: center;
                min-width: 92px;
                min-height: 92px;
                border: solid 1px #4174c8;
                font-size: 15;
                cursor: pointer;
                background-color: #001138;
                color: #b8b6b4;
                max-width: 40px;
                overflow-wrap: anywhere;
              }
              .fav-btn:hover {
                color: white;
              }
  #{'  '}
              img {
                width: auto;
                flex: 100;
                min-width: 800px;
                min-height: 550px;
              }
              .clear-min-width {
                min-width: 0px;
                min-height: 0px;
              }
              .chart {
                height: 1920px;
              }
              .chart_title {
              }
              .no-scroll {
                overflow: hidden;
              }
              .hidden {
                display: none;
              }
              body {
                margin: 0px;
              }
              .overlay {
                height: 80%;
                width: auto;
                position: fixed;
                z-index: 3;
                top: 0;
                left: 0;
              }
              .initial-overlay {
              animation-duration: 0s;
              }
  #{'  '}
              .color-button-container {
                height: 20px;
                margin-left: 94px;
                position: fixed;
                top: 0;
                left: 0;
                max-width: 600px;
                max-width: 90px;
                max-height: 90px;
              }
              .color-button-content {
                font-size: 5;
                position: relative;
                text-align: center;
                max-width: 200px;
              }
  #{'  '}
  #{'  '}
  #{'  '}
              .down-arrow-container {
                min-width: 90px;
                min-height: 90px;
                margin-left: 376px;
                position: fixed;
                top: 0;
                left: 0;
                max-width: 90px;
                max-height: 90px;
              }
              .down-arrow-content {
                position: relative;
                text-align: center;
                max-width: 200px;
              }
              .up-arrow-container {
                height: 20px;
                height: 20px;
                margin-left: 282px;
                position: fixed;
                top: 0;
                left: 0;
                max-width: 90px;
                max-height: 90px;
              }
              .up-arrow-content {
                position: relative;
                text-align: center;
                max-width: 200px;
              }
              .overlay-content {
                display: flex;
                flex-wrap: wrap;
                flex-direction: column;
                position: relative;
                text-align: center;
                top: 94px;
                z-index: 6;
                height: 100%;
              }
              .chart-link {
                background-color: #444055;
                color: white;
                border: solid 1px #131313;
                padding-left: 5px;
                padding-right: 5px;
                padding-top: 8px;
                padding-bottom: 8px;
                margin-left: 0px;
                margin-top: 0px;
                cursor: pointer;
                font-size: 20px;
              }
              .chart-link:hover {
                color: #ffbf00;
              }
              .chart-wrapper {
                display: flex;
                flex-wrap: wrap;
                width: 100%;
              }
              .bottom-margin {
                background-color: #00385f;
                min-height: 3500px;
              }
                  </style>
                  <script>
                    (() => {
                      window.list = #{CHARTS.reject { |chart| chart.include?('-') }};
                      window.current_index = 0;
                    })()
                  </script>
                </head>
                <body class="no-scroll noselect">
                <script >
                  (
                    () => {
                        setTimeout('window.location.reload()', #{AUTO_RELOAD_INTERVAL_MS});
                    }
                  )()
                </script>
                <div class='loaderWrapper'>
                  <div class='loader'>Loading...</div>
                  </div>
PAGE_TOP

$next_chart_render_delay = 0

def chart(market_id, timeframe)
  if market_id.include?('-')
    return ''
  end
  <<~CHART
    <img onload="window.watcherOnImageLoad()" loading="lazy" onerror="window.watcherOnImageError(this)" src="https://stooq.com/c/?s=#{market_id}&c=#{timeframe}&t=c&a=lg&b&g&svg"/>
  CHART
end

menu_html = ''
menu_html << '<div class="overlay minimized initial-overlay">'

menu_html << '<div class="overlay-content">'
output << <<~SPINNER
  <div class="timer"
    onClick="(function() {
      if (window.watcherLoaded && isMobile()) {
        document.getElementsByClassName('overlay')[0].classList.toggle('maximized')
        document.getElementsByClassName('overlay')[0].classList.toggle('minimized')
        document.getElementsByClassName('timer')[0].classList.toggle('force-non-opaque')
      }
    })()">
  </div>
SPINNER
output << "<div id='parentDiv'>"

output << "<canvas id='canvas'></canvas>"
output << '</div>'

output << '<div class="grid-container">'
CHARTS.each do |market_id|
  output << if market_id.include?('-')
              "<div class='grid-item section-divider' id=#{market_id}>" + market_id.gsub('_', ' ') + '</div>'
            else
              "<div class='grid-item divider' id=#{market_id}><h4>" + market_id + '</h4></div>'
            end
  output << "<div class='chart-wrapper'>"
  TIMEFRAMES.each do |timeframe|
    output << chart(market_id, timeframe)
  end
  output << '</div>'
  output << ''
  first_divider_id = market_id + TIMEFRAMES.first
  menu_html << <<~MENU
    <div
      class="#{market_id.include?('-') ? 'divider-link' : 'chart-link'} noselect"
      tabindex="-1"
      id="#{market_id}"
      onClick="(function() {
        if (window.watcherLoaded) {
          if (window.scrollIntervalId) { clearInterval(window.scrollIntervalId) }
          window.skipClearInterval = true;
          window.lastScrollByProgram = true;
          #{
            if (market_id.include?('-'))
              "window.watcherSetCookie('scrollPosition', '#{CHARTS[CHARTS.index(market_id) + 1]}');"
            else
              "window.watcherSetCookie('scrollPosition', '#{market_id}');"
            end
          }
          window.scrollIntervalId = setInterval(() => {
            window.skipClearInterval = true;
            document.getElementById('#{market_id}').scrollIntoView()
          }, 50)
          window.current_index = window.list.indexOf('#{market_id}')
          window.watcherLastSelectedChart = '#{market_id}';
        }
      })()"
    >
      <span>#{market_id.gsub('_', ' ')}</span>
    </div>
  MENU
end
output << '</div>'
down_arr = ''
down_arr << '<div class="down-arrow-container">'
down_arr << '<div class="down-arrow-content noselect">'
down_arr << <<~DOWN_ARROW
  <div
    onClick="(function() {
      if (window.current_index + 1 < window.list.length && window.watcherLoaded) {
        if (window.scrollIntervalId) { clearInterval(window.scrollIntervalId) }
        const el = document.getElementById(window.list[window.current_index + 1])
        window.skipClearInterval = true;
        window.lastScrollByProgram = true;
        window.watcherSetCookie('scrollPosition', el.id)
        window.scrollIntervalId = setInterval(() => {
          window.skipClearInterval = true;
          el.scrollIntoView()
        }, 50)
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

up_arr = ''
up_arr << '<div class="up-arrow-container">'
up_arr << '<div class="up-arrow-content noselect">'
up_arr << <<~UP_ARROW
  <div
    onClick="(function() {
      if (window.current_index > 0 && window.watcherLoaded) {
        if (window.scrollIntervalId) { clearInterval(window.scrollIntervalId) }
        const el = document.getElementById(window.list[window.current_index - 1])
        window.skipClearInterval = true;
        window.lastScrollByProgram = true;
        window.watcherSetCookie('scrollPosition', el.id)
        window.scrollIntervalId = setInterval(() => {
          window.skipClearInterval = true;
          el.scrollIntoView()
        }, 50)
        window.current_index = window.current_index - 1
      }
    })()"
  >
    <div class="arrow">&#8593;</div>
  </div>
UP_ARROW
up_arr << '</div>'
up_arr << '</div>'
menu_html << up_arr

color_btn = ''
color_btn << '<div class="color-button-container">'
color_btn << '<div class="color-button-content noselect">'
color_btn << <<~COLOR_BTN
  <div
    onClick="(function() {
      if (window.watcherLoaded) {
        if (window.watcherGetCookie('mode') != 'dark') {
          const element = document.querySelector('.grid-container');
          element.classList.add('darkMode');
          window.watcherSetCookie('mode', 'dark')
        } else {
          const element = document.querySelector('.grid-container');
          element.classList.remove('darkMode');
          window.watcherSetCookie('mode', 'white')
        }
      }
    })()"
  >
    <div class="color-btn">Toggle color mode</div>
  </div>
COLOR_BTN
color_btn << '</div>'
color_btn << '</div>'
menu_html << color_btn

fav_btn = ''
fav_btn << '<div class="fav-button-container">'
fav_btn << '<div class="fav-button-content noselect">'
fav_btn << <<~FAV_BTN
  <div
    onClick="(function() {
      if (window.watcherLoaded) {
        if (window.watcherGetCookie('marked_charts').includes(window.watcherLastSelectedChart)) {
          const prevCookie = window.watcherGetCookie('marked_charts')
          const newCookie = prevCookie.replaceAll((window.watcherLastSelectedChart + ','), '')
          window.watcherSetCookie('marked_charts', newCookie)
          window.watcherRefreshMenu()
        } else {
          const prevCookie = window.watcherGetCookie('marked_charts')
          const newCookie = prevCookie + window.watcherLastSelectedChart + ','
          window.watcherSetCookie('marked_charts', newCookie)
          window.watcherRefreshMenu()
        }
      }
    })()"
  >
    <div class="fav-btn">Mark last selected chart</div>
  </div>
FAV_BTN
fav_btn << '</div>'
fav_btn << '</div>'
menu_html << fav_btn

menu_btn = ''
menu_btn << '<div class="menu-button-container">'
menu_btn << '<div class="menu-button-content noselect">'
menu_btn << <<~MENU_BTN
  <div
    onClick="(function() {
      if (window.watcherLoaded) {
        document.getElementsByClassName('overlay')[0].classList.add('hidden')
      }
    })()"
  >
    <div class="menu-btn"></div>
  </div>
MENU_BTN
menu_btn << '</div>'
menu_btn << '</div>'
menu_html << menu_btn

menu_html << '</div>'

output << menu_html

output << '<div class="bottom-margin"></div>'

output << <<~PAGE_BOTTOM
      </div>
    </body>
  </html>
PAGE_BOTTOM

File.write('./index.html', output)
