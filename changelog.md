# Change log

## master (unreleased)

### 0.3.2 (2020-08-04)

### New features

- [#35](https://github.com/cameronsutter/odyssey/pull/35) `Odyssey.analyze_multi` now raises `Odyssey::ArgumentError` instead of `ArgumentError`. ([@jethrodaniel][])

### 0.3.1 (2019-10-11)

### New features

- [#33](https://github.com/cameronsutter/odyssey/pull/33) Add `Odyssey.analyze_all` as a shortcut to call `Odyssey.analyze_multi` with all formulas. ([@DannyBen][])
- [#33](https://github.com/cameronsutter/odyssey/pull/33) Add `Odyssey::Refinements` to wrap `String#readability` as a call to `Odyssey.analyze_all`.  ([@DannyBen][])

### 0.3.0

### New features

- [#14](https://github.com/cameronsutter/odyssey/pull/14) Support analysis on a per-sentence basis. ([@lahnerml][])

[@jethrodaniel]: https://github.com/jethrodaniel
[@lahnerml]: https://github.com/lahnerml
[@DannyBen]: https://github.com/DannyBen
[@cameronsutter]: https://github.com/cameronsutter
