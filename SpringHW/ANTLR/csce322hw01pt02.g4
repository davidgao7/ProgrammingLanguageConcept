grammar csce322hw01pt02;

@members{
 int moves = 0;
 int minMoves = 5;
 int rows = 0;
 int columns = 0;
 int minRows = 5;
 int minColumn = 5;
 int columnsPerrow = 0;
 int totalPlayer = 0;
 int gsymbol = 0;
 int cm = 0;
 int ccm = 0;
 int move180 = 0;
 boolean isCorrectFormat = true;
 boolean exit = false;
}
// tokens
OpenSection:'\\begin{section}';
EndSection:'\\end{section}';
MoveTitle: '\\title{Moves}';
MazeTitle: '\\title{Maze}';
AssignVal: '::';
CMove:'c';
CCMove:'cc';
Move180:'180';
EmptyMaze: '-';
FilledMaze: 'x';
Gsymbol:'g';
PlayerSymbo: [1-4];
RowEnding: '\\\\';
MazeBegin: '\\begin{maze}';
MazeEnd: '\\end{maze}';
ListBegin: '\\begin{moves}';
ListEndin: '\\end{moves}';
WS: [\r\t\n~ ]+ -> skip;
Other:.;

// rules
gravityGame : (moves maze) | (maze moves) | Other{
                                                    if(exit){
                                                        System.exit(0);
                                                    }
                                                    //System.out.println("Something unexpected happened on Line " + _ctx.start.getLine()+".(Other line in the end)");
                                                    System.out.println("Something unexpected happened on Line " + _ctx.start.getLine()+".");
                                                    isCorrectFormat = false;
                                                    exit = true;
                                                    System.exit(0);
                                                    System.out.print("statement after system.exit(0) why still alive");
                                                   } EOF;

moves:beginSection titleSection assign openMoves moveDesign{
                                                            if (exit){
                                                                System.exit(0);
                                                                //System.out.print("statement after system.exit(0) why still alive");
                                                            }
                                                            //System.out.println("total moves: "+ moves);
                                                            if(moves<=minMoves){
                                                                    //System.out.println("Something unexpected happened on Line " + _ctx.start.getLine()+".(movesDesign line)");
                                                                    System.out.println("Something unexpected happened on Line " + _ctx.start.getLine()+".");
                                                                    isCorrectFormat = false;
                                                                    exit = true;
                                                                    System.exit(0);
                                                                    System.out.print("statement after system.exit(0) why still alive");
                                                            }else if(isCorrectFormat && !exit){
                                                               System.out.println("This game has "+ totalPlayer + " players . ( If you are not attempting extra credit or honors )");
                                                            }

                                                            if(cm<1 || ccm<1 || move180<1 && !exit){
                                                               System.out.println("The semantic rule 4 was violated.");
                                                               isCorrectFormat = false;
                                                            }
                                                          }
                                             closeMove{
                                                        if(exit){
                                                            System.exit(0);
                                                        }
                                                        } closeSection;

maze:beginSection titleSection assign openMaze mazeDesign{
                                                          if (exit){
                                                              System.exit(0);
                                                              //System.out.print("statement after system.exit(0) why still alive");
                                                          }
                                                          //System.out.println("total rows: " + rows);
                                                          if(rows+1<=minRows){//need count for last row
                                                                    //System.out.println("total rows: "+ rows);
                                                                    //System.out.println("Something unexpected happened on Line " + _ctx.start.getLine()+".(mazeDesign line)");
                                                                    System.out.println("Something unexpected happened on Line " + _ctx.start.getLine()+".");
                                                                    isCorrectFormat = false;
                                                                    exit = true;
                                                                    System.exit(0);
                                                                    System.out.print("statement after system.exit(0) why still alive");
                                                                    }
                                                          }
                                                          closeMaze{
                                                                                                                           if(exit){
                                                                                                                               System.exit(0);
                                                                                                                           }
                                                                                                                           } closeSection;

beginSection: OpenSection;


closeSection: EndSection;


titleSection: MoveTitle | MazeTitle;


assign: AssignVal;


openMaze: MazeBegin;


openMoves: ListBegin;


mazeDesign: (
                (EmptyMaze{
                    if(columns==0||rows==0){
                                            if(exit){
                                                 System.exit(0);
                                            }
                                            //System.out.println("(maze symbo first)Something unexpected happened on Line " + _ctx.start.getLine()+".(emptyMaze line)");
                                            System.out.println("Something unexpected happened on Line " + _ctx.start.getLine()+".");
                                            isCorrectFormat = false;
                                            exit = true;
                                            System.exit(0);
                                            //System.out.print("statement after system.exit(0) why still alive--EmptyMaze1");
                                        };

                                        if(columns == columnsPerrow - 1){
                                            //System.out.println("columnsPerrow: "+ columnsPerrow+ ", columns index: "+ columns);
                                            //System.out.println("char at index "+ columns + ":"+ _ctx.getText().charAt(columns));
                                            if(_ctx.getText().charAt(columns) != 'x'){
                                                //System.out.println("(emptyMaze)Something unexpected happened on Line " + _ctx.start.getLine()+".");
                                                System.out.println("Something unexpected happened on Line " + _ctx.start.getLine()+".");
                                                exit = true;
                                                isCorrectFormat = false;
                                                System.exit(0);
                                                //System.out.print("statement after system.exit(0) why still alive--EmptyMaze2");
                                            }
                                        }
                                        columns++;
                }
                |FilledMaze{
                        if(exit){
                            System.exit(0);
                        }
                        if(columns == columnsPerrow - 1){
                             // System.out.println("columnsPerrow: "+ columnsPerrow+ ", columns index: "+ columns);
                            // System.out.println("char at index "+ columns + ":"+ _ctx.getText().charAt(columns));
                            if(_ctx.getText().charAt(columns) != 'x'){
                                //System.out.println("(FilledMaze)Something unexpected happened on Line " + _ctx.start.getLine()+".");
                                System.out.println("Something unexpected happened on Line " + _ctx.start.getLine()+".");
                                exit = true;
                                isCorrectFormat = false;
                                System.exit(0);
                               // System.out.print("statement after system.exit(0) why still alive--FilledMaze");
                            }
                        }
                        columns++;
                }
                |PlayerSymbo{
                    if(exit){
                        System.exit(0);
                    }
                    if(columns==0||rows==0){
                         //System.out.println("(PlayerSymbo)Something unexpected happened on Line " + _ctx.start.getLine()+".");
                         System.out.println("Something unexpected happened on Line " + _ctx.start.getLine()+".");
                         exit = true;
                         isCorrectFormat = false;
                         System.exit(0);
                        // System.out.print("statement after system.exit(0) why still alive--PlayerSymbo");
                    };
                    totalPlayer++;
                }
                |Gsymbol{
                         if(exit){
                            System.exit(0);
                         }
                            if(columns==0||rows==0){
                               //System.out.println("(Gsymbol)Something unexpected happened on Line " + _ctx.start.getLine()+".");
                               System.out.println("Something unexpected happened on Line " + _ctx.start.getLine()+".");
                               exit = true;
                               isCorrectFormat = false;
                               System.exit(0);
                               //System.out.print("statement after system.exit(0) why still alive--Gsymbol");
                            };
                            if(gsymbol==0){
                               gsymbol++;
                            }else{
                               //System.out.println("(Gsymbol)The semantic rule 2 was violated.");
                               System.out.println("The semantic rule 2 was violated.");
                               isCorrectFormat = false;
                            }
                        }
                )+
                (
                RowEnding{
                            if(exit){
                                System.exit(0);
                            }
                //getText(): append the thing scanned to the string every time
                        //System.out.println("_ctx.getText(): "+ _ctx.getText()); 'xxxxxxxxxx\\'
                        rows++;
                        //System.out.println("columns: "+ columns);
                        if(columns<minColumn){
                            //System.out.println("(RowEnding)Something unexpected happened on Line " + _ctx.start.getLine()+".(rowending line after mazesymbol)");
                            System.out.println("Something unexpected happened on Line " + _ctx.start.getLine()+".");
                            exit = true;
                            isCorrectFormat = false;
                            //System.out.println("(RowEnding)the current number  of columns is less than minimum required column, current columns: "+ columns);
                            //System.out.println("(RowEnding)row number: "+ rows);
                            //System.out.println("(RowEnding)columns number: "+ columns);
                            System.exit(0);
                            //System.out.print("statement after system.exit(0) why still alive--RowEnding");
                        }else{
                            columnsPerrow = columns;
                            columns=0;
                        }
                   }
                )?
        {
            else {
                if(!_ctx.getText().contains("\\") && !_ctx.getText().matches("x+")){
                   //System.out.println("last row contains variable other than x!");
                   isCorrectFormat = false;
                   System.exit(0);
                  // System.out.print("statement after system.exit(0) why still alive--after one loop moveDesign");
                }
            }
        }
)+
{
                    if(totalPlayer>4 || totalPlayer<1 && !exit){
                         System.out.println("The semantic rule 1 was violated.");
                         isCorrectFormat = false;
                    }

};


closeMaze: MazeEnd;
closeMove: ListEndin;

moveDesign: (
            CMove{moves++;cm++;}
            |CCMove{moves++;ccm++;}
            |Move180{moves++;move180++;}
            |Other{
                  //System.out.println("Something unexpected happened on Line "+ _ctx.start.getLine()+ ". (Other line on moveDesign)");
                  System.out.println("Something unexpected happened on Line " + _ctx.start.getLine()+".");
                  exit = true;
                  System.exit(0);
                  //System.out.print("statement after system.exit(0) why still alive--other in moveDesign");
                  }
            )+
            {
                                    if(exit){
                                        System.exit(0);
                                    }
                                    //System.out.println("number of c: "+ cm);
                                    //System.out.println("number of cc: "+ ccm);
                                    //System.out.println("number of move180: "+ move180);
            };

