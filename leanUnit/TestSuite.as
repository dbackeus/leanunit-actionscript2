/*
Should hold n TestCase's, run them and do a single report for all.
*/

import leanUnit.*

class leanUnit.TestSuite
{
	var testCases:Array
	
	var testCount:Number = 0
	var assertionCount:Number = 0
	var failures:Array = new Array()
	
	//-------------------------------------------------------------------
	//	CONSTRUCTOR
	//-------------------------------------------------------------------

	function TestSuite()
	{
		testCases = new Array()
	}
	
	
	//-------------------------------------------------------------------
	//	PUBLIC FUNCTIONS
	//-------------------------------------------------------------------
	
	function addCase( testCase:TestCase )
	{
		testCases.push( testCase )
	}
	
	function run()
	{
		reset()
		
		Output.writeln( "Running "+testCases.join(', ') )
		
		var startTime = getTimer()
		for( var i=0; i<testCases.length; i++ )
		{
			var testCase:TestCase = testCases[i]
			testCase.run( true )
			
			failures = merge( failures, testCase.failures )
			testCount += testCase.testMethods.length
			assertionCount += testCase.assertionCount
		}	
		var endTime = getTimer() - startTime
		
		Output.writeln()
		Output.writeln('Finished in '+(endTime/1000)+' seconds')
		
		report()
	}
	
	//-------------------------------------------------------------------
	//	PRIVATE FUNCTIONS
	//-------------------------------------------------------------------
	
	private function reset()
	{
		testCount = 0
		assertionCount = 0
		failures = new Array()
	}
	
	private function merge( array:Array, array2:Array )
	{
		for( var i=0; i<array2.length; i++ )
		{
			array.push(array2[i])
		}
		return array
	}
	
	private function report()
	{
		for( var i=0; i<failures.length; i++ )
		{
			Output.writeln()
			Output.writeln( (i+1)+")")
			Output.writeln( failures[i], "fail" )
		}
		Output.writeln()
		Output.writeln( testCount+" tests, "+assertionCount+" assertions, "+failures.length+" failures", failures.length > 0 ? 'fail' : 'success' )
	}
	
}