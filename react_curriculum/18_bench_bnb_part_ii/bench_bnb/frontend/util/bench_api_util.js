import { $CombinedState } from "redux";

export const fetchBenches = (filters) => {
  return $.ajax({
    method: "GET",
    url: "/api/benches",
    data: filters,
  });
};

export const fetchBench = (benchId) =>
  $.ajax({
    method: "GET",
    url: `api/benches/${benchId}`,
  });

export const createBench = (bench) => {
  return $.ajax({
    method: "POST",
    url: "/api/benches",
    data: { bench },
  });
};
