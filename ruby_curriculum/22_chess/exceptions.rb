class GameError < StandardError 
end 

class InvalidMoveError < GameError
end

class NoPieceError < GameError 
end 