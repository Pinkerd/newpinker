<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<title>Tesselation Transition</title>

<link rel="stylesheet" type="text/css" href="css/backgroud.css"/>

<script type="text/javascript" src="js/Stats.min.js"></script>
<script type="text/javascript" src="js/TweenMax.min.js"></script>


</head>
<body>
<svg id="demo" viewBox="0 0 1600 600" preserveAspectRatio="xMidYMid slice">
  <defs>
    <linearGradient id="grad1" x1="0" y1="0" x2="1" y2="0" color-interpolation="sRGB">
      <stop id="stop1a" offset="0%" stop-color="#12a3b4"></stop>
      <stop id="stop1b" offset="100%" stop-color="#ff509e"></stop>
    </linearGradient>
    <linearGradient id="grad2" x1="0" y1="0" x2="1" y2="0" color-interpolation="sRGB">
      <stop id="stop2a" offset="0%" stop-color="#e3bc13"></stop>
      <stop id="stop2b" offset="100%" stop-color="#00a78f"></stop>
    </linearGradient>
  </defs>
  <rect id="rect1" x="0" y="0" width="1600" height="600" stroke="none" fill="url(#grad1)"></rect>
  <rect id="rect2" x="0" y="0" width="1600" height="600" stroke="none" fill="url(#grad2)"></rect>
</svg>

<script type="text/javascript" src="js/login.js"></script>

</body>
</html>

