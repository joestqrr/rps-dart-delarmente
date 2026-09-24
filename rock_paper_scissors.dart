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
