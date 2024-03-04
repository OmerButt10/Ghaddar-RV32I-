file://<HOME>/Single%20Cycle/src/test/scala/SC/Data-Memory.scala
### java.lang.StringIndexOutOfBoundsException: offset 350, count -5, length 360

occurred in the presentation compiler.

action parameters:
offset: 352
uri: file://<HOME>/Single%20Cycle/src/test/scala/SC/Data-Memory.scala
text:
```scala
package SC

import chisel3._
import chisel3.util._
    
class Data_Memory extends Module {
    val io= IO(new Bundle{
    val Data_Mem_address = Input(UInt(32.W))
    val Data_Mem_data = Input(SInt(32.W))
    val Data_Mem_write = Input(Bool())
    val Data_Mem_read = Input(Bool())
    val Data_Mem_output = Output(SInt(32.W))
})

    val mem = Mem(102@@)




}
```



#### Error stacktrace:

```
java.base/java.lang.String.checkBoundsOffCount(String.java:4586)
	java.base/java.lang.String.rangeCheck(String.java:304)
	java.base/java.lang.String.<init>(String.java:300)
	scala.tools.nsc.interactive.Global.typeCompletions$1(Global.scala:1230)
	scala.tools.nsc.interactive.Global.completionsAt(Global.scala:1253)
	scala.meta.internal.pc.SignatureHelpProvider.$anonfun$treeSymbol$1(SignatureHelpProvider.scala:390)
	scala.Option.map(Option.scala:230)
	scala.meta.internal.pc.SignatureHelpProvider.treeSymbol(SignatureHelpProvider.scala:388)
	scala.meta.internal.pc.SignatureHelpProvider$MethodCall$.unapply(SignatureHelpProvider.scala:205)
	scala.meta.internal.pc.SignatureHelpProvider$MethodCallTraverser.visit(SignatureHelpProvider.scala:316)
	scala.meta.internal.pc.SignatureHelpProvider$MethodCallTraverser.traverse(SignatureHelpProvider.scala:310)
	scala.meta.internal.pc.SignatureHelpProvider$MethodCallTraverser.fromTree(SignatureHelpProvider.scala:279)
	scala.meta.internal.pc.SignatureHelpProvider.signatureHelp(SignatureHelpProvider.scala:27)
	scala.meta.internal.pc.ScalaPresentationCompiler.$anonfun$signatureHelp$1(ScalaPresentationCompiler.scala:300)
```
#### Short summary: 

java.lang.StringIndexOutOfBoundsException: offset 350, count -5, length 360