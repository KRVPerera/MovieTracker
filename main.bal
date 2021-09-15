import ballerina/http;
import ballerina/log;

configurable string api_key = ?;
configurable string base_search_url = ?; // https://api.themoviedb.org

type Moviedb record {
    string original_title;
    string? backdrop_path;
    string overview;
    string title;
    int id;
};

type TMDBResultPages record {
    Moviedb[] results;
    int total_results;
    int page;
    int total_pages;
};

final http:Client tmdb = check new (base_search_url);

service /movies on new http:Listener(8082) {
    resource function get find(string query) returns TMDBResultPages|error {
        var lit = "/3/search/movie?api_key=" + api_key + "&language=en-US&query=" + query;
        TMDBResultPages data = check tmdb->get(lit);
        log:printInfo("total_pages : " + data.total_pages.toBalString());
        log:printInfo("page : " + data.page.toBalString());
        log:printInfo("total results : " + data.total_results.toBalString());
        return data;
    }
}
