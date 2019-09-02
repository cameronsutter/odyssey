# odyssey-cli

[![Gem Version](https://badge.fury.io/rb/odyssey-cli.svg)](https://badge.fury.io/rb/odyssey-cli)

CLI for the ruby text analysis gem odyssey.

## Installation

Install the executable like so

```
gem install odyssey-cli
```

## Usage

```
odyssey score moby_dick.txt      # Outputs all readability scores
odyssey score othello.txt -f ari # Outputs ARI score only (or use `--formula=`)
```

For detailed usage, see

- `odyssey help` and `odyssey help score`

Additionally, you can check out the [cli spec](spec/odyssey/cli/cli_spec.rb) for some examples.

## License

Released under the same license as odyssey itself, see [it's license](../LICENSE.txt).

## Contributing

1. Fork it
2. Create your feature branch (`git checkout -b my-new-feature`)
3. Commit your changes (`git commit -am 'Add some feature'`)
4. Push to the branch (`git push origin my-new-feature`)
5. Create new Pull Request
