file://<HOME>/Single%20Cycle/src/main/scala/SC/Imm_instruction-Counter.scala
### java.lang.ArrayIndexOutOfBoundsException: Index 3 out of bounds for length 3

occurred in the presentation compiler.

action parameters:
offset: 0
uri: file://<HOME>/Single%20Cycle/src/main/scala/SC/Imm_instruction-Counter.scala
text:
```scala
@@
```



#### Error stacktrace:

```
scala.reflect.internal.util.BatchSourceFile.findLine$1(SourceFile.scala:201)
	scala.reflect.internal.util.BatchSourceFile.offsetToLine(SourceFile.scala:204)
	scala.meta.internal.pc.MetalsGlobal$XtensionPositionMetals.toPos(MetalsGlobal.scala:678)
	scala.meta.internal.pc.MetalsGlobal$XtensionPositionMetals.toLsp(MetalsGlobal.scala:691)
	scala.meta.internal.pc.PcDocumentHighlightProvider.collect(PcDocumentHighlightProvider.scala:21)
	scala.meta.internal.pc.PcDocumentHighlightProvider.collect(PcDocumentHighlightProvider.scala:9)
	scala.meta.internal.pc.PcCollector.scala$meta$internal$pc$PcCollector$$collect$1(PcCollector.scala:315)
	scala.meta.internal.pc.PcCollector.traverseWithParent$1(PcCollector.scala:384)
	scala.meta.internal.pc.PcCollector.traverseSought(PcCollector.scala:521)
	scala.meta.internal.pc.PcCollector.resultWithSought(PcCollector.scala:289)
	scala.meta.internal.pc.PcCollector.result(PcCollector.scala:218)
	scala.meta.internal.pc.PcDocumentHighlightProvider.highlights(PcDocumentHighlightProvider.scala:30)
	scala.meta.internal.pc.ScalaPresentationCompiler.$anonfun$documentHighlight$1(ScalaPresentationCompiler.scala:358)
```
#### Short summary: 

java.lang.ArrayIndexOutOfBoundsException: Index 3 out of bounds for length 3