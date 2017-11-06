#include <stddef.h>
#include <stdint.h>
#include <stdio.h>
#include <inttypes.h>
#define IX_TYPE int64_t
// #define DEBUG
//
IX_TYPE _gfortran_polly_array_index_1(IX_TYPE offset, IX_TYPE stride1, IX_TYPE ix1) {
#ifdef DEBUG
    // printf("indexing 1d: %zu + %zu * %zu \n", offset, stride1, ix1);
#endif
    return offset + stride1 * ix1;
}

IX_TYPE _gfortran_polly_array_index_2(IX_TYPE offset, IX_TYPE stride1, IX_TYPE stride2, IX_TYPE ix1, IX_TYPE ix2) {
#ifdef DEBUG
    printf("indexing 2d:%" PRId64 " + %" PRId64"* %"PRId64 " + %"PRId64"*%"PRId64 "\n" , offset, stride1, ix1, stride2, ix2);
#endif
    return offset + stride1 * ix1 + stride2 * ix2;
}

IX_TYPE _gfortran_polly_array_index_2_debug(IX_TYPE offset, IX_TYPE stride1, IX_TYPE stride2, IX_TYPE ix1, IX_TYPE ix2) {
    fprintf(stdout, "*** indexing 2d:%" PRId64 " + %" PRId64"* %"PRId64 " + %"PRId64"*%"PRId64 "\n" , offset, stride1, ix1, stride2, ix2);
    fprintf(stderr, "*** indexing 2d:%" PRId64 " + %" PRId64"* %"PRId64 " + %"PRId64"*%"PRId64 "\n" , offset, stride1, ix1, stride2, ix2);
    fflush(stderr);
    fflush(stdout);
    return 0;
}

IX_TYPE _gfortran_polly_array_index_3(IX_TYPE offset, IX_TYPE stride1, IX_TYPE stride2, IX_TYPE stride3, 
        IX_TYPE ix1, IX_TYPE ix2, IX_TYPE ix3) {
#ifdef DEBUG
    // printf("indexing 3d:\n");
#endif
    return offset + stride1 * ix1 + stride2 * ix2 + stride3 * ix3;
}

IX_TYPE _gfortran_polly_array_index_4(IX_TYPE offset, IX_TYPE stride1, IX_TYPE stride2, IX_TYPE stride3, IX_TYPE stride4,
        IX_TYPE ix1, IX_TYPE ix2, IX_TYPE ix3, IX_TYPE ix4) {
#ifdef DEBUG
    // printf("indexing 4d:\n");
#endif
    return offset + stride1 * ix1 + stride2 * ix2 + stride3 * ix3 + stride4 * ix4;
}
