# TicTacToe Implementation in Ruby

## About the Project
This project is a commandline implementation of the famous TicTacToe game, in Ruby. iIn this milestone, RSpec testing has been added to the project, and the file 'tic_tac_toe_spec.rb' in the 'spec' folder is responsible for running the test cases.

> The project's requirements can be found here: [OOP (Object Oriented Programming)](https://microverse.pathwright.com/library/fast-track-curriculum/69047/path/step/59565018/)

### Project Structure
- It has two folders bin and lib
- The bin folder contains the main.rb which is the heart of the project, i.e., where the game runs from.
- The lib folder has 3 files: - the board.rb that contains the Board class where methods related to the board are all defined, the player.rb which initialises a new player object with player name and a piece, and the game_logic.rb where all the logic behind the game is defined including validating the player's input, moving board pieces into selected cells, switching player after the other has played, checking if the game is over and so much more.

## Getting started
- To play the game, open your Linux terminal and navigate to bin folder in the game directory.
- Type ./main.rb and hit "Enter" to run the game.

## Game Instructions
- The Tic Tac Toe game requires 2 players.
- It provides a board with a 3x3 grid having 9 cells.
- When the game is started, it will display a fresh board marked with numbers 1 - 9.
- It prompts the first player for a name with supported format.
- Type your name with the given format and hit "Enter"
- It also prompts the first player for a symbol with supported format.
- Type your symbol with the given format and hit "Enter"
- Same goes for the second player. We customize your piece for any letter a player may prefer.
- Play the game according the the prompts.
- The winner is the first player who succeeds in playing their piece in a horizontal, vertical or diagonal row all aligned.
- The game ends in a tie (draw) if the board is filled and no winning combination is found.
- You can replay the game by running ./main.rb in the bin folder again.

## Project Screenshots here:
![screenshot](capture.png)

### Built With
Technologies used during development of this project
- Ruby Language

## Authors

👤 **Nakitto Catherine**

- Github: [@Cathella](https://github.com/Cathella)
- Twitter: [@cathella9](https://twitter.com/cathella9)
- Linkedin: [Catherine Nakitto](https://www.linkedin.com/in/catherine-nakitto-51ba2a40/)

👤 **Sunday Uche Ezeilo**

- Github: [@sundayezeilo](https://github.com/ezeilo-su)
- Twitter: [@SundayEzeilo](https://twitter.com/SundayEzeilo)
- Linkedin: [Sunday Ezeilo](https://www.linkedin.com/in/sunday-ezeilo-a6a67664/)

## 🤝 Contributing

Contributions, issues and feature requests are welcome!

Feel free to check the [issues page](https://github.com/Cathella/tic_tac_toe/issues)

## Show your support

Show support by giving a ⭐️ if you like this project!
