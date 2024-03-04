file://<HOME>/Single%20Cycle/src/main/scala/SC/Program-Counter.scala
### file%3A%2F%2F%2Fhome%2Fomer%2FSingle%2520Cycle%2Fsrc%2Fmain%2Fscala%2FSC%2FProgram-Counter.scala:23: error: end of file expected but } found
}
^

occurred in the presentation compiler.

action parameters:
uri: file://<HOME>/Single%20Cycle/src/main/scala/SC/Program-Counter.scala
text:
```scala
package main

import chisel3._
import chisel3.util._

class PC extends Module {
    val io = IO ( new Bundle {
    val program_counter = Input(UInt(32.W))
    val pc = Output(UInt(32.W))
    val pc4 = Output(UInt(32.W))

    })


    io.pc := 0.U
    io.pc4 := 0.U

    when(io.program_counter === 4.U) {
    io.pc := 4.U
    io.pc4 := 8.U  // For example, set pc4 to 8 when program_counter is 4
  }
}
}
```



#### Error stacktrace:

```
scala.meta.internal.parsers.Reporter.syntaxError(Reporter.scala:16)
	scala.meta.internal.parsers.Reporter.syntaxError$(Reporter.scala:16)
	scala.meta.internal.parsers.Reporter$$anon$1.syntaxError(Reporter.scala:22)
	scala.meta.internal.parsers.Reporter.syntaxError(Reporter.scala:17)
	scala.meta.internal.parsers.Reporter.syntaxError$(Reporter.scala:17)
	scala.meta.internal.parsers.Reporter$$anon$1.syntaxError(Reporter.scala:22)
	scala.meta.internal.parsers.ScalametaParser.syntaxErrorExpected(ScalametaParser.scala:421)
	scala.meta.internal.parsers.ScalametaParser.expect(ScalametaParser.scala:423)
	scala.meta.internal.parsers.ScalametaParser.accept(ScalametaParser.scala:427)
	scala.meta.internal.parsers.ScalametaParser.parseRuleAfterBOF(ScalametaParser.scala:63)
	scala.meta.internal.parsers.ScalametaParser.parseRule(ScalametaParser.scala:54)
	scala.meta.internal.parsers.ScalametaParser.parseSource(ScalametaParser.scala:132)
	scala.meta.parsers.Parse$.$anonfun$parseSource$1(Parse.scala:29)
	scala.meta.parsers.Parse$$anon$1.apply(Parse.scala:36)
	scala.meta.parsers.Api$XtensionParseDialectInput.parse(Api.scala:25)
	scala.meta.internal.semanticdb.scalac.ParseOps$XtensionCompilationUnitSource.toSource(ParseOps.scala:17)
	scala.meta.internal.semanticdb.scalac.TextDocumentOps$XtensionCompilationUnitDocument.toTextDocument(TextDocumentOps.scala:206)
	scala.meta.internal.pc.SemanticdbTextDocumentProvider.textDocument(SemanticdbTextDocumentProvider.scala:54)
	scala.meta.internal.pc.ScalaPresentationCompiler.$anonfun$semanticdbTextDocument$1(ScalaPresentationCompiler.scala:374)
```
#### Short summary: 

file%3A%2F%2F%2Fhome%2Fomer%2FSingle%2520Cycle%2Fsrc%2Fmain%2Fscala%2FSC%2FProgram-Counter.scala:23: error: end of file expected but } found
}
^