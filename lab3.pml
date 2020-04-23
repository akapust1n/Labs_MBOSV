mtype = {
    GET, 
    POST, 
    HEAD, 
    PUT, 
    DELETE
}

chan connection = [0] of { byte };
byte msgCount = 0;
active proctype client() {
start:
    (msgCount % 5 == 0) ;
    connection ! GET;
    printf("client: send GET\n");

    (msgCount % 5 == 1) ;
    connection ! POST;
    printf("client: send POST\n");

    (msgCount % 5 == 2) ;
    connection ! HEAD;
    printf("client: send HEAD\n");

    (msgCount % 5 == 3) ;
    connection ! PUT;
    printf("client: send PUT\n");

    (msgCount % 5 == 4) ;
    connection ! DELETE;
    printf("client: send DELETE\n");
      
if :: (msgCount < 10) -> 
    goto start
fi
}

active proctype server() {
start:
    if :: connection ? GET -> printf("server: recive GET\n")
       :: connection ? POST -> printf("server: recive POST\n")
       :: connection ? HEAD -> printf("server: recive HEAD\n")
       :: connection ? PUT -> printf("server: recive PUT\n")
       :: connection ? DELETE -> printf("server: recive DELETE\n")
    fi
    msgCount = msgCount + 1;
    goto start
}