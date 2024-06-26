TIMEFRAMES = %w[5d 5m].freeze
TIMEFRAMES_NAMES = %w[H D].freeze
AUTO_RELOAD_INTERVAL_MS = 240_000
CHARTS = [
  '-|||| INDICES ||||-',
  '^SPX,https://en.wikipedia.org/wiki/S%26P_500,',
  '^DJT,https://en.wikipedia.org/wiki/Dow_Jones_Transportation_Average,',
  '^DAX,https://en.wikipedia.org/wiki/DAX,',
  'WIG,https://pl.wikipedia.org/wiki/Warszawski_Indeks_Gie%C5%82dowy,',
  '-|||| ETF ||||-',
  'AIQ.US,https://www.etf.com/AIQ,Artificial intelligence',
  'BKCH.US,https://www.globalxetfs.com/funds/bkch/#holdings,Global blockchain ETF',
  'BUG.US,https://www.globalxetfs.com/funds/bug/#holdings,Global cybersecurity ETF',
  'CLOU.US,https://www.globalxetfs.com/funds/clou/#holdings,Global Cloud Computing ETF',
  'IBTA.UK,https://www.ishares.com/uk/individual/en/products/287340/,1-3 year USA goverment treasury bond',
  'IDTL.UK,https://www.ishares.com/uk/individual/en/products/272124/ishares-usd-treasury-bond-20-yr-ucits-etf,20+ year USA goverment treasury bond',
  'LIT.US,https://www.etf.com/LIT,Global Lithium & Battery Tech ETF',
  'PBE.US,https://www.etf.com/PBE,Biotech/Genome',
  'QQQ.US,https://www.etf.com/QQQ,',
  'SMH.US,https://www.etf.com/SMH,Semiconducotrs',
  'XME.US,https://www.etf.com/XME,Metals and mining',
  '-|||| STOCKS ||||-',
  'AAPL.US,https://companiesmarketcap.com/apple/marketcap/,The fanboy company',
  'ADBE.US,https://companiesmarketcap.com/adobe/marketcap/,Adobe - software',
  'ALB.US,https://companiesmarketcap.com/albemarle/marketcap/,Chemicals',
  'AMZN.US,https://companiesmarketcap.com/amazon/marketcap/,Amazon',
  'BA.US,https://companiesmarketcap.com/boeing/marketcap/,Boeing',
  'BABA.US,https://companiesmarketcap.com/alibaba/marketcap/,Internet retail shop',
  'BAC.US,https://companiesmarketcap.com/bank-of-america/marketcap/,Bank of america',
  'BGNE.US,https://companiesmarketcap.com/beigene/marketcap/,Pharmaceuticals',
  'BHG.US,https://companiesmarketcap.com/bright-health/marketcap/,Healthcare/Insurance',
  'BMO.US,https://companiesmarketcap.com/bank-of-montreal/marketcap/,Canadian bank',
  'BRK-A.US,https://companiesmarketcap.com/berkshire-hathaway/marketcap/,Buffet investment',
  'BYND.US,https://companiesmarketcap.com/beyond-meat/marketcap/,Food, meat-like products',
  'CAG.US,https://companiesmarketcap.com/conagra-brands/marketcap/,Food',
  'CCJ.US,https://companiesmarketcap.com/cameco/marketcap/,Uranium mining',
  'CDR,https://companiesmarketcap.com/cd-projekt/marketcap/,Game studio',
  'CLH.US,https://companiesmarketcap.com/clean-harbors/marketcap/,Waste management',
  'CMCSA.US,https://companiesmarketcap.com/comcast/marketcap/,Media/Press',
  'CMG.US,https://companiesmarketcap.com/chipotle-mexican-grill/marketcap/,Fast food',
  'COST.US,https://companiesmarketcap.com/costco/marketcap/,Supermarket chains, Supply intermediate',
  'CRSP.US,https://companiesmarketcap.com/crispr-therapeutics/marketcap/,CRISPR/Biotech',
  'DBI.US,https://companiesmarketcap.com/designer-brands/marketcap/,Footwear',
  'DIS.US,https://companiesmarketcap.com/walt-disney/marketcap/,Disney',
  'DNUT.US,https://companiesmarketcap.com/krispy-kreme/marketcap/,Food',
  'EDIT.US,https://companiesmarketcap.com/editas-medicine/marketcap/,CRISPR/Biotech',
  'EXAS.US,https://companiesmarketcap.com/exact-sciences/marketcap/,Biotech/Diagnostics',
  'FB.US,https://companiesmarketcap.com/facebook/marketcap/,Facebook & Metaverse',
  'FDX.US,https://companiesmarketcap.com/fedex/marketcap/,Courier/Transportation',
  'GOOGL.US,https://companiesmarketcap.com/alphabet-google/marketcap/,Google',
  'INTC.US,https://companiesmarketcap.com/intel/marketcap/,Intel',
  'JPM.US,https://companiesmarketcap.com/jp-morgan-chase/marketcap/,Bank/Financial services',
  'JTKWY.US,https://en.wikipedia.org/wiki/Just_Eat_Takeaway,Pyszne.pl (international)',
  'KO.US,https://companiesmarketcap.com/coca-cola/marketcap/,Coca-Cola',
  'LSXMA.US,https://companiesmarketcap.com/liberty-media/marketcap/,Media/Press',
  'LTHM.US,https://companiesmarketcap.com/livent/marketcap/,Chemicals',
  'MCD.US,https://companiesmarketcap.com/mcdonald/marketcap/,Fast food',
  'MSFT.US,https://companiesmarketcap.com/microsoft/marketcap/,',
  'NRGV.US,https://en.wikipedia.org/wiki/Energy_Vault,"Gravity battery" energy storage - waiting for first project of second version',
  'NVDA.US,https://companiesmarketcap.com/nvidia/marketcap/,',
  'OSCR.US,https://companiesmarketcap.com/oscar-health/marketcap/,',
  'PACB.US,https://companiesmarketcap.com/pacific-biosciences/marketcap/,Biotech/Gene sequencing',
  'PEP.US,https://companiesmarketcap.com/pepsico/marketcap/,Pepsi',
  'PLUG.US,https://companiesmarketcap.com/plug-power/marketcap/,Hydrogen fuel cell/Renewable energy',
  'PZZA.US,https://companiesmarketcap.com/papa-johns-pizza/marketcap/,Pizza chain',
  'REGN.US,https://companiesmarketcap.com/regeneron-pharmaceuticals/marketcap/,Biotech/Pharmaceuticals',
  'RGLD.US,https://companiesmarketcap.com/royal-gold/marketcap/,Gold mining stock',
  'RY.US,https://companiesmarketcap.com/royal-bank-of-canada/marketcap/,Canadian bank',
  'SBUX.US,https://companiesmarketcap.com/starbucks/marketcap/,Starbucks',
  'SELB.US,https://companiesmarketcap.com/selecta-biosciences/marketcap/,Biotech/Pharmaceuticals',
  'SUI.US,https://companiesmarketcap.com/sun-communities/marketcap/,Real estate/Investment',
  'TDOC.US,https://companiesmarketcap.com/teladoc-health/marketcap/,Telehealth',
  'TSLA.US,https://companiesmarketcap.com/tesla/marketcap/,Tesla',
  'TSM.US,https://companiesmarketcap.com/tsmc/marketcap/,Taiwan Semiconductor Manufacturing Company',
  'V.US,https://companiesmarketcap.com/visa/marketcap/,VISA',
  'VRTX.US,https://companiesmarketcap.com/vertex-pharmaceuticals/marketcap/,Biotech/Pharmaceuticals',
  'WFC.US,https://companiesmarketcap.com/wells-fargo/marketcap/,Bank/Financial services',
  'WM.US,https://companiesmarketcap.com/waste-management/marketcap/,Waste management',
  'WMT.US,https://companiesmarketcap.com/walmart/marketcap/,Supermarket chain',
  '-|||| METALS ||||-',
  'XAUUSD,,Gold',
  'XAGUSD,,Silver',
  'XPDUSD,,Palladium',
  'XPTUSD,,Platinum',
  '-|||| CRYPTOS ||||-',
  'BTCUSD,https://coinmarketcap.com/currencies/bitcoin/,Bitcoin',
  'XMR.V,https://coinmarketcap.com/currencies/monero/,Monero',
  'ETH.V,https://coinmarketcap.com/currencies/ethereum/,Etherum',
  'SC.V,https://coinmarketcap.com/currencies/siacoin/,Siacoin',
  'XLM.V,https://coinmarketcap.com/currencies/stellar/,Stellar',
  'ZEC.V,https://coinmarketcap.com/currencies/zcash/,Zcash',
  '-|||| FX_MAJORS ||||-',
  'eurusd,,',
  'audusd,,',
  'gbpusd,,',
  'usdcad,,',
  'usdchf,,',
  'usdjpy,,',
  '-|||| FX_MINORS ||||-',
  'nzdusd,,',
  'audcad,,',
  'audchf,,',
  'audjpy,,',
  'audnzd,,',
  'cadjpy,,'
].freeze
CHART_RENDER_DELAY_INCREMENT = 2000

output = ''
output << <<~PAGE_TOP
                      <html>
                        <head>
  #{'  '}
                        <link rel="shortcut icon" type="image/png" href="favicon.png">
                        <script src="watcher.js"> </script>
                          <style>
    @import url('https://fonts.googleapis.com/css2?family=Roboto&display=swap');
        h4, h3 {
        display: inline-block;
          margin: 0;
          margin-left: 50px;
        }
  #{'  '}
      a{ color: white }
      a:visited{ color: white }
      p {
        margin: 0;
        margin-top: 15px;
      }
      .no-margin {
      margin: 0;
      }
      #{'  '}
        .about-content {
          z-index: 0 !important;
          padding-left: 15%;
          padding-right: 15%;
          margin-bottom: 40px;
          margin-top: 40px;
          font-size: 21;
          color: #00385f;
          width: 70%;
          overflow-wrap: anywhere;
        }
      #{'  '}
        .noselect {
          -webkit-touch-callout: none; /* iOS Safari */
            -webkit-user-select: none; /* Safari */
             -khtml-user-select: none; /* Konqueror HTML */
               -moz-user-select: none; /* Old versions of Firefox */
                -ms-user-select: none; /* Internet Explorer/Edge */
                    user-select: none; /* Non-prefixed version, currently
                                          supported by Chrome, Edge, Opera and Firefox */
        }
      #{'  '}
        .minimized {
            animation: enters 0.2s ease-in-out;
            transform-origin: 46px 46px;
            opacity: 0;
            transform: scale(0.1);
        }
      #{'  '}
        .maximized {
            animation: leaves 0.2s ease-in-out;
            transform-origin: 46px 46px;
            transform: scale(1);
            opacity: 1;
        }
      #{'  '}
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
      #{'  '}
            .active {
              border-color: #99ed38 !important;
            }
          #{'  '}
            .divider {
              margin-top: 40px;
              position: relative;
              z-index: 4;
            }
            .inside-divider {
              text-align: center;
              font-size: 20px;
              background-color: #005880;
              color: white;
              padding-top: 5px;
              padding-bottom: 5px;
              width: 80%;
              margin-left: 10%;
              margin-right:10%;
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
              filter: invert(1) hue-rotate(215deg);
            }
          #{'  '}
            .darkMode > .section-divider {
              filter: invert(1) hue-rotate(215deg);
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
              filter: invert(1) hue-rotate(145deg);
              background-color: white;
            }
          #{'  '}
            .loaderWrapper {
              top: 40%;
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
                  z-index: 5;
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
      #{'  '}
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
                        z-index: 3;
                        top: 0;
                    }
                    #parentDiv {
                        width:100%;
                        height:100%;
                        position: fixed;
                        z-index: 3;
                        top: 0;
                    }
                  #{'  '}
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
      #{'  '}
      #{'  '}
      #{'  '}
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
      #{'  '}
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
      #{'  '}
      #{'  '}
      #{'  '}
      #{'  '}
      #{'  '}
      #{'  '}
          #{'  '}
                      .fav-button-container {
      #{'  '}
                        height: 20px;
                        position: fixed;
                        top: 0;
                        margin-left: 282px;
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
                        width: 100%;
                        height: 100%;
                        min-width: 400px;
                        min-height: 275px;
                        flex: 100;
                      }
                      .img-wrapper {
                        flex: 1 1 49%;
                        position: relative;
                        width: auto;
                      }
                      .thin-img-wrapper{
                        flex: 1 1 49%;
                        position: relative;
                        width: auto;
                      }
                      .chart-info {
                        font-family: 'Roboto';
                        font-weight: normal;
                        font-style: normal;
                        top: 0;
                        opacity: 0.20;
                        color: blue;
                        font-size: 170;
                        flex-direction: row-reverse;
                        display: flex;
                        justify-content: center;
                        align-items: center;
                        width: 100%;
                        height: 90%;
                        position:absolute;
                        left: 0;
                        z-index: 2;
                      }
                      .D {
                        color: #000080 !important;
                      }
                      .Max {
                        flex: 1;
                        color: #B22222 !important;
                      }
                      .Q {
                        color: #FF8C00 !important;
                      }
                      .M {
                        color: #228B22 !important;
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
                        z-index: 4;
                        top: 0;
                        left: 0;
                      }
                      .initial-overlay {
                      animation-duration: 0s;
                      }
          #{'  '}
                      .color-button-container {
                        height: 20px;
                        margin-left: 376px;
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
                        z-index: 99;
                        min-width: 90px;
                        min-height: 90px;
                        margin-left: 94px;
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
                        z-index: 99;
                        height: 20px;
                        height: 20px;
                        margin-left: 188px;
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
                        z-index: 7;
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
                        height: 95%;
                      }
                      .bottom-margin {
                        background-color: #00385f;
                        min-height: 3500px;
                      }


#iframe_main {
    height: 136px;
    width: 614px;
}

#idiv {
    position: fixed;
    left: 0px;
    right: 0px;
    bottom: 0px;
}

                          </style>
                          <script>
                            (() => {
                              window.list = #{CHARTS.reject { |chart| chart.include?('|') }.map { |chart| chart.split(',').first }};
                              window.current_index = 0;
                            })()
                          </script>
                        </head>
                        <body oncontextmenu="return false;" class="no-scroll noselect">




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
  return '' if market_id.include?('|')

  stooq_id, info_link, description = market_id.split(',')

  <<~CHART
    <div class="#{timeframe == "3m" ? 'thin-img-wrapper' : 'img-wrapper'}">
      <img onload="window.watcherOnImageLoad()" loading="lazy" onerror="window.watcherOnImageError(this)" src="https://stooq.com/c/?s=#{stooq_id}&c=#{timeframe}&t=c&a=lg&b&g"> <div class="chart-info #{TIMEFRAMES_NAMES[TIMEFRAMES.index(timeframe)]}">#{TIMEFRAMES_NAMES[TIMEFRAMES.index(timeframe)]}</div></img>
    </div>
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

output << '<div class="grid-container">'
CHARTS.each do |market_id|
  stooq_id, info_link, description = market_id.split(',')

  output << if market_id.include?('|')
              "<div class='grid-item section-divider' id=#{market_id}>" + market_id.gsub('_', ' ') + '</div>'
            else
              "<div class='grid-item divider' id=#{stooq_id}><div class='inside-divider'><h4 class='no-margin'><a href='##{stooq_id}'>" + stooq_id + "</a></h4>#{info_link && !info_link.empty? ? "<h4><a href=#{info_link}>Symbol info</a></h4>" : ''}#{description && !description.empty? ? "<p>#{description}</p>" : ''}</div></div>"
            end
  next if market_id.include?('|')
  output << "<div class='chart-wrapper'>"
  TIMEFRAMES.each do |timeframe|
    output << chart(stooq_id, timeframe)
  end
  output << '</div>'
  output << ''
  first_divider_id = stooq_id + TIMEFRAMES.first
  menu_html << <<~MENU
    <div
      class="#{stooq_id.include?('|') ? 'divider-link' : 'chart-link'} noselect"
      tabindex="-1"
      id="#{stooq_id}"
      onClick="(function() {
        if (window.watcherLoaded) {
          if (window.scrollIntervalId) { clearInterval(window.scrollIntervalId) }
          window.skipClearInterval = true;
          window.lastScrollByProgram = true;
          #{
            if market_id.include?('|')
              "window.watcherSetCookie('scrollPosition', '#{CHARTS[CHARTS.index(stooq_id) + 1]}');"
            else
              "window.watcherSetCookie('scrollPosition', '#{stooq_id}');"
            end
          }
          window.scrollIntervalId = setInterval(() => {
            window.skipClearInterval = true;
            document.getElementById('#{stooq_id}').scrollIntoView()
          }, 50)
          window.current_index = window.list.indexOf('#{stooq_id}')
          window.watcherLastSelectedChart = '#{stooq_id}';
        }
      })()"
    >
      <span>#{stooq_id.gsub('_', ' ')}</span>
    </div>
  MENU
end
output << '</div>'
output << "<div id='parentDiv'>"

output << "<canvas id='canvas'></canvas>"
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
output << down_arr
# menu_html << down_arr

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
output << up_arr
# menu_html << up_arr

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
output << "<div class='grid-item section-divider'><h3 id='About'>About</h3></div>"
output << "<div class='grid-item divider about-content'><br>Use the button in the top left corner to open the menu.<br><br>You can draw on charts. Left mouse click to stroke with the cursor. Two right mouse clicks to draw a straight line from point A to point B. The scroll (middle) button click to insert an arrow.<br><br>Drawings disappearing when scrolling is intentional behavior. Make a screenshot of the page to save them.<br><br>Drawing is disabled on mobile devices.<br><br>You can scroll through the symbols using left/right arrow buttons.<br><br>Marked charts, color mode, and last selected chart will persist over page close.<br><br>You can create a link to a specific chart like this: <b>https://dominikduda.github.io/#MSFT.US</b><br><br>The page will automatically refresh every 10 minutes. You can keep the tab open, and the charts will always be up to date.<br><br>All charts come from stooq.com<br><br>You can generate such a static page for yourself. Check out the readme of the following repository: <b>https://github.com/dominikduda/dominikduda.github.io</b><br>Note that stuff persisting over browser close won't work on localhost.<br><br></div>"

output << '<div class="bottom-margin"></div>'

output << <<~PAGE_BOTTOM
      </div>
<div id='idiv'>
     <iframe scrolling="no" src="https://www.forexmarkethours.com/markethours.php" id="iframe_main">
</div>
    </body>
  </html>
PAGE_BOTTOM

File.write('./index.html', output)
