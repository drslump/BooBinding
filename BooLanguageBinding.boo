namespace BooBinding

import System
from System.IO import Path
from System.Xml import XmlElement
from System.CodeDom import CodeCompileUnit
from System.CodeDom.Compiler import CodeDomProvider, ICodeGenerator
from Boo.Lang.CodeDom import BooCodeProvider

from MonoDevelop.Core import IProgressMonitor, ClrVersion, FilePath
from MonoDevelop.Projects import IDotNetLanguageBinding, ConfigurationParameters, \
                                 ProjectParameters, ProjectItemCollection, \
                                 DotNetProjectConfiguration, ConfigurationSelector, BuildResult

from BooBinding.Project import BooCompilerParameters                                


class BooLanguageBinding(IDotNetLanguageBinding):

    Language as string:
        get: return 'Boo'

    ProjectStockIcon as string:
        get: return "md-boo-project"

    SingleLineCommentTag as string:
        get: return "#"

    BlockCommentStartTag as string:
        get: return "/*"

    BlockCommentEndTag as string:
        get: return "*/"

    def CreateCompilationParameters(projectOptions as XmlElement) as ConfigurationParameters:
        parameters = BooCompilerParameters()
        return parameters

    def CreateProjectParameters(projectOptions as XmlElement) as ProjectParameters:
        return null

    def Compile(projectItems as ProjectItemCollection, configuration as DotNetProjectConfiguration, configurationSelector as ConfigurationSelector, monitor as IProgressMonitor) as BuildResult:
        # Debug.Assert(compilerServices is not null)
        #return compilerServices.Compile (projectItems, configuration, configurationSelector, monitor)
        return null

    def GetSupportedClrVersions() as (ClrVersion):
        return array(ClrVersion, (
            ClrVersion.Net_2_0,
            ClrVersion.Clr_2_1,
            ClrVersion.Net_4_0,
            #ClrVersion.Net_4_5,
        ))

    def GetCodeDomProvider() as CodeDomProvider:
        return BooCodeProvider()

    def IsSourceCodeFile(fileName as FilePath):
        return Path.GetExtension(fileName).ToLower() == ".boo"

    def GetFileName(baseName as FilePath) as FilePath:
        return baseName + ".boo";

