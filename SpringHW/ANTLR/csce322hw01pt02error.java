import java.io.IOException;

import org.antlr.v4.runtime.*;

class csce322hw01pt02error extends BaseErrorListener {
    @Override
    public void syntaxError(Recognizer<?, ?> recognizer, Object offendingSymbol, int line,
                            int position, String msg, RecognitionException e) {
        System.err.println(msg);
        Token errorToken = (Token) offendingSymbol;
        int errorLine = errorToken.getLine();
        int errorIndex = errorToken.getTokenIndex();
        // replace with code to process syntax errors
        System.exit(0);
    }

	//TODO: maybe this can fix issues but do it later,
	// hw do on 3/5
}
