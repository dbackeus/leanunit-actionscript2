class StringTest extends leanUnit.TestCase
{
	var string
	
	function setup()
	{
		string = 'AsdF'
	}
	
	function testLength()
	{
		assertEqual(4, string.length)
	}
	
	function testToUpperCase()
	{
		assertEqual( 'ASDF', string.toUpperCase() )
	}
	
	function testToLowerCase()
	{
		assertEqual( 'asdf', string.toLowerCase() )
	}
	
	function testSplit()
	{
		var split = 'asdf_qwer_hjkl'.split('_')
		assertEqual( 'asdf', split[0] )
		assertEqual( 'hjkl', split[2] )
		assertEqual( 3, split.length )
	}
	
	function teardown()
	{
		delete string
	}
}
