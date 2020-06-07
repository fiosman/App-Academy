const API_KEY = "9IW9WdqXrMVE9UjWmqEUukcvnXdGXej8";

export const fetchSearchGiphys = (searchTerm) => {
  return $.ajax({
    method: "GET",
    url: `http://api.giphy.com/v1/gifs/search?q=${searchTerm}&api_key=${API_KEY}&limit=2`,
  });
};
