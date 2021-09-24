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

window.watcherOnImageError = (img) => {
  img.src = "https://raw.githubusercontent.com/dominikduda/dominikduda.github.io/master/grandma.png";
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

const highlightListItem = () => {
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

window.addEventListener('load', () => {
  setTimeout(() => {
    document.body.classList.remove('no-scroll')
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
    highlightListItem()
  }, 500)
})

const afterPageOpen = () => {
  window.watcherDividers =  document.querySelectorAll(".divider");
  window.watcherMenuElements =  document.querySelectorAll(".chart-link");
  if (window.watcherGetCookie('mode') == 'dark') {
    console.log('dark mode enabled')
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
console.log(timerEl)
timerEl.addEventListener('mouseenter', function(evt) {
  document.getElementsByClassName('overlay')[0].classList.add('maximized')
  document.getElementsByClassName('timer')[0].classList.add('force-non-opaque')
  document.getElementsByClassName('overlay')[0].classList.remove('minimized')
}, false);

const overlayEl = document.getElementsByClassName('overlay')[0]
console.log(overlayEl)
overlayEl.addEventListener('mouseleave', function(evt) {
  document.getElementsByClassName('overlay')[0].classList.remove('maximized')
  document.getElementsByClassName('overlay')[0].classList.add('minimized')
    setTimeout(() => {
  document.getElementsByClassName('timer')[0].classList.remove('force-non-opaque')
    }, 310)
}, false);

}, 200)


history.scrollRestoration = "manual"
window.watcherSetCookie = setCookie;
window.watcherGetCookie = getCookie;
document.addEventListener('scroll', highlightListItem);
setTimeout(afterPageOpen,50)
setTimeout(afterPageOpen,100)
setTimeout(afterPageOpen,500)
