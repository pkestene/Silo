#include "inline/inline.h"
#include "zfp.h"
#include "zfp/macros.h"
#include "block3.h"
#include "traitsf.h"
#include "template/template.h"
#include "template/codec.h"
#include "inline/bitstream.c"
#include "template/codecf.c"
#include "template/codec3.c"
#include "template/encode.c"
#include "template/encodef.c"
#include "template/encode3.c"
#include "template/revcodecf.c"
#include "template/revencode.c"
#include "template/revencodef.c"
#include "template/revencode3.c"
void zfp_init_encode3f() {
 zfpns.zfp_encode_block_float_3 = zfp_encode_block_float_3;
 zfpns.zfp_encode_block_strided_float_3 = zfp_encode_block_strided_float_3;
 zfpns.zfp_encode_partial_block_strided_float_3 = zfp_encode_partial_block_strided_float_3;
}

