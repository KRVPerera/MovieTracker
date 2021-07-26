import ballerina/http;

configurable string api_key = ?;
configurable string base_search_url = ?;

type Moviedb record {
    string original_title;
    string? backdrop_path;
    string overview;
    string title;
};

type TMDBResultPages record {
    Moviedb[] results;
};

service /movies on new http:Listener(8082) {
    resource function get find(string query) returns TMDBResultPages|error {
        http:Client tmdb = check new(base_search_url);
        var lit = "/3/search/movie?api_key=" + api_key + "&language=en-US&query=" + query;
        TMDBResultPages data = check tmdb->get(lit);
        return data;
    }
}
