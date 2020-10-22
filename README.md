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

The `SqhMailmanAggregator` can be used to enumerate all mail messages. Example queries can be found in the `queries` protocol. The message cache holds meta-data for each message in the image, that is, instances of `SqhMailWrapper`. The message body has to access the achive's file contents on disk, which is slower. Here is an example query, which requires disk access:

```Smalltalk
countMessageLines
  | count |
  count := 0.
  self messagesCachedDo: [:wrapper |
    count := count + wrapper mailMessage bodyText lineCount].
  ^ count
```

Note that you should also derive some rules for author-key normalization to further improve the overall quality of query results. Just run this:

```Smalltalk
SqhMailmanAggregator new
  showProgress: true; "optional"
  deriveRulesForAuthorKeyNormalization. "ignore the warning"
```

For more information on normalization, see below.

## Notes on Normalization

There are rules to normalize different kinds of information: author names, timestamps, mail addresses. The goal is to identify contributors and, eventually, relevant discussions. Hand-selected rules can be found in `SqhMailmanAggregator >> #rulesForAuthorKeyNormalization` and `#rulesForAuthorKeyClarification`. Here is an excerpt:

```Smalltalk
"rulesForAuthorKeyNormalization"
'alankay' -> 'alancurtiskay'.
'bertfreudenberg' -> 'vanessafreudenberg'.
'bertfreudenbergg' -> 'vanessafreudenberg'.

"rulesForAuthorKeyClarification"
'etoys-dev-forum@squeakland.org' -> ('bert' -> 'vanessafreudenberg').
'squeak@bike-nomad.com' -> ('squeak' -> 'nedkonz').
```

Then, there is a simple algorithm to derive more normalization rules using *e-mail addresses* as identifier. If two messages came from the same address, then the author's names can be used to identify the same contributor. There is also a check to avoid mapping cycles. See `SqhMailmanAggregator >> #deriveRulesForAuthorKeyNormalization` for details. We filter generic addresses such as:

```
notifications@github.com
noreply@github.com
no-reply@appveyor.com
builds@travis-ci.org
```

Note that there is also a (hand-crafted) list of generic author names (or keys) in `#genericAuthorKeys` including `github` or `travisci`.
