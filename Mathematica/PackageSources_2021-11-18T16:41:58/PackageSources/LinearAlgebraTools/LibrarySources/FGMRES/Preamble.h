extern "C" void pardiso (void *pt, mint *maxfct, mint *mnum, mint *mtype, mint *phase, mint *n, mreal *a, mint *ia, mint *ja, mint *perm, mint *nrhs, mint *iparm, mint *msglvl, mreal *b, mreal *x, mint *error);

extern "C" void dfgmres (const mint *n, mreal *x, mreal *b, mint *RCI_request, mint *ipar, mreal *dpar, mreal *tmp );

extern "C" void dfgmres_get (const mint *n, mreal *x, mreal *b, mint *RCI_request, const mint *ipar, const mreal *dpar, mreal *tmp, mint *itercount );
extern "C" void dfgmres_check (const mint *n, const mreal *x, const mreal *b, mint *RCI_request, mint *ipar, mreal *dpar, mreal *tmp );

extern "C" void mkl_dcsrgemv(const char *transa, const mint *m, const mreal *a, const mint *ia, const mint *ja, const mreal *x, mreal *y);
extern "C" void mkl_dcsrtrsv(const char *uplo, const char *transa, const char *diag, const mint *m, const mreal *a, const mint *ia, const mint *ja, const mreal *x, mreal *y);

extern "C" void dcsrilu0 (const mint *n , const mreal *a , const mint *ia , const mint *ja , mreal *p , const mint *ipar , const mreal *dpar , mint *ierr );
extern "C" void dcsrilut (const mint *n, const mreal *a, const mint *ia, const mint *ja, mreal *p, mint *ip, mint *jp, const mreal *tol, const mint *maxfil, const mint *ipar, const mreal *dpar, mint *ierr);
extern "C" void mkl_get_version_string(char *, int);
