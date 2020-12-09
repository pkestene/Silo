#include "inline/inline.h"
#include "zfp.h"
#include "zfp/macros.h"
#include "block1.h"
#include "traitsi.h"
#include "template/template.h"
#include "template/codec.h"
#include "inline/bitstream.c"
#include "template/codec1.c"
#include "template/decode.c"
#include "template/decodei.c"
#include "template/decode1.c"
#include "template/revdecode.c"
#include "template/revdecode1.c"
void zfp_init_decode1i() {
 zfpns.zfp_decode_block_int32_1 = zfp_decode_block_int32_1;
 zfpns.zfp_decode_block_strided_int32_1 = zfp_decode_block_strided_int32_1;
 zfpns.zfp_decode_partial_block_strided_int32_1 = zfp_decode_partial_block_strided_int32_1;
}

