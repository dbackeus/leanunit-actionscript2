/*

The idea it that this should be a simple output class handling write and writeln functions. This implementation uses a html-enabled textfield on _root to display output with pretty colours. Please rewrite it if you desire some other kind of tracing behaviour.

*/

class leanUnit.Output
{
	//-------------------------------------------------------------------
	//	PUBLIC CLASS METHODS
	//-------------------------------------------------------------------
	
	static function write(message, messageType)
	{
		cssClass = messageType || 'default'
		instance.htmlText += '<span class="'+cssClass+'">'+message+'</span>'
	}
	
	static function writeln(message, messageType)
	{
		write( "<p>"+(message || '')+"</p>", messageType )
	}
	
	//-------------------------------------------------------------------
	//	PRIVATE CLASS METHODS
	//-------------------------------------------------------------------
	
	static function get instance()
	{
		if( !_root.testOutputTextField )
		{
			_root.createTextField('testOutputTextField', _root.getNextHighestDepth(), 0, 0, 0, 0)
			var tf:TextField = _root.testOutputTextField
			tf._width = Stage.width
			tf._height = Stage.height
			tf.multiline = true
			tf.wordWrap = true
			tf.html = true
			tf.setNewTextFormat(textFormat)
			tf.styleSheet = styleSheet
		}
		
		return _root.testOutputTextField
	}
	
	static function get textFormat():TextFormat
	{
		var tf = new TextFormat()
		tf.font = "Monaco"
		tf.size = 10
		tf.color = 0xFFFFFF
		
		return tf
	}
	
	static function get styleSheet()
	{
		var css = new TextField.StyleSheet()
		css.parseCSS(".default { color:#FFFFFF; } .success { color:#00FF00; } .fail { color:#FF0000; }")
		return css
	}
}