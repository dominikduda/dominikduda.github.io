window.watcherRefreshMenu = function() {
  if (window.watcherGetCookie('marked_charts') == null) {
    return
  }
  const els = document.getElementsByClassName('chart-link')
  for (i = 0; i < els.length; i++) {
    const el = els[i]
    el.classList.remove('marked')
    if (window.watcherGetCookie('marked_charts').includes(el.id + ',')) {
      el.classList.add('marked')
    }
  }
}

window.watcherOnImageLoad = function() {
  const el = document.getElementById(getCookie('scrollPosition'))
  window.skipClearInterval = true;
  if (window.lastScrollByProgram) {
    if (window.scrollIntervalId) { clearInterval(window.scrollIntervalId) }
    window.scrollIntervalId = setInterval(() => {
      window.skipClearInterval = true;
      el.scrollIntoView()
    }, 50)
  }
}

function getRandomInt(min, max) {
  min = Math.ceil(min);
  max = Math.floor(max);
  return Math.floor(Math.random() * (max - min)) + min;
}

window.watcherOnImageError = (img) => {
  const initialSrc = img.src
  if (!initialSrc.includes('grandma.png')) {
    img.initialSrc = initialSrc;
    img.src = "https://raw.githubusercontent.com/dominikduda/dominikduda.github.io/master/grandma.png";
  }
  setTimeout(() => {
    img.src = img.initialSrc;
  }, getRandomInt(2000, 5000))
}

function setCookie(name,value,days = 9999) {
  var expires = "";
  if (days) {
    var date = new Date();
    date.setTime(date.getTime() + (days*24*60*60*1000));
    expires = "; expires=" + date.toUTCString();
  }
  document.cookie = name + "=" + (value || "")  + expires + "; path=/";
}

function getCookie(name) {
  var nameEQ = name + "=";
  var ca = document.cookie.split(';');
  for(var i=0;i < ca.length;i++) {
    var c = ca[i];
    while (c.charAt(0)==' ') c = c.substring(1,c.length);
    if (c.indexOf(nameEQ) == 0) return c.substring(nameEQ.length,c.length);
  }
  return null;
}


function isMobile() {
  let check = false;
  (function(a){if(/(android|bb\d+|meego).+mobile|avantgo|bada\/|blackberry|blazer|compal|elaine|fennec|hiptop|iemobile|ip(hone|od)|iris|kindle|lge |maemo|midp|mmp|mobile.+firefox|netfront|opera m(ob|in)i|palm( os)?|phone|p(ixi|re)\/|plucker|pocket|psp|series(4|6)0|symbian|treo|up\.(browser|link)|vodafone|wap|windows ce|xda|xiino/i.test(a)||/1207|6310|6590|3gso|4thp|50[1-6]i|770s|802s|a wa|abac|ac(er|oo|s\-)|ai(ko|rn)|al(av|ca|co)|amoi|an(ex|ny|yw)|aptu|ar(ch|go)|as(te|us)|attw|au(di|\-m|r |s )|avan|be(ck|ll|nq)|bi(lb|rd)|bl(ac|az)|br(e|v)w|bumb|bw\-(n|u)|c55\/|capi|ccwa|cdm\-|cell|chtm|cldc|cmd\-|co(mp|nd)|craw|da(it|ll|ng)|dbte|dc\-s|devi|dica|dmob|do(c|p)o|ds(12|\-d)|el(49|ai)|em(l2|ul)|er(ic|k0)|esl8|ez([4-7]0|os|wa|ze)|fetc|fly(\-|_)|g1 u|g560|gene|gf\-5|g\-mo|go(\.w|od)|gr(ad|un)|haie|hcit|hd\-(m|p|t)|hei\-|hi(pt|ta)|hp( i|ip)|hs\-c|ht(c(\-| |_|a|g|p|s|t)|tp)|hu(aw|tc)|i\-(20|go|ma)|i230|iac( |\-|\/)|ibro|idea|ig01|ikom|im1k|inno|ipaq|iris|ja(t|v)a|jbro|jemu|jigs|kddi|keji|kgt( |\/)|klon|kpt |kwc\-|kyo(c|k)|le(no|xi)|lg( g|\/(k|l|u)|50|54|\-[a-w])|libw|lynx|m1\-w|m3ga|m50\/|ma(te|ui|xo)|mc(01|21|ca)|m\-cr|me(rc|ri)|mi(o8|oa|ts)|mmef|mo(01|02|bi|de|do|t(\-| |o|v)|zz)|mt(50|p1|v )|mwbp|mywa|n10[0-2]|n20[2-3]|n30(0|2)|n50(0|2|5)|n7(0(0|1)|10)|ne((c|m)\-|on|tf|wf|wg|wt)|nok(6|i)|nzph|o2im|op(ti|wv)|oran|owg1|p800|pan(a|d|t)|pdxg|pg(13|\-([1-8]|c))|phil|pire|pl(ay|uc)|pn\-2|po(ck|rt|se)|prox|psio|pt\-g|qa\-a|qc(07|12|21|32|60|\-[2-7]|i\-)|qtek|r380|r600|raks|rim9|ro(ve|zo)|s55\/|sa(ge|ma|mm|ms|ny|va)|sc(01|h\-|oo|p\-)|sdk\/|se(c(\-|0|1)|47|mc|nd|ri)|sgh\-|shar|sie(\-|m)|sk\-0|sl(45|id)|sm(al|ar|b3|it|t5)|so(ft|ny)|sp(01|h\-|v\-|v )|sy(01|mb)|t2(18|50)|t6(00|10|18)|ta(gt|lk)|tcl\-|tdg\-|tel(i|m)|tim\-|t\-mo|to(pl|sh)|ts(70|m\-|m3|m5)|tx\-9|up(\.b|g1|si)|utst|v400|v750|veri|vi(rg|te)|vk(40|5[0-3]|\-v)|vm40|voda|vulc|vx(52|53|60|61|70|80|81|83|85|98)|w3c(\-| )|webc|whit|wi(g |nc|nw)|wmlb|wonu|x700|yas\-|your|zeto|zte\-/i.test(a.substr(0,4))) check = true;})(navigator.userAgent||navigator.vendor||window.opera);
  return check;
}

const handleScroll = () => {
  if (window.scrollIntervalId && !window.skipClearInterval && !window.lastScrollByProgram) {
    clearInterval(window.scrollIntervalId)
  }

  if (!window.skipClearInterval) {
    window.lastScrollByProgram = false;
  }

  const lastScrollSynthetic = window.skipClearInterval
  window.skipClearInterval = false;
  if (!window.watcherDividers || !window.watcherMenuElements) { return }
  let current = window.watcherGetCookie('scrollPosition');
  window.watcherDividers.forEach((section) => {
    const sectionTop = section.offsetTop;
    const sectionHeight = section.clientHeight;
    if (pageYOffset >= sectionTop - window.innerHeight / 5) {
      if (!window.lastScrollByProgram) {
        current = section.getAttribute("id");
        window.watcherSetCookie('scrollPosition', section.getAttribute("id"))
      }
    }
  });
  window.watcherMenuElements.forEach((li) => {
    li.classList.remove("active");
    if (li.id == current) {
      li.classList.add("active");
    }
  });
  window.current_index = window.list.indexOf(current)
  window.watcherLastSelectedChart = current;
}

setTimeout(() => {
  document.body.classList.remove('no-scroll')
  const currentHash = window.location.hash
  const isFirstVisit = getCookie('notFirstVisit') === null
  if (isFirstVisit && window.location.hash === '') {
    setCookie('scrollPosition', 'About')
  }
  if (currentHash.includes('#')) {
    const symbolName = currentHash.substr(1)
    if (window.list.includes(symbolName) || symbolName === 'About') {
      setCookie('scrollPosition', symbolName)
    }
    window.location.hash = ''
  }
  setCookie('notFirstVisit', true)
  window.skipClearInterval = true;
  window.lastScrollByProgram = true;
  const el = document.getElementById(getCookie('scrollPosition'))
  if (window.scrollIntervalId) { clearInterval(window.scrollIntervalId) }
  window.scrollIntervalId = setInterval(() => {
    window.skipClearInterval = true;
    el.scrollIntoView()
  }, 50)
  document.getElementsByClassName('loaderWrapper')[0].classList.add('fade-out')
  window.watcherLoaded = true;
  handleScroll()
}, 200)

const afterPageOpen = () => {
  window.watcherDividers =  document.querySelectorAll(".divider");
  window.watcherMenuElements =  document.querySelectorAll(".chart-link");
  if (window.watcherGetCookie('mode') == 'dark') {
    const element = document.querySelector('.grid-container');
    element.classList.add('darkMode');
    window.watcherSetCookie('mode', 'dark')
  }
  if (!window.watcherGetCookie('marked_charts')) {
    window.watcherSetCookie('marked_charts', '')
  }
  window.watcherRefreshMenu();
}
setTimeout(() => {
  const canvas = document.getElementById("canvas");
  const parentDiv = document.getElementById("parentDiv");
  const ctx = canvas.getContext("2d");

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

  let drawing = false;

  // a function to detect the mouse position
  function oMousePos(element, evt) {
    var ClientRect = element.getBoundingClientRect();
    return { //objeto
      x: Math.round(evt.clientX - ClientRect.left),
      y: Math.round(evt.clientY - ClientRect.top)
    }
  }

  parentDiv.addEventListener('mousedown', function(evt) {
    document.getElementsByClassName('overlay')[0].classList.remove('maximized')
    document.getElementsByClassName('overlay')[0].classList.add('minimized')
    setTimeout(() => {
      document.getElementsByClassName('timer')[0].classList.remove('force-non-opaque')
    }, 310)
    drawing = true; // you can draw now
    let m = oMousePos(parentDiv, evt);
    ctx.beginPath();
    ctx.moveTo(m.x,m.y);
  }, false);

  parentDiv.addEventListener('mouseup', function(evt) {
    drawing = false; // you can't draw anymore
  }, false);
  parentDiv.addEventListener('mouseleave', function(evt) {
    drawing = false; // you can't draw anymore
  }, false);

  parentDiv.addEventListener("mousemove", function(evt) {
    if (drawing) {
      let m = oMousePos(parentDiv, evt);
      ctx.lineTo(m.x, m.y);
      ctx.stroke();
    }
  }, false);






  const timerEl = document.getElementsByClassName('timer')[0]
  if (!isMobile()) {
    timerEl.addEventListener('mouseenter', function(evt) {
      document.getElementsByClassName('overlay')[0].classList.add('maximized')
      document.getElementsByClassName('timer')[0].classList.add('force-non-opaque')
      document.getElementsByClassName('overlay')[0].classList.remove('minimized')
    }, false);
  }

  timerEl.addEventListener('mouseenter', function(evt) {
    clearTimeout(window.menuDisappearTimeout)
  })
  timerEl.addEventListener('mouseleave', function(evt) {
    if (!isMobile()) {
      window.menuDisappearTimeout = setTimeout(
        () => {
          document.getElementsByClassName('overlay')[0].classList.remove('maximized')
          document.getElementsByClassName('overlay')[0].classList.add('minimized')
          setTimeout(() => {
            document.getElementsByClassName('timer')[0].classList.remove('force-non-opaque')
          }, 310)
        },
        900
      )
    }
  }, false);



  const overlayEl = document.getElementsByClassName('overlay')[0]
  overlayEl.addEventListener('mouseleave', function(evt) {
    if (!isMobile()) {
      window.menuDisappearTimeout = setTimeout(
        () => {
          document.getElementsByClassName('overlay')[0].classList.remove('maximized')
          document.getElementsByClassName('overlay')[0].classList.add('minimized')
          setTimeout(() => {
            document.getElementsByClassName('timer')[0].classList.remove('force-non-opaque')
          }, 310)
        },
        900
      )
    } else {
      window.menuDisappearTimeout = setTimeout(
        () => {
          document.getElementsByClassName('overlay')[0].classList.remove('maximized')
          document.getElementsByClassName('overlay')[0].classList.add('minimized')
          window.menuDisappearTimeout = setTimeout(() => {
            document.getElementsByClassName('timer')[0].classList.remove('force-non-opaque')
          }, 310)
        },
        20
      )
    }
  }, false);

  overlayEl.addEventListener('mouseenter', function(evt) {
    clearTimeout(window.menuDisappearTimeout)
  })



}, 200)

setTimeout(() => {
  document.getElementsByClassName('overlay')[0].classList.remove('initial-overlay')
}, 300)


history.scrollRestoration = "manual"
window.watcherSetCookie = setCookie;
window.watcherGetCookie = getCookie;
document.addEventListener('scroll', handleScroll);
setTimeout(afterPageOpen,50)
setTimeout(afterPageOpen,100)
setTimeout(afterPageOpen,500)
