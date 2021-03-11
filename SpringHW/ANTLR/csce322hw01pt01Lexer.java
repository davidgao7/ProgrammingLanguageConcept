// Generated from csce322hw01pt01.g4 by ANTLR 4.9.1
import org.antlr.v4.runtime.Lexer;
import org.antlr.v4.runtime.CharStream;
import org.antlr.v4.runtime.Token;
import org.antlr.v4.runtime.TokenStream;
import org.antlr.v4.runtime.*;
import org.antlr.v4.runtime.atn.*;
import org.antlr.v4.runtime.dfa.DFA;
import org.antlr.v4.runtime.misc.*;

@SuppressWarnings({"all", "warnings", "unchecked", "unused", "cast"})
public class csce322hw01pt01Lexer extends Lexer {
	static { RuntimeMetaData.checkVersion("4.9.1", RuntimeMetaData.VERSION); }

	protected static final DFA[] _decisionToDFA;
	protected static final PredictionContextCache _sharedContextCache =
		new PredictionContextCache();
	public static final int
		OpenSection=1, EndSection=2, MoveTitle=3, MazeTitle=4, AssignVal=5, MoveSymbo=6, 
		MazeSymbo=7, NumSymbo=8, RowEnding=9, MazeBegin=10, MazeEnd=11, ListBegin=12, 
		ListEndin=13, WS=14, Other=15;
	public static String[] channelNames = {
		"DEFAULT_TOKEN_CHANNEL", "HIDDEN"
	};

	public static String[] modeNames = {
		"DEFAULT_MODE"
	};

	private static String[] makeRuleNames() {
		return new String[] {
			"OpenSection", "EndSection", "MoveTitle", "MazeTitle", "AssignVal", "MoveSymbo", 
			"MazeSymbo", "NumSymbo", "RowEnding", "MazeBegin", "MazeEnd", "ListBegin", 
			"ListEndin", "WS", "Other"
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


	public csce322hw01pt01Lexer(CharStream input) {
		super(input);
		_interp = new LexerATNSimulator(this,_ATN,_decisionToDFA,_sharedContextCache);
	}

	@Override
	public String getGrammarFileName() { return "csce322hw01pt01.g4"; }

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
		"\3\u608b\ua72a\u8133\ub9ed\u417c\u3be7\u7786\u5964\2\21\u00ad\b\1\4\2"+
		"\t\2\4\3\t\3\4\4\t\4\4\5\t\5\4\6\t\6\4\7\t\7\4\b\t\b\4\t\t\t\4\n\t\n\4"+
		"\13\t\13\4\f\t\f\4\r\t\r\4\16\t\16\4\17\t\17\4\20\t\20\3\2\3\2\3\2\3\2"+
		"\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\2\3\3\3\3\3\3\3\3\3\3\3"+
		"\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4\3\4"+
		"\3\4\3\4\3\4\3\4\3\4\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3\5\3"+
		"\5\3\6\3\6\3\6\3\7\3\7\3\7\3\7\3\7\3\7\5\7d\n\7\3\b\3\b\6\bh\n\b\r\b\16"+
		"\bi\5\bl\n\b\3\t\3\t\3\n\3\n\3\n\3\13\3\13\3\13\3\13\3\13\3\13\3\13\3"+
		"\13\3\13\3\13\3\13\3\13\3\13\3\f\3\f\3\f\3\f\3\f\3\f\3\f\3\f\3\f\3\f\3"+
		"\f\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\r\3\16\3\16\3"+
		"\16\3\16\3\16\3\16\3\16\3\16\3\16\3\16\3\16\3\16\3\17\6\17\u00a6\n\17"+
		"\r\17\16\17\u00a7\3\17\3\17\3\20\3\20\2\2\21\3\3\5\4\7\5\t\6\13\7\r\b"+
		"\17\t\21\n\23\13\25\f\27\r\31\16\33\17\35\20\37\21\3\2\5\5\2//iizz\3\2"+
		"\62;\6\2\13\f\17\17\"\"\u0080\u0080\2\u00b1\2\3\3\2\2\2\2\5\3\2\2\2\2"+
		"\7\3\2\2\2\2\t\3\2\2\2\2\13\3\2\2\2\2\r\3\2\2\2\2\17\3\2\2\2\2\21\3\2"+
		"\2\2\2\23\3\2\2\2\2\25\3\2\2\2\2\27\3\2\2\2\2\31\3\2\2\2\2\33\3\2\2\2"+
		"\2\35\3\2\2\2\2\37\3\2\2\2\3!\3\2\2\2\5\61\3\2\2\2\7?\3\2\2\2\tM\3\2\2"+
		"\2\13Z\3\2\2\2\rc\3\2\2\2\17k\3\2\2\2\21m\3\2\2\2\23o\3\2\2\2\25r\3\2"+
		"\2\2\27\177\3\2\2\2\31\u008a\3\2\2\2\33\u0098\3\2\2\2\35\u00a5\3\2\2\2"+
		"\37\u00ab\3\2\2\2!\"\7^\2\2\"#\7d\2\2#$\7g\2\2$%\7i\2\2%&\7k\2\2&\'\7"+
		"p\2\2\'(\7}\2\2()\7u\2\2)*\7g\2\2*+\7e\2\2+,\7v\2\2,-\7k\2\2-.\7q\2\2"+
		"./\7p\2\2/\60\7\177\2\2\60\4\3\2\2\2\61\62\7^\2\2\62\63\7g\2\2\63\64\7"+
		"p\2\2\64\65\7f\2\2\65\66\7}\2\2\66\67\7u\2\2\678\7g\2\289\7e\2\29:\7v"+
		"\2\2:;\7k\2\2;<\7q\2\2<=\7p\2\2=>\7\177\2\2>\6\3\2\2\2?@\7^\2\2@A\7v\2"+
		"\2AB\7k\2\2BC\7v\2\2CD\7n\2\2DE\7g\2\2EF\7}\2\2FG\7O\2\2GH\7q\2\2HI\7"+
		"x\2\2IJ\7g\2\2JK\7u\2\2KL\7\177\2\2L\b\3\2\2\2MN\7^\2\2NO\7v\2\2OP\7k"+
		"\2\2PQ\7v\2\2QR\7n\2\2RS\7g\2\2ST\7}\2\2TU\7O\2\2UV\7c\2\2VW\7|\2\2WX"+
		"\7g\2\2XY\7\177\2\2Y\n\3\2\2\2Z[\7<\2\2[\\\7<\2\2\\\f\3\2\2\2]d\7e\2\2"+
		"^_\7e\2\2_d\7e\2\2`a\7\63\2\2ab\7:\2\2bd\7\62\2\2c]\3\2\2\2c^\3\2\2\2"+
		"c`\3\2\2\2d\16\3\2\2\2el\t\2\2\2fh\t\3\2\2gf\3\2\2\2hi\3\2\2\2ig\3\2\2"+
		"\2ij\3\2\2\2jl\3\2\2\2ke\3\2\2\2kg\3\2\2\2l\20\3\2\2\2mn\t\3\2\2n\22\3"+
		"\2\2\2op\7^\2\2pq\7^\2\2q\24\3\2\2\2rs\7^\2\2st\7d\2\2tu\7g\2\2uv\7i\2"+
		"\2vw\7k\2\2wx\7p\2\2xy\7}\2\2yz\7o\2\2z{\7c\2\2{|\7|\2\2|}\7g\2\2}~\7"+
		"\177\2\2~\26\3\2\2\2\177\u0080\7^\2\2\u0080\u0081\7g\2\2\u0081\u0082\7"+
		"p\2\2\u0082\u0083\7f\2\2\u0083\u0084\7}\2\2\u0084\u0085\7o\2\2\u0085\u0086"+
		"\7c\2\2\u0086\u0087\7|\2\2\u0087\u0088\7g\2\2\u0088\u0089\7\177\2\2\u0089"+
		"\30\3\2\2\2\u008a\u008b\7^\2\2\u008b\u008c\7d\2\2\u008c\u008d\7g\2\2\u008d"+
		"\u008e\7i\2\2\u008e\u008f\7k\2\2\u008f\u0090\7p\2\2\u0090\u0091\7}\2\2"+
		"\u0091\u0092\7o\2\2\u0092\u0093\7q\2\2\u0093\u0094\7x\2\2\u0094\u0095"+
		"\7g\2\2\u0095\u0096\7u\2\2\u0096\u0097\7\177\2\2\u0097\32\3\2\2\2\u0098"+
		"\u0099\7^\2\2\u0099\u009a\7g\2\2\u009a\u009b\7p\2\2\u009b\u009c\7f\2\2"+
		"\u009c\u009d\7}\2\2\u009d\u009e\7o\2\2\u009e\u009f\7q\2\2\u009f\u00a0"+
		"\7x\2\2\u00a0\u00a1\7g\2\2\u00a1\u00a2\7u\2\2\u00a2\u00a3\7\177\2\2\u00a3"+
		"\34\3\2\2\2\u00a4\u00a6\t\4\2\2\u00a5\u00a4\3\2\2\2\u00a6\u00a7\3\2\2"+
		"\2\u00a7\u00a5\3\2\2\2\u00a7\u00a8\3\2\2\2\u00a8\u00a9\3\2\2\2\u00a9\u00aa"+
		"\b\17\2\2\u00aa\36\3\2\2\2\u00ab\u00ac\13\2\2\2\u00ac \3\2\2\2\7\2cik"+
		"\u00a7\3\b\2\2";
	public static final ATN _ATN =
		new ATNDeserializer().deserialize(_serializedATN.toCharArray());
	static {
		_decisionToDFA = new DFA[_ATN.getNumberOfDecisions()];
		for (int i = 0; i < _ATN.getNumberOfDecisions(); i++) {
			_decisionToDFA[i] = new DFA(_ATN.getDecisionState(i), i);
		}
	}
}