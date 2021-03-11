// Generated from csce322hw01pt01.g4 by ANTLR 4.9.1
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.misc.*;
import org.antlr.v4.runtime.tree.*;
import java.util.List;
import java.util.Iterator;
import java.util.ArrayList;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class csce322hw01pt01Parser extends Parser {
	static { RuntimeMetaData.checkVersion("4.9.1", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		OpenSection=1, EndSection=2, MoveTitle=3, MazeTitle=4, AssignVal=5, MoveSymbo=6, 
		MazeSymbo=7, NumSymbo=8, RowEnding=9, MazeBegin=10, MazeEnd=11, ListBegin=12, 
		ListEndin=13, WS=14, Other=15;
	public static final int
		RULE_gravityGame = 0, RULE_moves = 1, RULE_maze = 2, RULE_beginSection = 3, 
		RULE_closeSection = 4, RULE_titleSection = 5, RULE_assign = 6, RULE_openMaze = 7, 
		RULE_openList = 8, RULE_mazeDesign = 9, RULE_closeMaze = 10, RULE_moveDesign = 11;
	private static String[] makeRuleNames() {
		return new String[] {
			"gravityGame", "moves", "maze", "beginSection", "closeSection", "titleSection", 
			"assign", "openMaze", "openList", "mazeDesign", "closeMaze", "moveDesign"
		};
	}
	public static final String[] ruleNames = makeRuleNames();

	private static String[] makeLiteralNames() {
		return new String[] {
			null, "'\\begin{section}'", "'\\end{section}'", "'\\title{Moves}'", "'\\title{Maze}'", 
			"'::'", null, null, null, "'\\\\'", "'\\begin{maze}'", "'\\end{maze}'", 
			"'\\begin{moves}'", "'\\end{moves}'"
		};
	}
	private static final String[] _LITERAL_NAMES = makeLiteralNames();
	private static String[] makeSymbolicNames() {
		return new String[] {
			null, "OpenSection", "EndSection", "MoveTitle", "MazeTitle", "AssignVal", 
			"MoveSymbo", "MazeSymbo", "NumSymbo", "RowEnding", "MazeBegin", "MazeEnd", 
			"ListBegin", "ListEndin", "WS", "Other"
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
	public String getGrammarFileName() { return "csce322hw01pt01.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public ATN getATN() { return _ATN; }

	public csce322hw01pt01Parser(TokenStream input) {
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
		public TerminalNode Other() { return getToken(csce322hw01pt01Parser.Other, 0); }
		public TerminalNode EOF() { return getToken(csce322hw01pt01Parser.EOF, 0); }
		public GravityGameContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_gravityGame; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt01Listener ) ((csce322hw01pt01Listener)listener).enterGravityGame(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt01Listener ) ((csce322hw01pt01Listener)listener).exitGravityGame(this);
		}
	}

	public final GravityGameContext gravityGame() throws RecognitionException {
		GravityGameContext _localctx = new GravityGameContext(_ctx, getState());
		enterRule(_localctx, 0, RULE_gravityGame);
		try {
			setState(38);
			_errHandler.sync(this);
			switch ( getInterpreter().adaptivePredict(_input,1,_ctx) ) {
			case 1:
				enterOuterAlt(_localctx, 1);
				{
				setState(29);
				_errHandler.sync(this);
				switch (_input.LA(1)) {
				case OpenSection:
					{
					setState(24);
					moves();
					setState(25);
					maze();
					}
					break;
				case Other:
					{
					setState(27);
					match(Other);
					System.out.println("The unrecognizable token "+_ctx.getText()+ " appears in line " + _ctx.start.getLine()+".");System.exit(0);
					}
					break;
				default:
					throw new NoViableAltException(this);
				}
				 System.out.println( "Close of File" ); 
				}
				break;
			case 2:
				enterOuterAlt(_localctx, 2);
				{
				{
				setState(32);
				maze();
				setState(33);
				moves();
				}
				 System.out.println( "Close of File" ); 
				setState(36);
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
		public OpenListContext openList() {
			return getRuleContext(OpenListContext.class,0);
		}
		public MoveDesignContext moveDesign() {
			return getRuleContext(MoveDesignContext.class,0);
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
			if ( listener instanceof csce322hw01pt01Listener ) ((csce322hw01pt01Listener)listener).enterMoves(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt01Listener ) ((csce322hw01pt01Listener)listener).exitMoves(this);
		}
	}

	public final MovesContext moves() throws RecognitionException {
		MovesContext _localctx = new MovesContext(_ctx, getState());
		enterRule(_localctx, 2, RULE_moves);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(40);
			beginSection();
			setState(41);
			titleSection();
			setState(42);
			assign();
			setState(43);
			openList();
			setState(44);
			moveDesign();
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
			if ( listener instanceof csce322hw01pt01Listener ) ((csce322hw01pt01Listener)listener).enterMaze(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt01Listener ) ((csce322hw01pt01Listener)listener).exitMaze(this);
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
			setState(52);
			closeMaze();
			setState(53);
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
		public TerminalNode OpenSection() { return getToken(csce322hw01pt01Parser.OpenSection, 0); }
		public BeginSectionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_beginSection; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt01Listener ) ((csce322hw01pt01Listener)listener).enterBeginSection(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt01Listener ) ((csce322hw01pt01Listener)listener).exitBeginSection(this);
		}
	}

	public final BeginSectionContext beginSection() throws RecognitionException {
		BeginSectionContext _localctx = new BeginSectionContext(_ctx, getState());
		enterRule(_localctx, 6, RULE_beginSection);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(55);
			match(OpenSection);
			System.out.println("Open Section: "+_ctx.getText());
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
		public TerminalNode EndSection() { return getToken(csce322hw01pt01Parser.EndSection, 0); }
		public CloseSectionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_closeSection; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt01Listener ) ((csce322hw01pt01Listener)listener).enterCloseSection(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt01Listener ) ((csce322hw01pt01Listener)listener).exitCloseSection(this);
		}
	}

	public final CloseSectionContext closeSection() throws RecognitionException {
		CloseSectionContext _localctx = new CloseSectionContext(_ctx, getState());
		enterRule(_localctx, 8, RULE_closeSection);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(58);
			match(EndSection);
			System.out.println("Close Section: "+_ctx.getText());
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
		public TerminalNode MoveTitle() { return getToken(csce322hw01pt01Parser.MoveTitle, 0); }
		public TerminalNode MazeTitle() { return getToken(csce322hw01pt01Parser.MazeTitle, 0); }
		public TitleSectionContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_titleSection; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt01Listener ) ((csce322hw01pt01Listener)listener).enterTitleSection(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt01Listener ) ((csce322hw01pt01Listener)listener).exitTitleSection(this);
		}
	}

	public final TitleSectionContext titleSection() throws RecognitionException {
		TitleSectionContext _localctx = new TitleSectionContext(_ctx, getState());
		enterRule(_localctx, 10, RULE_titleSection);
		try {
			setState(65);
			_errHandler.sync(this);
			switch (_input.LA(1)) {
			case MoveTitle:
				enterOuterAlt(_localctx, 1);
				{
				setState(61);
				match(MoveTitle);
				System.out.println("Section Title: "+_ctx.getText());
				}
				break;
			case MazeTitle:
				enterOuterAlt(_localctx, 2);
				{
				setState(63);
				match(MazeTitle);
				System.out.println("Section Title: "+_ctx.getText());
				}
				break;
			default:
				throw new NoViableAltException(this);
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
		public TerminalNode AssignVal() { return getToken(csce322hw01pt01Parser.AssignVal, 0); }
		public AssignContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_assign; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt01Listener ) ((csce322hw01pt01Listener)listener).enterAssign(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt01Listener ) ((csce322hw01pt01Listener)listener).exitAssign(this);
		}
	}

	public final AssignContext assign() throws RecognitionException {
		AssignContext _localctx = new AssignContext(_ctx, getState());
		enterRule(_localctx, 12, RULE_assign);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(67);
			match(AssignVal);
			System.out.println("Designation: "+_ctx.getText());
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
		public TerminalNode MazeBegin() { return getToken(csce322hw01pt01Parser.MazeBegin, 0); }
		public OpenMazeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_openMaze; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt01Listener ) ((csce322hw01pt01Listener)listener).enterOpenMaze(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt01Listener ) ((csce322hw01pt01Listener)listener).exitOpenMaze(this);
		}
	}

	public final OpenMazeContext openMaze() throws RecognitionException {
		OpenMazeContext _localctx = new OpenMazeContext(_ctx, getState());
		enterRule(_localctx, 14, RULE_openMaze);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(70);
			match(MazeBegin);
			System.out.println("Open Maze: "+_ctx.getText());
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

	public static class OpenListContext extends ParserRuleContext {
		public TerminalNode ListBegin() { return getToken(csce322hw01pt01Parser.ListBegin, 0); }
		public OpenListContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_openList; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt01Listener ) ((csce322hw01pt01Listener)listener).enterOpenList(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt01Listener ) ((csce322hw01pt01Listener)listener).exitOpenList(this);
		}
	}

	public final OpenListContext openList() throws RecognitionException {
		OpenListContext _localctx = new OpenListContext(_ctx, getState());
		enterRule(_localctx, 16, RULE_openList);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(73);
			match(ListBegin);
			System.out.println("Open Moves: "+_ctx.getText());
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
		public Token MazeSymbo;
		public Token RowEnding;
		public List<TerminalNode> MazeSymbo() { return getTokens(csce322hw01pt01Parser.MazeSymbo); }
		public TerminalNode MazeSymbo(int i) {
			return getToken(csce322hw01pt01Parser.MazeSymbo, i);
		}
		public List<TerminalNode> RowEnding() { return getTokens(csce322hw01pt01Parser.RowEnding); }
		public TerminalNode RowEnding(int i) {
			return getToken(csce322hw01pt01Parser.RowEnding, i);
		}
		public MazeDesignContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_mazeDesign; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt01Listener ) ((csce322hw01pt01Listener)listener).enterMazeDesign(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt01Listener ) ((csce322hw01pt01Listener)listener).exitMazeDesign(this);
		}
	}

	public final MazeDesignContext mazeDesign() throws RecognitionException {
		MazeDesignContext _localctx = new MazeDesignContext(_ctx, getState());
		enterRule(_localctx, 18, RULE_mazeDesign);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(82); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(76);
				((MazeDesignContext)_localctx).MazeSymbo = match(MazeSymbo);
				System.out.println("Location: "+((MazeDesignContext)_localctx).MazeSymbo.getText());
				setState(80);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==RowEnding) {
					{
					setState(78);
					((MazeDesignContext)_localctx).RowEnding = match(RowEnding);
					System.out.println("Close Row: "+((MazeDesignContext)_localctx).RowEnding.getText());
					}
				}

				}
				}
				setState(84); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( _la==MazeSymbo );
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
		public TerminalNode MazeEnd() { return getToken(csce322hw01pt01Parser.MazeEnd, 0); }
		public CloseMazeContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_closeMaze; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt01Listener ) ((csce322hw01pt01Listener)listener).enterCloseMaze(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt01Listener ) ((csce322hw01pt01Listener)listener).exitCloseMaze(this);
		}
	}

	public final CloseMazeContext closeMaze() throws RecognitionException {
		CloseMazeContext _localctx = new CloseMazeContext(_ctx, getState());
		enterRule(_localctx, 20, RULE_closeMaze);
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(86);
			match(MazeEnd);
			System.out.println("Close Maze: "+_ctx.getText());
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
		public Token MoveSymbo;
		public Token ListEndin;
		public List<TerminalNode> MoveSymbo() { return getTokens(csce322hw01pt01Parser.MoveSymbo); }
		public TerminalNode MoveSymbo(int i) {
			return getToken(csce322hw01pt01Parser.MoveSymbo, i);
		}
		public List<TerminalNode> ListEndin() { return getTokens(csce322hw01pt01Parser.ListEndin); }
		public TerminalNode ListEndin(int i) {
			return getToken(csce322hw01pt01Parser.ListEndin, i);
		}
		public MoveDesignContext(ParserRuleContext parent, int invokingState) {
			super(parent, invokingState);
		}
		@Override public int getRuleIndex() { return RULE_moveDesign; }
		@Override
		public void enterRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt01Listener ) ((csce322hw01pt01Listener)listener).enterMoveDesign(this);
		}
		@Override
		public void exitRule(ParseTreeListener listener) {
			if ( listener instanceof csce322hw01pt01Listener ) ((csce322hw01pt01Listener)listener).exitMoveDesign(this);
		}
	}

	public final MoveDesignContext moveDesign() throws RecognitionException {
		MoveDesignContext _localctx = new MoveDesignContext(_ctx, getState());
		enterRule(_localctx, 22, RULE_moveDesign);
		int _la;
		try {
			enterOuterAlt(_localctx, 1);
			{
			setState(95); 
			_errHandler.sync(this);
			_la = _input.LA(1);
			do {
				{
				{
				setState(89);
				((MoveDesignContext)_localctx).MoveSymbo = match(MoveSymbo);
				System.out.println("Move: "+((MoveDesignContext)_localctx).MoveSymbo.getText());
				setState(93);
				_errHandler.sync(this);
				_la = _input.LA(1);
				if (_la==ListEndin) {
					{
					setState(91);
					((MoveDesignContext)_localctx).ListEndin = match(ListEndin);
					System.out.println("Close Moves: "+((MoveDesignContext)_localctx).ListEndin.getText());
					}
				}

				}
				}
				setState(97); 
				_errHandler.sync(this);
				_la = _input.LA(1);
			} while ( _la==MoveSymbo );
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
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\3\21f\4\2\t\2\4\3\t"+
		"\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4\13\t\13\4"+
		"\f\t\f\4\r\t\r\3\2\3\2\3\2\3\2\3\2\5\2 \n\2\3\2\3\2\3\2\3\2\3\2\3\2\3"+
		"\2\5\2)\n\2\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3"+
		"\4\3\5\3\5\3\5\3\6\3\6\3\6\3\7\3\7\3\7\3\7\5\7D\n\7\3\b\3\b\3\b\3\t\3"+
		"\t\3\t\3\n\3\n\3\n\3\13\3\13\3\13\3\13\5\13S\n\13\6\13U\n\13\r\13\16\13"+
		"V\3\f\3\f\3\f\3\r\3\r\3\r\3\r\5\r`\n\r\6\rb\n\r\r\r\16\rc\3\r\2\2\16\2"+
		"\4\6\b\n\f\16\20\22\24\26\30\2\2\2`\2(\3\2\2\2\4*\3\2\2\2\6\61\3\2\2\2"+
		"\b9\3\2\2\2\n<\3\2\2\2\fC\3\2\2\2\16E\3\2\2\2\20H\3\2\2\2\22K\3\2\2\2"+
		"\24T\3\2\2\2\26X\3\2\2\2\30a\3\2\2\2\32\33\5\4\3\2\33\34\5\6\4\2\34 \3"+
		"\2\2\2\35\36\7\21\2\2\36 \b\2\1\2\37\32\3\2\2\2\37\35\3\2\2\2 !\3\2\2"+
		"\2!)\b\2\1\2\"#\5\6\4\2#$\5\4\3\2$%\3\2\2\2%&\b\2\1\2&\'\7\2\2\3\')\3"+
		"\2\2\2(\37\3\2\2\2(\"\3\2\2\2)\3\3\2\2\2*+\5\b\5\2+,\5\f\7\2,-\5\16\b"+
		"\2-.\5\22\n\2./\5\30\r\2/\60\5\n\6\2\60\5\3\2\2\2\61\62\5\b\5\2\62\63"+
		"\5\f\7\2\63\64\5\16\b\2\64\65\5\20\t\2\65\66\5\24\13\2\66\67\5\26\f\2"+
		"\678\5\n\6\28\7\3\2\2\29:\7\3\2\2:;\b\5\1\2;\t\3\2\2\2<=\7\4\2\2=>\b\6"+
		"\1\2>\13\3\2\2\2?@\7\5\2\2@D\b\7\1\2AB\7\6\2\2BD\b\7\1\2C?\3\2\2\2CA\3"+
		"\2\2\2D\r\3\2\2\2EF\7\7\2\2FG\b\b\1\2G\17\3\2\2\2HI\7\f\2\2IJ\b\t\1\2"+
		"J\21\3\2\2\2KL\7\16\2\2LM\b\n\1\2M\23\3\2\2\2NO\7\t\2\2OR\b\13\1\2PQ\7"+
		"\13\2\2QS\b\13\1\2RP\3\2\2\2RS\3\2\2\2SU\3\2\2\2TN\3\2\2\2UV\3\2\2\2V"+
		"T\3\2\2\2VW\3\2\2\2W\25\3\2\2\2XY\7\r\2\2YZ\b\f\1\2Z\27\3\2\2\2[\\\7\b"+
		"\2\2\\_\b\r\1\2]^\7\17\2\2^`\b\r\1\2_]\3\2\2\2_`\3\2\2\2`b\3\2\2\2a[\3"+
		"\2\2\2bc\3\2\2\2ca\3\2\2\2cd\3\2\2\2d\31\3\2\2\2\t\37(CRV_c";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}