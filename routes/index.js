var express = require("express");
var router = express.Router();
const fs = require("fs");

/* GET home page. */
router.get("/", function (req, res, next) {
  let ip = req.headers["x-forwarded-for"] || req.socket.remoteAddress;
  let nonProxyIP = req.ips;
  const content = `IP: ${ip} \n NonProxyIP: ${nonProxyIP}`;
  console.log(content);
  fs.appendFile("file.log", content, (err) => {
    if (err) {
      console.error(err);
      return;
    }
    //done!
  });

  res.render("index", { title: "Express" });
});

module.exports = router;
