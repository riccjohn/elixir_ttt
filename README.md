# ElixirTtt

[![CircleCI](https://circleci.com/gh/riccjohn/elixir_ttt.svg?style=svg)](https://circleci.com/gh/riccjohn/elixir_ttt)

Tic-tac-toe with a command-line interface

## Installation

Clone repo

```zsh
git clone git@github.com:riccjohn/elixir_ttt.git
```

---

## REPL

To run the application in a repl

```zsh
iex -S mix
```

This loads the application in the repl and allows you to call different functions

```
iex(1)> Board.new_game
%{
  board: %{
    0 => 0,
    1 => 1,
    2 => 2,
    3 => 3,
    4 => 4,
    5 => 5,
    6 => 6,
    7 => 7,
    8 => 8
  },
  next_player: :x
}

```

Hit `Ctrl + c` twice to exit the repl

---

## Tests

#### Run all tests

```zsh
mix test
```

#### Run tests for a single module

`# mix test --only <module_name>`

```zsh
mix test --only board
```

Modules available for testing:

- board

#### Run tests by description block within a module

`# mix test --only <module_name>:<describe_block_name>`

```zsh
mix test --only board:new_game
```

Describe blocks available:

- board:new_game
- board:take_turn
