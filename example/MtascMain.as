import test.*
import leanUnit.*

// Example usage:
// mtasc -cp .. -swf example.swf -header 550:400:10:080808 -main MtascMain.as

class MtascMain
{
	static function main(root)
	{
		var testSuite = new TestSuite()
		testSuite.addCase( new StringTest() )
		testSuite.addCase( new ArrayTest() )
		testSuite.run()
	}
}