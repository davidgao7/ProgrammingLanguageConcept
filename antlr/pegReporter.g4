grammar pegReporter;

pegReporter:game moves;
game :gameStart sectionStart gameBegin space+ (rowEnd*)+ gameEnd sectionEnd;
moves: moveStart sectionStart moveBegin move+ moveEnd sectionEnd EOF;

gameStart: GameTitle;
sectionStart: SectionBegin;
gameBegin: GameBegin;
space: GameSymbol;
gameEnd: GameEnd;
sectionEnd:SectionEnd;
moveStart: MoveTitle;
moveBegin: MovesBegin;
move: MoveSymbols;
moveEnd: MovesEnd;
rowEnd: RowEnding;

MoveSymbols: MoveUp | MoveDown | MoveLeft | MoveRight;
GameSymbol: Empty | Peg | Player;

SectionBegin : '>>';
SectionEnd : '<<';
GameTitle: '!game';
MoveTitle: '!moves';
MoveUp: 'u';
MoveDown: 'd';
MoveLeft: 'l';
MoveRight: 'r';
Empty: '\−';
Peg: 'x';
Player: ('0'..'9');
RowEnding: '∗';
GameBegin: '{';
GameEnd: '}';
MovesBegin: 'ˆ';
MovesEnd: '$';
WS: [\n\r\t]+ { skip(); }; //same as [\n\u000D\t]

