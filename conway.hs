{-
    Haskell IO Project Option: Conway's Game of Life
    
    See the Wikipedia article on Conway's Game of Life to 
    learn the rules of the game. 
    
    Your program should accept an initial "map" of the Conway's Board, 
    in text, line by line. Cells that are empty should be given as '.' 
    characters. Cells that are alive should be shown as 'x'.
    
    After the map is entered, press <enter> to begin the game. 
    
    In the game, press <enter> to show the next generation. Press 
    'q' and <enter> to end the game.
    
    Here is a sample session:
    
    *Main> main
    Welcome to Conway's Game of Life.
    To begin, please enter a rectangular starting board, one line at a time:
    .........
    .........
    ....xxx..
    .........
    .........
    .........
    
    
    .........
    .........
    ....xxx..
    .........
    .........
    .........
    
    
    .........
    .....x...
    .....x...
    .....x...
    .........
    .........
    
    
    .........
    .........
    ....xxx..
    .........
    .........
    .........
    q
    *Main>
    
    Notes:
    
    1) With this board input scheme, you should be able to copy/paste
    from a text file with a board already in it. See blinker.txt for the
    input file that was used to create the sample session above.
    
    2) The board can be any size, and is only limited by the initial board
    that you enter into the program.
    
    3) Since the board is finite, your implementation should have so-called
    "periodic boundary conditions". See Wikipedia for an example. In short, 
    this means the board wraps around to the opposite side when you get to
    a boundary. This is not as hard as it sounds!
    
    4) Mr. D implemented this program in 60 lines of code (excluding
    comments). It is not a big program! Can you do it in fewer?
    
-}

main = putStrLn "Put your program here!"