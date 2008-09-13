class test.ArrayTest extends leanUnit.TestCase
{
	var array
	
	function setup()
	{
		array = ['asdf', 'qwer', 'hjkl']
	}
	
	function testLength()
	{
		assertEqual( 3, array.length )
	}
	
	function testJoin()
	{
		assertEqual( 'asdf_qwer_hjkl', array.join('_') )
		assertEqual( 'asdf qwer hjkl', array.join(' ') )
		assertEqual( 'asdf,qwer,hjkl', array.join() )
	}
}
