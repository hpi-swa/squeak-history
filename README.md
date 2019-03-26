# The Squeak History Project
Project for Squeak 5.2 (and above) to explore and learn about the history of Squeak and Squeak-related projects.

## How to Install

1. Prepare an image with [Squeak 5.2](http://files.squeak.org/5.2/) or higher.
2. Be sure to enable the Sista Bytecode Set, because there are several methods with (too) many literals. Once you got an appropriate [virtual machine](https://bintray.com/opensmalltalk/vm/cog/_latestVersion#files) that supports Sista (look for `squeak.sista.spur_*.zip`), recompile all methods via `ReleaseBuilder recompileAll`.
3. Be sure to load [Metacello](https://github.com/Metacello/metacello) via `Installer ensureRecentMetacello.`.
4. Load the Squeak History Project:

```Smalltalk
Metacello new
  baseline: 'SqueakHistory';
  repository: 'github://hpi-swa/squeak-history/packages';
  load.
```

After the code was loaded, mailing list archives will be downloaded. See `BaselineOfSqueakHistory >> #loadData` for details.

## How to Use
