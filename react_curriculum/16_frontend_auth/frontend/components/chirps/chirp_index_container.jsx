import React from 'react';
import ChirpIndex from './chirp_index';
import { fetchChirps, likeChirp, unLikeChirp } from '../../actions/chirps';
import { connect } from 'react-redux';

const mapStateToProps = (state) => ({
  chirps: Object.keys(state.entities.chirps).map(key => state.entities.chirps[key])
});

const mapDispatchToProps = (dispatch) => ({
  fetchChirps: () => dispatch(fetchChirps()),
  likeChirp: id => dispatch(likeChirp(id)),
  unLikeChirp: id => dispatch(unLikeChirp(id))
});

export default connect(mapStateToProps, mapDispatchToProps)(ChirpIndex);
