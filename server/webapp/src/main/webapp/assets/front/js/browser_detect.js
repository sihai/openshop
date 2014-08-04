/*jshint asi: false, bitwise: true, boss: false, curly: true, eqeqeq: true, eqnull: false, evil: false, forin: false, immed: true, laxbreak: false, newcap: true, noarg: true, noempty: true, nonew: false, nomen: false, onevar: true, plusplus: false, regexp: false, undef: true, sub: false, strict: false, white: false */
/*jshint browser: true, maxerr: 50, passfail: false */
/*global define: false, console: false */

(function () {
  var body, style, userAgent = navigator.userAgent, agentVersion, compatVersion, results = [];

  try {
    body = document.body;
    style = body.style;

    if (/android|iphone|ipad|ipod/i.test(userAgent)) {
      results.push("mobile");
    } else {
      results.push("no-mobile");
    }

    if (window.devicePixelRatio && 1 < window.devicePixelRatio) {
      results.push("retina");
    } else {
      results.push("no-retina");
    }

    if (/windows nt/i.test(userAgent)) {
      results.push("windows");
      results.push("windows" + userAgent.match(/windows nt ([\d\.]+)/i)[1].replace(".", "_"));
    } else if (/ipad|iphone|ipod/i.test(userAgent)) {
      results.push("ios");
      results.push("ios" + userAgent.match(/cpu (?:\w+ )?os ([\d_]+)/i)[1]);
    } else if (/mac\s?os\s?x/i.test(userAgent)) {
      results.push("mac");
      results.push("mac" + userAgent.match(/mac\s?os\s?x\s?(\d+.\d+)/i)[1]);
    } else if (/linux/i.test(userAgent)) {
      results.push("linux");
    }

    if (/chromeframe/i.test(userAgent)) {
      results.push("chromeframe");
    } else if (undefined !== style.scrollbar3dLightColor) {
      results.push("ie");

      agentVersion = userAgent.match(/msie (\d+)/i)[1];

      if (undefined !== style.transition) {
        compatVersion = "10";

        if (("msIsSiteMode" in window.external) && window.external.msIsSiteMode()) {
          results.push("pinned");
        }
      } else if (undefined !== style.opacity) {
        compatVersion = "9";

        if (("msIsSiteMode" in window.external) && window.external.msIsSiteMode()) {
          results.push("pinned");
        }
      } else if (undefined !== style.msBlockProgression) {
        compatVersion = "8";
      } else if (undefined !== style.msInterpolationMode) {
        compatVersion = "7";
      } else if (undefined !== style.textOverflow) {
        compatVersion = "6";
      }

      results.push("ie" + agentVersion);
      if (compatVersion !== agentVersion) {
        results.push("compatibilitymode");
        results.push("iecm" + compatVersion);
      }
    } else if (window.chrome && body.dataset) {
      results.push("chrome");
      results.push("chrome" + userAgent.match(/chrome\/(\d+)/i)[1]);
    } else if (undefined !== navigator.mozIsLocallyAvailable) {
      results.push("ff");
      results.push("ff" + userAgent.match(/firefox\/(\d+)/i)[1]);
    } else if (undefined !== window.opera) {
      results.push("opera");
      results.push("opera" + userAgent.match(/(version|opera)[\/ ](\d+)/i)[2]);
    } else if (/safari/i.test(userAgent)) {
      results.push("safari");
      results.push("safari" + userAgent.match(/version\/(\d+)/i)[1]); // will fail on Safari 2 or below
    }

    document.documentElement.className += " " + results.join(" ");
  } catch (e) {
    if (window.console && console.error) {
      console.error(e, e.stack);
    }
  }
}());
