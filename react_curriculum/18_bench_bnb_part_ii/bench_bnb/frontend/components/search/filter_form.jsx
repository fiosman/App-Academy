import React from "react";

const FilterForm = (props) => {
  return (
    <div>
      <label>
        Min # of Seats:
        <input
          type="number"
          min="1"
          max="10"
          value={props.minSeating}
          onChange={(e) => props.updateFilter('minSeating', e.target.value )}
        />
      </label>
      <label>
        Max # of Seats:
        <input
          type="number"
          min="1"
          max="10"
          value={props.maxSeating}
          onChange={(e) => props.updateFilter('maxSeating', e.target.value)}
        />
      </label>
    </div>
  );
};

export default FilterForm;
