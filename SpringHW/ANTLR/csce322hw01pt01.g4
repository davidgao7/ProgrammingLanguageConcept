grammar csce322hw01pt01;

// tokens
OpenSection:'\\begin{section}';
EndSection:'\\end{section}';
MoveTitle: '\\title{Moves}';
MazeTitle: '\\title{Maze}';
AssignVal: '::';
MoveSymbo: 'c' | 'cc' | '180';
MazeSymbo: '-' | 'g' | 'x' | [0-9]+;
NumSymbo: [0-9];
RowEnding: '\\\\';
MazeBegin: '\\begin{maze}';
MazeEnd: '\\end{maze}';
ListBegin: '\\begin{moves}';
ListEndin: '\\end{moves}';
WS: [\r\t\n~ ]+ -> skip;
Other:.;

// rules
gravityGame : (moves maze |Other{System.out.println("The unrecognizable token "+_ctx.getText()+ " appears in line " + _ctx.start.getLine()+".");System.exit(0);}){ System.out.println( "Close of File" ); } | (maze moves) { System.out.println( "Close of File" ); }EOF;

moves:beginSection titleSection assign openList moveDesign closeSection;

maze:beginSection titleSection assign openMaze mazeDesign closeMaze closeSection;

beginSection: OpenSection{System.out.println("Open Section: "+_ctx.getText());};


closeSection: EndSection{System.out.println("Close Section: "+_ctx.getText());};


titleSection: MoveTitle{System.out.println("Section Title: "+_ctx.getText());} | MazeTitle{System.out.println("Section Title: "+_ctx.getText());};


assign: AssignVal{System.out.println("Designation: "+_ctx.getText());};


openMaze: MazeBegin{System.out.println("Open Maze: "+_ctx.getText());};


openList: ListBegin{System.out.println("Open Moves: "+_ctx.getText());};


mazeDesign: (MazeSymbo{System.out.println("Location: "+$MazeSymbo.getText());} (RowEnding{System.out.println("Close Row: "+$RowEnding.getText());})?)+;


closeMaze: MazeEnd{System.out.println("Close Maze: "+_ctx.getText());};


moveDesign: (MoveSymbo{System.out.println("Move: "+$MoveSymbo.getText());} (ListEndin{System.out.println("Close Moves: "+$ListEndin.getText());})?)+;

