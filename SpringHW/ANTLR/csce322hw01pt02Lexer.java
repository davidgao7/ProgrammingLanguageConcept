// Generated from csce322hw01pt02.g4 by ANTLR 4.9.1
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class csce322hw01pt02Lexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.9.1", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		OpenSection=1, EndSection=2, MoveTitle=3, MazeTitle=4, AssignVal=5, CMove=6, 
		CCMove=7, Move180=8, EmptyMaze=9, FilledMaze=10, Gsymbol=11, PlayerSymbo=12, 
		RowEnding=13, MazeBegin=14, MazeEnd=15, ListBegin=16, ListEndin=17, WS=18, 
		Other=19;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"OpenSection", "EndSection", "MoveTitle", "MazeTitle", "AssignVal", "CMove", 
			"CCMove", "Move180", "EmptyMaze", "FilledMaze", "Gsymbol", "PlayerSymbo", 
			"RowEnding", "MazeBegin", "MazeEnd", "ListBegin", "ListEndin", "WS", 
			"Other"
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


	public csce322hw01pt02Lexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "csce322hw01pt02.g4"; }

	@Override
	public String[] getRuleNames() { return ruleNames; }

	@Override
	public String getSerializedATN() { return _serializedATN; }

	@Override
	public String[] getChannelNames() { return channelNames; }

	@Override
	public String[] getModeNames() { return modeNames; }

	@Override
	public ATN getATN() { return _ATN; }

	public static final String _serializedATN =
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\25\u00b4\b\1\4\2"+
		"\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4"+
		"\13\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\4\21\t\21\4\22"+
		"\t\22\4\23\t\23\4\24\t\24\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\2"+
		"\3\2\3\2\3\2\3\2\3\2\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3"+
		"\3\3\3\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\5\3\5"+
		"\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\6\3\6\3\6\3\7\3\7\3\b\3"+
		"\b\3\b\3\t\3\t\3\t\3\t\3\n\3\n\3\13\3\13\3\f\3\f\3\r\3\r\3\16\3\16\3\16"+
		"\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\17\3\20"+
		"\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\20\3\21\3\21\3\21\3\21"+
		"\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\21\3\22\3\22\3\22\3\22"+
		"\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\22\3\23\6\23\u00ad\n\23\r\23\16"+
		"\23\u00ae\3\23\3\23\3\24\3\24\2\2\25\3\3\5\4\7\5\t\6\13\7\r\b\17\t\21"+
		"\n\23\13\25\f\27\r\31\16\33\17\35\20\37\21!\22#\23%\24\'\25\3\2\4\3\2"+
		"\63\66\6\2\13\f\17\17\"\"\u0080\u0080\2\u00b4\2\3\3\2\2\2\2\5\3\2\2\2"+
		"\2\7\3\2\2\2\2\t\3\2\2\2\2\13\3\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2\21\3"+
		"\2\2\2\2\23\3\2\2\2\2\25\3\2\2\2\2\27\3\2\2\2\2\31\3\2\2\2\2\33\3\2\2"+
		"\2\2\35\3\2\2\2\2\37\3\2\2\2\2!\3\2\2\2\2#\3\2\2\2\2%\3\2\2\2\2\'\3\2"+
		"\2\2\3)\3\2\2\2\59\3\2\2\2\7G\3\2\2\2\tU\3\2\2\2\13b\3\2\2\2\re\3\2\2"+
		"\2\17g\3\2\2\2\21j\3\2\2\2\23n\3\2\2\2\25p\3\2\2\2\27r\3\2\2\2\31t\3\2"+
		"\2\2\33v\3\2\2\2\35y\3\2\2\2\37\u0086\3\2\2\2!\u0091\3\2\2\2#\u009f\3"+
		"\2\2\2%\u00ac\3\2\2\2\'\u00b2\3\2\2\2)*\7^\2\2*+\7d\2\2+,\7g\2\2,-\7i"+
		"\2\2-.\7k\2\2./\7p\2\2/\60\7}\2\2\60\61\7u\2\2\61\62\7g\2\2\62\63\7e\2"+
		"\2\63\64\7v\2\2\64\65\7k\2\2\65\66\7q\2\2\66\67\7p\2\2\678\7\177\2\28"+
		"\4\3\2\2\29:\7^\2\2:;\7g\2\2;<\7p\2\2<=\7f\2\2=>\7}\2\2>?\7u\2\2?@\7g"+
		"\2\2@A\7e\2\2AB\7v\2\2BC\7k\2\2CD\7q\2\2DE\7p\2\2EF\7\177\2\2F\6\3\2\2"+
		"\2GH\7^\2\2HI\7v\2\2IJ\7k\2\2JK\7v\2\2KL\7n\2\2LM\7g\2\2MN\7}\2\2NO\7"+
		"O\2\2OP\7q\2\2PQ\7x\2\2QR\7g\2\2RS\7u\2\2ST\7\177\2\2T\b\3\2\2\2UV\7^"+
		"\2\2VW\7v\2\2WX\7k\2\2XY\7v\2\2YZ\7n\2\2Z[\7g\2\2[\\\7}\2\2\\]\7O\2\2"+
		"]^\7c\2\2^_\7|\2\2_`\7g\2\2`a\7\177\2\2a\n\3\2\2\2bc\7<\2\2cd\7<\2\2d"+
		"\f\3\2\2\2ef\7e\2\2f\16\3\2\2\2gh\7e\2\2hi\7e\2\2i\20\3\2\2\2jk\7\63\2"+
		"\2kl\7:\2\2lm\7\62\2\2m\22\3\2\2\2no\7/\2\2o\24\3\2\2\2pq\7z\2\2q\26\3"+
		"\2\2\2rs\7i\2\2s\30\3\2\2\2tu\t\2\2\2u\32\3\2\2\2vw\7^\2\2wx\7^\2\2x\34"+
		"\3\2\2\2yz\7^\2\2z{\7d\2\2{|\7g\2\2|}\7i\2\2}~\7k\2\2~\177\7p\2\2\177"+
		"\u0080\7}\2\2\u0080\u0081\7o\2\2\u0081\u0082\7c\2\2\u0082\u0083\7|\2\2"+
		"\u0083\u0084\7g\2\2\u0084\u0085\7\177\2\2\u0085\36\3\2\2\2\u0086\u0087"+
		"\7^\2\2\u0087\u0088\7g\2\2\u0088\u0089\7p\2\2\u0089\u008a\7f\2\2\u008a"+
		"\u008b\7}\2\2\u008b\u008c\7o\2\2\u008c\u008d\7c\2\2\u008d\u008e\7|\2\2"+
		"\u008e\u008f\7g\2\2\u008f\u0090\7\177\2\2\u0090 \3\2\2\2\u0091\u0092\7"+
		"^\2\2\u0092\u0093\7d\2\2\u0093\u0094\7g\2\2\u0094\u0095\7i\2\2\u0095\u0096"+
		"\7k\2\2\u0096\u0097\7p\2\2\u0097\u0098\7}\2\2\u0098\u0099\7o\2\2\u0099"+
		"\u009a\7q\2\2\u009a\u009b\7x\2\2\u009b\u009c\7g\2\2\u009c\u009d\7u\2\2"+
		"\u009d\u009e\7\177\2\2\u009e\"\3\2\2\2\u009f\u00a0\7^\2\2\u00a0\u00a1"+
		"\7g\2\2\u00a1\u00a2\7p\2\2\u00a2\u00a3\7f\2\2\u00a3\u00a4\7}\2\2\u00a4"+
		"\u00a5\7o\2\2\u00a5\u00a6\7q\2\2\u00a6\u00a7\7x\2\2\u00a7\u00a8\7g\2\2"+
		"\u00a8\u00a9\7u\2\2\u00a9\u00aa\7\177\2\2\u00aa$\3\2\2\2\u00ab\u00ad\t"+
		"\3\2\2\u00ac\u00ab\3\2\2\2\u00ad\u00ae\3\2\2\2\u00ae\u00ac\3\2\2\2\u00ae"+
		"\u00af\3\2\2\2\u00af\u00b0\3\2\2\2\u00b0\u00b1\b\23\2\2\u00b1&\3\2\2\2"+
		"\u00b2\u00b3\13\2\2\2\u00b3(\3\2\2\2\4\2\u00ae\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}