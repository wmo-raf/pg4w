vcl 4.1;

backend default {
  .host = "pg_tileserv";
  .port = "7800";
}

sub vcl_recv {
    if (req.url == "/") {
        return(pass);
    }
    if (req.url == "/index.html") {
        return(pass);
    }
    if (req.url == "/index.json") {
        return(pass);
    }
}

sub vcl_deliver
{
    if (obj.hits > 0) {
        set resp.http.X-Cache = "HIT";
        set resp.http.X-Cache-Hits = obj.hits;
    }
    else {
        set resp.http.X-Cache = "MISS";
    }
}