// Thread-local variable
thread_local int tls_obj = 123;

int get_tls() {
    return tls_obj;
}


int main () {
    int gettls = get_tls();

    return 0; 
}