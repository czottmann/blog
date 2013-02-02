var subline = document.getElementById("side-header-subline"),
  claims = [
    "Bavaria-based freelance web dev at day, beloved local vigilante \"Bavman\" at night.",
    "From The People Who Brought You Breathable Atmosphere And Porn.",
    "I Didn't Ask For This.",
    "Entirely Unsuspicious Human Person.",
    "Who writes these things?",
    "Have you been to <a href='http://www.kiva.org/invitedby/czottmann' target='_blank'>Kiva</a> lately?  It's a Good Thing&trade;.",
    "Today's lucky number is 22.",
    "I'm not a rocket scientist.",
    "This is not the Topkapı Palace.",
    "You look nice today.",
    "You should really start to eat better.",
    "A word of warning: not everything you'll read here is utterly brilliant.",
    "Sometimes, I have memories of driving around Liberty City.  Makes me smile.",
    "I was hooting when that Dragon capsule docked.  I love everything it stands for.",
    "\"A wise man told me don't argue with fools / Cause people from a distance can't tell who is who\"<br>— Jay-Z"
  ];

subline.innerHTML = claims[ Math.floor( Math.random() * claims.length ) ];
