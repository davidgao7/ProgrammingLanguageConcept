// Generated from csce322hw01pt02.g4 by ANTLR 4.9.1
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class csce322hw01pt02Parser extends Parser {
	static { RuntimeMetaData.checkVersion("4.9.1", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		OpenSection=1, EndSection=2, MoveTitle=3, MazeTitle=4, AssignVal=5, CMove=6, 
		CCMove=7, Move180=8, EmptyMaze=9, FilledMaze=10, Gsymbol=11, PlayerSymbo=12, 
		RowEnding=13, MazeBegin=14, MazeEnd=15, ListBegin=16, ListEndin=17, WS=18, 
		Other=19;
	public static final int
		RULE_gravityGame = 0, RULE_moves = 1, RULE_maze = 2, RULE_beginSection = 3, 
		RULE_closeSection = 4, RULE_titleSection = 5, RULE_assign = 6, RULE_openMaze = 7, 
		RULE_openMoves = 8, RULE_mazeDesign = 9, RULE_closeMaze = 10, RULE_closeMove = 11, 
		RULE_moveDesign = 12;
	private static String[] makeRuleNames() {
		return new String[] {
			"gravityGame", "moves", "maze", "beginSection", "closeSection", "titleSection", 
			"assign", "openMaze", "openMoves", "mazeDesign", "closeMaze", "closeMove", 
			"moveDesign"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'\\begin{section}'", "'\\end{section}'", "'\\title{Moves}'", "'\\title{Maze}'", 
			"'::'", "'c'", "'cc'", "'180'", "'-'", "'x'", "'g'", null, "'\\\\'", 
			"'\\begin{maze}'", "'\\end{maze}'", "'\\begin{moves}'", "'\\end{moves}'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, "OpenSection", "EndSection", "MoveTitle", "MazeTitle", "AssignVal", 
			"CMove", "CCMove", "Move180", "EmptyMaze", "FilledMaze", "Gsymbol", "PlayerSymbo", 
			"RowEnding", "MazeBegin", "MazeEnd", "ListBegin", "ListEndin", "WS", 
			"Other"
		};
	}
	private static final String[] _SYMBOLIC_NAMES = makeSymbolicNames();
	public static final Vocabulary VOCABULARY = new VocabularyImpl(_LITERAL_NAMES, _SYMBOLIC_NAMES);

	/**
	 * @deprecated Use {@link #VOCABULARY} instead.
	 */
	@Deprecated
	public static final String[] tokenNames;
	static {
		tokenNames = new String[_SYMBOLIC_NAMES.length];
		for (int i = 0; i < tokenNames.length; i++) {
			tokenNames[i] = VOCABULARY.getLiteralName(i);
			if (tokenNames[i] == null) {
				tokenNames[i] = VOCABULARY.getSymbolicName(i);
			}

			if (tokenNames[i] == null) {
				tokenNames[i] = "<INVALID>";
			}
		}
	}

	@Override
	@Deprecated
	public String[] getTokenNames() {
		return tokenNames;
	}

	@Override

	public Vocabulary getVocabulary() {
		return VOCABULARY;
	}

	@Override
	public String getGrammarFileName() { return "csce322hw01pt02.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }


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

	public csce322hw01pt02Parser(TokenStream input) {
		super(input);
		_interp = new ParserATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	public static class GravityGameContext extends ParserRuleContext {
		public MovesContext moves() {
			return getRuleContext(MovesContext.class,0);
		}
		public MazeContext maze() {
			return getRuleContext(MazeContext.class,0);
		}
		public TerminalNode Other() { return getToken(csce322hw01pt02Parser.Other, 0); }
		public TerminalNode EOF() { return getToken(csce322hw01pt02Parser.EOF, 0); }
		public GravityGameContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_gravityGame; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt02Listener ) ((csce322hw01pt02Listener)listener).enterGravityGame(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt02Listener ) ((csce322hw01pt02Listener)listener).exitGravityGame(this);
		}
	}

	public final GravityGameContext gravityGame() throws RecognitionException {
		GravityGameContext _localctx = new GravityGameContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_gravityGame);
		try {
			setState(35);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,0,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				{
				setState(26);
				moves();
				setState(27);
				maze();
				}
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				{
				setState(29);
				maze();
				setState(30);
				moves();
				}
				}
				break;
			case 3:
				enterOuterAlt(_localctx, 3);
				{
				setState(32);
				match(Other);

				                                                    if(exit){
				                                                        System.exit(0);
				                                                    }
				                                                    //System.out.println("Something unexpected happened on Line " + _ctx.start.getLine()+".(Other line in the end)");
				                                                    System.out.println("Something unexpected happened on Line " + _ctx.start.getLine()+".");
				                                                    isCorrectFormat = false;
				                                                    exit = true;
				                                                    System.exit(0);
				                                                    System.out.print("statement after system.exit(0) why still alive");
				                                                   
				setState(34);
				match(EOF);
				}
				break;
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class MovesContext extends ParserRuleContext {
		public BeginSectionContext beginSection() {
			return getRuleContext(BeginSectionContext.class,0);
		}
		public TitleSectionContext titleSection() {
			return getRuleContext(TitleSectionContext.class,0);
		}
		public AssignContext assign() {
			return getRuleContext(AssignContext.class,0);
		}
		public OpenMovesContext openMoves() {
			return getRuleContext(OpenMovesContext.class,0);
		}
		public MoveDesignContext moveDesign() {
			return getRuleContext(MoveDesignContext.class,0);
		}
		public CloseMoveContext closeMove() {
			return getRuleContext(CloseMoveContext.class,0);
		}
		public CloseSectionContext closeSection() {
			return getRuleContext(CloseSectionContext.class,0);
		}
		public MovesContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_moves; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt02Listener ) ((csce322hw01pt02Listener)listener).enterMoves(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt02Listener ) ((csce322hw01pt02Listener)listener).exitMoves(this);
		}
	}

	public final MovesContext moves() throws RecognitionException {
		MovesContext _localctx = new MovesContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_moves);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(37);
			beginSection();
			setState(38);
			titleSection();
			setState(39);
			assign();
			setState(40);
			openMoves();
			setState(41);
			moveDesign();

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
			                                                            }
			                                                            if(cm<1 || ccm<1 || move180<1 && !exit){
			                                                               System.out.println("The semantic rule 4 was violated.");
			                                                               isCorrectFormat = false;
			                                                            }
			                                                          
			setState(43);
			closeMove();

			                                                        if(exit){
			                                                            System.exit(0);
			                                                        }
			                                                        
			setState(45);
			closeSection();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class MazeContext extends ParserRuleContext {
		public BeginSectionContext beginSection() {
			return getRuleContext(BeginSectionContext.class,0);
		}
		public TitleSectionContext titleSection() {
			return getRuleContext(TitleSectionContext.class,0);
		}
		public AssignContext assign() {
			return getRuleContext(AssignContext.class,0);
		}
		public OpenMazeContext openMaze() {
			return getRuleContext(OpenMazeContext.class,0);
		}
		public MazeDesignContext mazeDesign() {
			return getRuleContext(MazeDesignContext.class,0);
		}
		public CloseMazeContext closeMaze() {
			return getRuleContext(CloseMazeContext.class,0);
		}
		public CloseSectionContext closeSection() {
			return getRuleContext(CloseSectionContext.class,0);
		}
		public MazeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_maze; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt02Listener ) ((csce322hw01pt02Listener)listener).enterMaze(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt02Listener ) ((csce322hw01pt02Listener)listener).exitMaze(this);
		}
	}

	public final MazeContext maze() throws RecognitionException {
		MazeContext _localctx = new MazeContext(_ctx, getState());
		enterRule(_localctx, 4, RULE_maze);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(47);
			beginSection();
			setState(48);
			titleSection();
			setState(49);
			assign();
			setState(50);
			openMaze();
			setState(51);
			mazeDesign();

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
			                                                          
			setState(53);
			closeMaze();

			                                                                                                                           if(exit){
			                                                                                                                               System.exit(0);
			                                                                                                                           }
			                                                                                                                           
			setState(55);
			closeSection();
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class BeginSectionContext extends ParserRuleContext {
		public TerminalNode OpenSection() { return getToken(csce322hw01pt02Parser.OpenSection, 0); }
		public BeginSectionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_beginSection; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt02Listener ) ((csce322hw01pt02Listener)listener).enterBeginSection(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt02Listener ) ((csce322hw01pt02Listener)listener).exitBeginSection(this);
		}
	}

	public final BeginSectionContext beginSection() throws RecognitionException {
		BeginSectionContext _localctx = new BeginSectionContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_beginSection);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(57);
			match(OpenSection);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class CloseSectionContext extends ParserRuleContext {
		public TerminalNode EndSection() { return getToken(csce322hw01pt02Parser.EndSection, 0); }
		public CloseSectionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_closeSection; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt02Listener ) ((csce322hw01pt02Listener)listener).enterCloseSection(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt02Listener ) ((csce322hw01pt02Listener)listener).exitCloseSection(this);
		}
	}

	public final CloseSectionContext closeSection() throws RecognitionException {
		CloseSectionContext _localctx = new CloseSectionContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_closeSection);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(59);
			match(EndSection);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class TitleSectionContext extends ParserRuleContext {
		public TerminalNode MoveTitle() { return getToken(csce322hw01pt02Parser.MoveTitle, 0); }
		public TerminalNode MazeTitle() { return getToken(csce322hw01pt02Parser.MazeTitle, 0); }
		public TitleSectionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_titleSection; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt02Listener ) ((csce322hw01pt02Listener)listener).enterTitleSection(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt02Listener ) ((csce322hw01pt02Listener)listener).exitTitleSection(this);
		}
	}

	public final TitleSectionContext titleSection() throws RecognitionException {
		TitleSectionContext _localctx = new TitleSectionContext(_ctx, getState());
		enterRule(_localctx, 10, RULE_titleSection);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(61);
			_la = _input.LA(1);
			if ( !(_la==MoveTitle || _la==MazeTitle) ) {
			_errHandler.recoverInline(this);
			}
			else {
				if ( _input.LA(1)==Token.EOF ) matchedEOF = true;
				_errHandler.reportMatch(this);
				consume();
			}
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class AssignContext extends ParserRuleContext {
		public TerminalNode AssignVal() { return getToken(csce322hw01pt02Parser.AssignVal, 0); }
		public AssignContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_assign; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt02Listener ) ((csce322hw01pt02Listener)listener).enterAssign(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt02Listener ) ((csce322hw01pt02Listener)listener).exitAssign(this);
		}
	}

	public final AssignContext assign() throws RecognitionException {
		AssignContext _localctx = new AssignContext(_ctx, getState());
		enterRule(_localctx, 12, RULE_assign);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(63);
			match(AssignVal);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class OpenMazeContext extends ParserRuleContext {
		public TerminalNode MazeBegin() { return getToken(csce322hw01pt02Parser.MazeBegin, 0); }
		public OpenMazeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_openMaze; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt02Listener ) ((csce322hw01pt02Listener)listener).enterOpenMaze(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt02Listener ) ((csce322hw01pt02Listener)listener).exitOpenMaze(this);
		}
	}

	public final OpenMazeContext openMaze() throws RecognitionException {
		OpenMazeContext _localctx = new OpenMazeContext(_ctx, getState());
		enterRule(_localctx, 14, RULE_openMaze);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(65);
			match(MazeBegin);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class OpenMovesContext extends ParserRuleContext {
		public TerminalNode ListBegin() { return getToken(csce322hw01pt02Parser.ListBegin, 0); }
		public OpenMovesContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_openMoves; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt02Listener ) ((csce322hw01pt02Listener)listener).enterOpenMoves(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt02Listener ) ((csce322hw01pt02Listener)listener).exitOpenMoves(this);
		}
	}

	public final OpenMovesContext openMoves() throws RecognitionException {
		OpenMovesContext _localctx = new OpenMovesContext(_ctx, getState());
		enterRule(_localctx, 16, RULE_openMoves);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(67);
			match(ListBegin);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class MazeDesignContext extends ParserRuleContext {
		public List<TerminalNode> EmptyMaze() { return getTokens(csce322hw01pt02Parser.EmptyMaze); }
		public TerminalNode EmptyMaze(int i) {
			return getToken(csce322hw01pt02Parser.EmptyMaze, i);
		}
		public List<TerminalNode> FilledMaze() { return getTokens(csce322hw01pt02Parser.FilledMaze); }
		public TerminalNode FilledMaze(int i) {
			return getToken(csce322hw01pt02Parser.FilledMaze, i);
		}
		public List<TerminalNode> PlayerSymbo() { return getTokens(csce322hw01pt02Parser.PlayerSymbo); }
		public TerminalNode PlayerSymbo(int i) {
			return getToken(csce322hw01pt02Parser.PlayerSymbo, i);
		}
		public List<TerminalNode> Gsymbol() { return getTokens(csce322hw01pt02Parser.Gsymbol); }
		public TerminalNode Gsymbol(int i) {
			return getToken(csce322hw01pt02Parser.Gsymbol, i);
		}
		public List<TerminalNode> RowEnding() { return getTokens(csce322hw01pt02Parser.RowEnding); }
		public TerminalNode RowEnding(int i) {
			return getToken(csce322hw01pt02Parser.RowEnding, i);
		}
		public MazeDesignContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_mazeDesign; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt02Listener ) ((csce322hw01pt02Listener)listener).enterMazeDesign(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt02Listener ) ((csce322hw01pt02Listener)listener).exitMazeDesign(this);
		}
	}

	public final MazeDesignContext mazeDesign() throws RecognitionException {
		MazeDesignContext _localctx = new MazeDesignContext(_ctx, getState());
		enterRule(_localctx, 18, RULE_mazeDesign);
		int _la;
		try {
			int _alt;
			enterOuterAlt(_localctx, 1);
			{
			setState(86); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(77); 
				_errHandler.sync(this);
				_alt = 1;
				do {
					switch (_alt) {
					case 1:
						{
						setState(77);
						_errHandler.sync(this);
						switch (_input.LA(1)) {
						case EmptyMaze:
							{
							setState(69);
							match(EmptyMaze);

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
							break;
						case FilledMaze:
							{
							setState(71);
							match(FilledMaze);

							                        if(exit){
							                            System.exit(0);
							                        }
							                        if(columns == columnsPerrow - 1){
							//                            System.out.println("columnsPerrow: "+ columnsPerrow+ ", columns index: "+ columns);
							//                            System.out.println("char at index "+ columns + ":"+ _ctx.getText().charAt(columns));
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
							break;
						case PlayerSymbo:
							{
							setState(73);
							match(PlayerSymbo);

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
							break;
						case Gsymbol:
							{
							setState(75);
							match(Gsymbol);

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
							break;
						default:
							throw new NoViableAltException(this);
						}
						}
						break;
					default:
						throw new NoViableAltException(this);
					}
					setState(79); 
					_errHandler.sync(this);
					_alt = getInterpreter().adaptivePredict(_input,2,_ctx);
				} while ( _alt!=2 && _alt!=org.antlr.v4.runtime.atn.ATN.INVALID_ALT_NUMBER );
				setState(83);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==RowEnding) {
					{
					setState(81);
					match(RowEnding);

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
				}


				            else {
				                if(!_ctx.getText().contains("\\") && !_ctx.getText().matches("x+")){
				                   //System.out.println("last row contains variable other than x!");
				                   isCorrectFormat = false;
				                   System.exit(0);
				                  // System.out.print("statement after system.exit(0) why still alive--after one loop moveDesign");
				                }
				            }
				        
				}
				}
				setState(88); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( (((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << EmptyMaze) | (1L << FilledMaze) | (1L << Gsymbol) | (1L << PlayerSymbo))) != 0) );

			                    if(totalPlayer>4 || totalPlayer<1 && !exit){
			                         System.out.println("The semantic rule 1 was violated.");
			                         isCorrectFormat = false;
			                    }

			                    if(isCorrectFormat && !exit){
			                          System.out.println("This game has "+ totalPlayer + " players . ( If you are not attempting extra credit or honors )");
			                    }

			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class CloseMazeContext extends ParserRuleContext {
		public TerminalNode MazeEnd() { return getToken(csce322hw01pt02Parser.MazeEnd, 0); }
		public CloseMazeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_closeMaze; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt02Listener ) ((csce322hw01pt02Listener)listener).enterCloseMaze(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt02Listener ) ((csce322hw01pt02Listener)listener).exitCloseMaze(this);
		}
	}

	public final CloseMazeContext closeMaze() throws RecognitionException {
		CloseMazeContext _localctx = new CloseMazeContext(_ctx, getState());
		enterRule(_localctx, 20, RULE_closeMaze);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(92);
			match(MazeEnd);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class CloseMoveContext extends ParserRuleContext {
		public TerminalNode ListEndin() { return getToken(csce322hw01pt02Parser.ListEndin, 0); }
		public CloseMoveContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_closeMove; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt02Listener ) ((csce322hw01pt02Listener)listener).enterCloseMove(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt02Listener ) ((csce322hw01pt02Listener)listener).exitCloseMove(this);
		}
	}

	public final CloseMoveContext closeMove() throws RecognitionException {
		CloseMoveContext _localctx = new CloseMoveContext(_ctx, getState());
		enterRule(_localctx, 22, RULE_closeMove);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(94);
			match(ListEndin);
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static class MoveDesignContext extends ParserRuleContext {
		public List<TerminalNode> CMove() { return getTokens(csce322hw01pt02Parser.CMove); }
		public TerminalNode CMove(int i) {
			return getToken(csce322hw01pt02Parser.CMove, i);
		}
		public List<TerminalNode> CCMove() { return getTokens(csce322hw01pt02Parser.CCMove); }
		public TerminalNode CCMove(int i) {
			return getToken(csce322hw01pt02Parser.CCMove, i);
		}
		public List<TerminalNode> Move180() { return getTokens(csce322hw01pt02Parser.Move180); }
		public TerminalNode Move180(int i) {
			return getToken(csce322hw01pt02Parser.Move180, i);
		}
		public List<TerminalNode> Other() { return getTokens(csce322hw01pt02Parser.Other); }
		public TerminalNode Other(int i) {
			return getToken(csce322hw01pt02Parser.Other, i);
		}
		public MoveDesignContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_moveDesign; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt02Listener ) ((csce322hw01pt02Listener)listener).enterMoveDesign(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt02Listener ) ((csce322hw01pt02Listener)listener).exitMoveDesign(this);
		}
	}

	public final MoveDesignContext moveDesign() throws RecognitionException {
		MoveDesignContext _localctx = new MoveDesignContext(_ctx, getState());
		enterRule(_localctx, 24, RULE_moveDesign);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(104); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				setState(104);
				_errHandler.sync(this);
				switch (_input.LA(1)) {
				case CMove:
					{
					setState(96);
					match(CMove);
					moves++;cm++;
					}
					break;
				case CCMove:
					{
					setState(98);
					match(CCMove);
					moves++;ccm++;
					}
					break;
				case Move180:
					{
					setState(100);
					match(Move180);
					moves++;move180++;
					}
					break;
				case Other:
					{
					setState(102);
					match(Other);

					                  //System.out.println("Something unexpected happened on Line "+ _ctx.start.getLine()+ ". (Other line on moveDesign)");
					                  System.out.println("Something unexpected happened on Line " + _ctx.start.getLine()+".");
					                  exit = true;
					                  System.exit(0);
					                  //System.out.print("statement after system.exit(0) why still alive--other in moveDesign");
					                  
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				}
				setState(106); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( (((_la) & ~0x3f) == 0 && ((1L << _la) & ((1L << CMove) | (1L << CCMove) | (1L << Move180) | (1L << Other))) != 0) );

			                                    if(exit){
			                                        System.exit(0);
			                                    }
			                                    //System.out.println("number of c: "+ cm);
			                                    //System.out.println("number of cc: "+ ccm);
			                                    //System.out.println("number of move180: "+ move180);
			            
			}
		}
		catch (RecognitionException re) {
			_localctx.exception = re;
			_errHandler.reportError(this, re);
			_errHandler.recover(this, re);
		}
		finally {
			exitRule();
		}
		return _localctx;
	}

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3\25q\4\2\t\2\4\3\t"+
		"\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t\13\4"+
		"\f\t\f\4\r\t\r\4\16\t\16\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\2\5\2&\n\2"+
		"\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3"+
		"\4\3\4\3\4\3\5\3\5\3\6\3\6\3\7\3\7\3\b\3\b\3\t\3\t\3\n\3\n\3\13\3\13\3"+
		"\13\3\13\3\13\3\13\3\13\3\13\6\13P\n\13\r\13\16\13Q\3\13\3\13\5\13V\n"+
		"\13\3\13\6\13Y\n\13\r\13\16\13Z\3\13\3\13\3\f\3\f\3\r\3\r\3\16\3\16\3"+
		"\16\3\16\3\16\3\16\3\16\3\16\6\16k\n\16\r\16\16\16l\3\16\3\16\3\16\2\2"+
		"\17\2\4\6\b\n\f\16\20\22\24\26\30\32\2\3\3\2\5\6\2o\2%\3\2\2\2\4\'\3\2"+
		"\2\2\6\61\3\2\2\2\b;\3\2\2\2\n=\3\2\2\2\f?\3\2\2\2\16A\3\2\2\2\20C\3\2"+
		"\2\2\22E\3\2\2\2\24X\3\2\2\2\26^\3\2\2\2\30`\3\2\2\2\32j\3\2\2\2\34\35"+
		"\5\4\3\2\35\36\5\6\4\2\36&\3\2\2\2\37 \5\6\4\2 !\5\4\3\2!&\3\2\2\2\"#"+
		"\7\25\2\2#$\b\2\1\2$&\7\2\2\3%\34\3\2\2\2%\37\3\2\2\2%\"\3\2\2\2&\3\3"+
		"\2\2\2\'(\5\b\5\2()\5\f\7\2)*\5\16\b\2*+\5\22\n\2+,\5\32\16\2,-\b\3\1"+
		"\2-.\5\30\r\2./\b\3\1\2/\60\5\n\6\2\60\5\3\2\2\2\61\62\5\b\5\2\62\63\5"+
		"\f\7\2\63\64\5\16\b\2\64\65\5\20\t\2\65\66\5\24\13\2\66\67\b\4\1\2\67"+
		"8\5\26\f\289\b\4\1\29:\5\n\6\2:\7\3\2\2\2;<\7\3\2\2<\t\3\2\2\2=>\7\4\2"+
		"\2>\13\3\2\2\2?@\t\2\2\2@\r\3\2\2\2AB\7\7\2\2B\17\3\2\2\2CD\7\20\2\2D"+
		"\21\3\2\2\2EF\7\22\2\2F\23\3\2\2\2GH\7\13\2\2HP\b\13\1\2IJ\7\f\2\2JP\b"+
		"\13\1\2KL\7\16\2\2LP\b\13\1\2MN\7\r\2\2NP\b\13\1\2OG\3\2\2\2OI\3\2\2\2"+
		"OK\3\2\2\2OM\3\2\2\2PQ\3\2\2\2QO\3\2\2\2QR\3\2\2\2RU\3\2\2\2ST\7\17\2"+
		"\2TV\b\13\1\2US\3\2\2\2UV\3\2\2\2VW\3\2\2\2WY\b\13\1\2XO\3\2\2\2YZ\3\2"+
		"\2\2ZX\3\2\2\2Z[\3\2\2\2[\\\3\2\2\2\\]\b\13\1\2]\25\3\2\2\2^_\7\21\2\2"+
		"_\27\3\2\2\2`a\7\23\2\2a\31\3\2\2\2bc\7\b\2\2ck\b\16\1\2de\7\t\2\2ek\b"+
		"\16\1\2fg\7\n\2\2gk\b\16\1\2hi\7\25\2\2ik\b\16\1\2jb\3\2\2\2jd\3\2\2\2"+
		"jf\3\2\2\2jh\3\2\2\2kl\3\2\2\2lj\3\2\2\2lm\3\2\2\2mn\3\2\2\2no\b\16\1"+
		"\2o\33\3\2\2\2\t%OQUZjl";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}