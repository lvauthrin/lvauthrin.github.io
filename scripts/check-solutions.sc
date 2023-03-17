//> using lib "com.lihaoyi::os-lib:0.9.0"
//> using lib "com.lihaoyi::ujson:2.0.0"

@main
def check(jsonFile: String): Unit = {
  val jsonString = os.read(os.pwd / os.RelPath(jsonFile))
  val json = ujson.read(jsonString)
  val mismatches = json.arr
    .map(o => o("code").str)
    .map(o => o.stripPrefix("https://github.com/lvauthrin/leetcode/blob/main/"))
    .map(o =>
      os.root / "Users" / "lvauthrin" / "code" / "leetcode" / os.RelPath(o)
    )
    .filterNot(o => os.isFile(o))
    .sorted

  println(mismatches.mkString("\n"))
  println(s"Found ${mismatches.size}")
  // Need json lib and os lib
  // From json, extract list of urls
  // map each url to a path
  // for each path, check if the file exists in given directory
}
