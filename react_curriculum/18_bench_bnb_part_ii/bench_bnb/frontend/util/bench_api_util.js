import { $CombinedState } from "redux"

export const fetchBenches = (filters) => { 
  return $.ajax({ 
    method: 'GET', 
    url: '/api/benches', 
    data: filters
  })
}