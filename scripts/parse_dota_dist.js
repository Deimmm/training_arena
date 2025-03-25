(() => {
  var fs = require("node:fs");
  var res = fs.readdirSync("./dota_dist/models/items", { recursive: true });
  res = res
    .filter((elem) => elem.includes(".vmdl_c"))
    .map((e) => e.replaceAll("\\", "/").replaceAll("vmdl_c", "vmdl"));
  console.dir(res, { depth: null });
  fs.writeFileSync("./result.json", JSON.stringify({ models: res }));
})();
