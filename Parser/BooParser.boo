# From Unity's addin

namespace BooBinding.Parser

import System
import System.IO

import MonoDevelop.Projects
import MonoDevelop.Core
import MonoDevelop.Ide.TypeSystem

import ICSharpCode.NRefactory.CSharp

import Boo.Lang.Compiler


class BooParser(TypeSystemParser):
    _compiler = Boo.Lang.Compiler.BooCompiler()

    def constructor():
        pipeline = CompilerPipeline() { Steps.IntroduceModuleClasses() }
        _compiler.Parameters.Pipeline = pipeline

    override def Parse(storeAst as bool, fileName as string, reader as TextReader, project as Project):
#       LoggingService.LogError ("Parsing {0}", fileName)
        document = DefaultParsedDocument(fileName, Ast: SyntaxTree (FileName: fileName))

        # try:
        #   index = ProjectIndexFactory.ForProject(project)
        #   assert index is not null
        #   module = index.Parse(fileName, reader.ReadToEnd ())
        #   IntroduceModuleClasses(module).Accept(DomConversionVisitor(document.GetAst of SyntaxTree ()))
        # except e:
        #   LoggingService.LogError ("Parse error", e)

        return document

#   override def CreateResolver(dom as SyntaxTree, editor, fileName as string):
#       doc = cast(MonoDevelop.Ide.Gui.Document, editor)
#       return BooResolver(dom, doc.CompilationUnit, fileName)

    private def IntroduceModuleClasses(module as Ast.Module):
        return _compiler.Run(Ast.CompileUnit(module.CloneNode())).CompileUnit
