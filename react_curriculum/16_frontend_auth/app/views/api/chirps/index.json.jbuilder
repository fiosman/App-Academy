json.array! @chirps do |chirp|
  json.partial! 'api/chirps/chirp', chirp: chirp
end

