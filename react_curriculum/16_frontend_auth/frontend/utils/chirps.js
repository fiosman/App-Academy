export const getChirps = () => $.ajax({
  url: '/api/chirps',
});

export const postLikeToChirp = id => $.ajax({
  url: '/api/likes',
  method: 'POST',
  data: { id },
});

export const deleteLikeFromChirp = id => $.ajax({
  url: '/api/likes',
  method: 'DELETE',
  data: { id },
});
