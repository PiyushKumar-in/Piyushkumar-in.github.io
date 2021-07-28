function tryos(uri){
    var my_uri = window.location.href;
    if(my_uri.includes("#")){
        my_uri = my_uri.split("#")[0];
    }
    window.open(my_uri + uri)
}