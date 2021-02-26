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