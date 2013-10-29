namespace BooBinding.Project

import System

from MonoDevelop.Projects import ConfigurationParameters
import MonoDevelop.Core.Serialization


class BooCompilerParameters(ConfigurationParameters):
    [ItemProperty("genwarnings")]
    genwarnings = false

    [ItemProperty("ducky")]
    ducky = false

    [ItemProperty("culture")]
    culture = ""

    [ItemProperty("DefineConstants", DefaultValue:"")]
    definesymbols = String.Empty

    GenWarnings as bool:
        get: return genwarnings
        set: genwarnings = value

    Ducky as bool:
        get: return ducky
        set: ducky = value

    Culture as string:
        get: return culture
        set: culture = value

    DefineConstants as string:
        get: return definesymbols
        set: definesymbols = value

    override def AddDefineSymbol(symbol as string):
        DefineConstants += symbol + ";"

    override def HasDefineSymbol(symbol as string):
        return DefineConstants.StartsWith(symbol + ';') or DefineConstants.Contains(';' + symbol + ';')

    override def RemoveDefineSymbol(symbol as string):
        DefineConstants = DefineConstants.Replace(symbol + ";", "")
