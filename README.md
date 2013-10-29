Simple Boo addin for MonoDevelop 4 and Xamarin Studio

The following features are implemented:

 - Syntax highlighting
 - Project creation
 - Compilation via xbuild

No autocompletion or refactoring support. Still it allows
to create, build, run and debug projects.

Note that it uses XBuild (Mono's MSBuild clone) to compile
the projects. It should work fairly well with recent Boo
versions (0.9.7).

To make the IDE find the msbuild *targets* file suitable for
Boo projects you must set the environment variable `BooToolPath`
in your system ([instructions for OSX](http://stackoverflow.com/a/588442)),
pointing to where Boo is installed.

The addin includes a recent version of Boo under the `boo` directory,
you can use that one if you please.

To install the addin you can simply clone the repository to your
computer addins directory. For Xamarin Studio in OSX it's located at
`~/Library/Application Support/XamarinStudio-4.0/LocalInstall/Addins/`.


