namespace BooBinding.Project

from MonoDevelop.Projects import DotNetProjectParameters
import MonoDevelop.Core.Serialization


class BooProjectParameters(DotNetProjectParameters):
""" Serializable type that is used for storing file build order """

    buildOrder as (string)
    BuildOrder as (string):
        get:
            if buildOrder != null:
                return buildOrder
            return array(string, 0)
        set: 
            _buildOrder = value

