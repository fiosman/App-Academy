import { getChirps, postLikeToChirp, deleteLikeFromChirp } from '../utils/chirps';

export const RECEIVE_CHIRPS = 'RECEIVE_CHIRPS';
export const RECEIVE_SINGLE_CHIRP = 'RECEIVE_SINGLE_CHIRP';


const receiveChirps = chirps => ({
  type: RECEIVE_CHIRPS,
  chirps,
});

const receiveSingleChirp = chirp => ({
  type: RECEIVE_SINGLE_CHIRP,
  chirp,
});

export const fetchChirps = () => dispatch => getChirps()
  .then(chirps => dispatch(receiveChirps(chirps)));

export const likeChirp = id => dispatch => postLikeToChirp(id)
  .then(chirp => dispatch(receiveSingleChirp(chirp)));

export const unLikeChirp = id => dispatch => deleteLikeFromChirp(id)
  .then(chirp => dispatch(receiveSingleChirp(chirp)));
