#include "inline/inline.h"
#include "zfp.h"
#include "zfp/macros.h"
#include "block2.h"
#include "traitsd.h"
#include "template/template.h"
#include "template/codec.h"
#include "inline/bitstream.c"
#include "template/codecf.c"
#include "template/codec2.c"
#include "template/encode.c"
#include "template/encodef.c"
#include "template/encode2.c"
#include "template/revcodecf.c"
#include "template/revencode.c"
#include "template/revencodef.c"
#include "template/revencode2.c"
void zfp_init_encode2d() {
 zfpns.zfp_encode_block_double_2 = zfp_encode_block_double_2;
 zfpns.zfp_encode_block_strided_double_2 = zfp_encode_block_strided_double_2;
 zfpns.zfp_encode_partial_block_strided_double_2 = zfp_encode_partial_block_strided_double_2;
}

