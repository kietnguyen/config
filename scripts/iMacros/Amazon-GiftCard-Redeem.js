var extractCodes = "CODE:";
extractCodes += "TAG POS=1 TYPE=HTML ATTR=CLASS:* EXTRACT=HTM" + "\n";

iimPlay(extractCodes);

var text = iimGetLastExtract();

var matches = text.match(/[A-Z0-9]{4}-[A-Z0-9]{6}-[A-Z0-9]{4}/g).sort();
var codes = [];

matches.forEach(function(match) {
  var found = false;
  for (var i = 0; i < codes.length; i++)
    if (codes[i] === match) {
      found = true; break;
    }
  if (!found) codes.push(match);
});

window.console.log(codes);
alert("Found: " + codes.length);

codes.forEach(function(code) {
  var enterGCCode = "CODE:"
  enterGCCode += "WAIT SECONDS=1" + "\n"
  enterGCCode += "URL GOTO=https://www.amazon.com/gp/css/gc/payment/" + "\n";
  enterGCCode += "TAG POS=1 TYPE=INPUT:TEXT FORM=ACTION:https://www.amazon.com/gp/css/gc/payment/redeem-gc-balance/ref=gc_redeem_web_01 ATTR=ID:claimCodeInput CONTENT=" + code + "\n";
  iimPlay(enterGCCode);
  
  var captchaCode = "CODE:";
  captchaCode += "TAG POS=1 TYPE=P ATTR=CLASS:captchaImage EXTRACT=HTM" + "\n";
  iimPlay(captchaCode);
  var captchFound = iimGetLastExtract();
  
  if (captchFound === '#EANF#') {
    var redeemCode = "CODE:";
    redeemCode += "TAG POS=1 TYPE=INPUT:SUBMIT FORM=ACTION:https://www.amazon.com/gp/css/gc/payment/redeem-gc-balance/ref=gc_redeem_web_01 ATTR=NAME:applytoaccount" + "\n";
    iimPlay(redeemCode);    
  } else {
    iimPlay("CODE:PAUSE");
  }
  
});
