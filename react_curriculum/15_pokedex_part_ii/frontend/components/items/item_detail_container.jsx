import { connect } from 'react-redux';  
import ItemDetail from './item_detail';

const mapStateToProps = (state, ownProps) => ({ 
  item: state.entities.items[ownProps.match.params.itemId]
})