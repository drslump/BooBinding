# From Unity's addin

namespace BooBinding.Highlighting

import Mono.TextEditor
import Mono.TextEditor.Highlighting
import System.IO
import System.Xml
import System.Linq
import System.Collections.Generic

class BooSyntaxMode(SyntaxMode):
    # Used to cache the loaded XML syntax
    static baseMode as SyntaxMode

    def constructor():
        super()
        Init()

    def constructor(doc as TextDocument):
        super(doc)
        Init()

    def Init():

        if not baseMode:
            provider = ResourceStreamProvider(GetType().Assembly, "BooSyntaxMode.xml")
            using reader = provider.Open():
                baseMode = SyntaxMode.Read(reader)

        self.rules = List[of Rule](baseMode.Rules)
        self.keywords = List[of Keywords](baseMode.Keywords)
        self.spans = List[of Span](baseMode.Spans).ToArray()
        self.prevMarker = baseMode.PrevMarker
        self.SemanticRules = List[of SemanticRule](baseMode.SemanticRules)
        self.keywordTable = baseMode.keywordTable
        self.keywordTableIgnoreCase = baseMode.keywordTableIgnoreCase
        self.properties = baseMode.Properties

        _matches = List[of Match]()
        _matches.AddRange(baseMode.Matches)

        // Number literals
        _matches.Add(workaroundMatchCtor(
            "Number", 
            "(?<!\\w)(0((x|X)[0-9a-fA-F_]+|(b|B)[0-1_]+)|([0-9]+[_0-9]*)[L|U|u|f|i]*)"))

        self.matches = _matches.ToArray()

    static def workaroundMatchCtor(color as string, regexp as string) as Match:
        st = StringReader("<Match color = \""+color+"\"><![CDATA[" + regexp + "]]></Match>")
        x = XmlTextReader(st)
        x.Read()
        m = Match.Read(x)
        st.Close()
        return m
