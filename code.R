#  run Cobol in R using V8 + cobolscript.js
#  slightly modified js source files to overcome require problems
#  all credit for cobolscript.js belongs to https://github.com/ajlopez/CobolScript

library(V8)

ct = new_context("window")

ct$source("http://timelyportfolio.github.io/CobolScript/lib/lexers.js")
ct$source("http://timelyportfolio.github.io/CobolScript/lib/parsers.js")
ct$source("http://timelyportfolio.github.io/CobolScript/lib/cobolscript.js")

ct$eval('var cobs = cobolscript;')

# run Hello World example
#  https://github.com/ajlopez/CobolScript/blob/master/samples/hello
ct$eval(
"cobs.compileProgram( 'display \"Hello, world\".').run(cobs.getRuntime());"
)


# run the factorial example
#  https://github.com/ajlopez/CobolScript/tree/master/samples/factorial
ct$eval(
  sprintf(
    "cobs.compileProgram('%s').run(cobs.getRuntime());"
    ,paste0(
      readLines("https://raw.githubusercontent.com/ajlopez/CobolScript/master/samples/factorial/factorial.cob")
      ,collapse=""
    )
  )
)