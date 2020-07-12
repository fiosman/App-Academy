import { $CombinedState } from "redux"

export const fetchBenches = () => { 
  return $.ajax({ 
    method: 'GET', 
    url: '/api/benches', 
  })
}