import "dart:io";

List validMoves = ["rock", "paper", "scissors"];


/// Gets a player"s name and uses a default name if none is entered.
String getPlayerName(String defaultName) {

    stdout.write("Enter $defaultName name: ");
    String? input = stdin.readLineSync();

    if (input == null || input.trim().isEmpty) {

        return defaultName;

        }

    return input.trim();

    
    }

/// Gets a valid rock, paper, or scissors move from a player.
String getMove(String playerName) {

    while (true) {
        stdout.write("$playerName, enter your move (rock/paper/scissors): ");

    String? input = stdin.readLineSync();
    String? move = validateMove(input);

    if (move != null) {
        return move;
    }

    print("Invalid move. Please type rock, paper, or scissors.");
    }
}

/// Checks if the entered move is valid and returns it in lowercase.
String? validateMove(String? input) {

    String move = input?.trim().toLowerCase() ?? "";

    if (validMoves.contains(move)) {
        return move;
    }
    
    return null;
}


/// Determines the winner of a round and returns the winning player"s name.
String? decideWinner(String playerOneName, String playerTwoName, String playerOneMove, String playerTwoMove) {

    if (playerOneMove == playerTwoMove) {
        return null;

    } else if ((playerOneMove == "rock" && playerTwoMove == "scissors") || 
    (playerOneMove == "paper" && playerTwoMove == "rock") || 
    (playerOneMove == "scissors" && playerTwoMove == "paper")) {

        return playerOneName;

    } else {

        return playerTwoName;
    }
}

void main() {
    
    print("===== ROCK, PAPER, SCISSORS =====\n");

    String playerOneName = getPlayerName("Player 1");
    String playerTwoName = getPlayerName("Player 2");

    int playerOneScore = 0;
    int playerTwoScore = 0;
    int roundNumber = 1;

    String playAgain;

    do {

        print("\n--- Round $roundNumber ---");

        String playerOneMove = getMove(playerOneName);
        for (int i = 0; i < 30; i++) {
            print("");
        }

        String playerTwoMove = getMove(playerTwoName);

        print("\n$playerOneName chose $playerOneMove. " "$playerTwoName chose $playerTwoMove.");

        String? winner = decideWinner(
            playerOneName,
            playerTwoName,
            playerOneMove,
            playerTwoMove,
        );

        print("\nResult: ${winner ?? "It\"s a draw!"}");

        if (winner == playerOneName) {
            playerOneScore++;
        } else if (winner == playerTwoName) {
            playerTwoScore++;
        }

        print("Score -> $playerOneName: $playerOneScore | " "$playerTwoName: $playerTwoScore");

        roundNumber++;

        stdout.write("\nPlay again? (y/n): ");
        playAgain = stdin.readLineSync()?.trim().toLowerCase() ?? "n";

        } 
        
    while (playAgain != "n");

        print("\n===== FINAL SCORE =====");
        print("$playerOneName: $playerOneScore | $playerTwoName: $playerTwoScore");

        if (playerOneScore > playerTwoScore) {

            print("Overall winner: $playerOneName");
        } else if (playerTwoScore > playerOneScore) {

            print("Overall winner: $playerTwoName");
        } else {

            print("Overall winner: It\"s a draw!");
        }
}