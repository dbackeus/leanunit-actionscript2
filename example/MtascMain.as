import test.*

// Example usage:
// mtasc -cp .. -swf example.swf -header 550:400:10:080808 -main MtascMain.as

class MtascMain
{
	static function main(root)
	{
		var st = new StringTest()
		st.run()
	}
}