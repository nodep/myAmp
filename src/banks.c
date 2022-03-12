#include <avr/pgmspace.h>

#include "banks.h"

const unsigned char fv1programs[NUM_EXT_PROGRAMS][0x200] PROGMEM =
{
/* 1 0 */ #include "FV-1/spn/shimmer_drAlx.h"
/* 1 1 */ #include "FV-1/spn/shimmer-1.h"
/* 1 2 */ #include "FV-1/spn/shimmer-2.h"
/* 1 3 */ #include "FV-1/spn/dattorro.h"
/* 1 4 */ #include "FV-1/spn/freeverb.h"
/* 1 5 */ #include "FV-1/spn/drolo/flanger.h"
/* 1 6 */ #include "FV-1/spn/drolo/reverb.h"
/* 1 7 */ #include "FV-1/spn/firesledge/bass-fv1-p3-reverb.h"
     
/* 2 0 */ #include "FV-1/spn/dervish/dattorro-mixed/dattorro_1oct_pitch-ip+fb-2k.h"
/* 2 1 */ #include "FV-1/spn/dervish/dattorro-mixed/dattorro_1oct_pitch-ip-4k.h"
/* 2 2 */ #include "FV-1/spn/dervish/dattorro-mixed/dattorro_var_pitch-ip+fb-4k.h"
/* 2 3 */ #include "FV-1/spn/dervish/dattorro-mixed/dattorro_var_pitch-ip-4k.h"
/* 2 4 */ #include "FV-1/spn/dervish/dattorro-mixed/dattorro-shimmer_oct_var-lvl.h"
/* 2 5 */ #include "FV-1/spn/dervish/dattorro-mixed/dattorro-var_filter-var_damping.h"
/* 2 6 */ #include "FV-1/spn/dervish/dattorro-mixed/dattorro-var_filter-var_predelay.h"
/* 2 7 */ #include "FV-1/spn/dervish/dattorro-mixed/dattorro-var_predelay-var_damping-1k.h"
     
/* 3 0 */ #include "FV-1/spn/dervish/dattorro-mixed/dattorro-var_predelay-var_damping-2k.h"
/* 3 1 */ #include "FV-1/spn/dervish/dattorro-mixed/dattorro-var_predelay-var_damping-4k.h"
/* 3 2 */ #include "FV-1/spn/dervish/dattorro-mixed/dattorro-var_predelay-var_damping-500.h"
/* 3 3 */ #include "FV-1/spn/dervish/dattorro-mixed/dattorro-var_predelay-var_damping-8k.h"
/* 3 4 */ #include "FV-1/spn/dervish/dattorro-shimmer/dattorro-shimmer_val_pitch.h"
/* 3 5 */ #include "FV-1/spn/dervish/dattorro-shimmer/dattorro-shimmer_val-lvl.h"
/* 3 6 */ #include "FV-1/spn/dervish/dattorro-var_predelay.h"
/* 3 7 */ #include "FV-1/spn/dervish/drv103/dv103-1head-pp-2_1.h"
     
/* 4 0 */ #include "FV-1/spn/dervish/drv103/dv103-1head-pp-2_1-4xreverb.h"
/* 4 1 */ #include "FV-1/spn/dervish/drv103/dv103-2head-2_1-reverb.h"
/* 4 2 */ #include "FV-1/spn/dervish/triple/tripple_echo_cascaded.h"
/* 4 3 */ #include "FV-1/spn/dervish/triple/tripple_echo_cascaded_stereo.h"
/* 4 4 */ #include "FV-1/spn/dervish/triple/tripple_echo_cascaded_stereo+chorus.h"
/* 4 5 */ #include "FV-1/spn/dervish/triple/tripple_echo_parallel.h"
/* 4 6 */ #include "FV-1/spn/dervish/triple/tripple_echo-var_fb.h"
/* 4 7 */ #include "FV-1/spn/dervish/triple/tripple_echo-var_fb+chorus.h"
     
/* 5 0 */ #include "FV-1/spn/holy-city-audio/percussion-ambience.h"
/* 5 1 */ #include "FV-1/spn/holy-city-audio/room-reverb-3-4-5.h"
/* 5 2 */ #include "FV-1/spn/holy-city-audio/shimmer.h"
/* 5 3 */ #include "FV-1/spn/holy-city-audio/shimmer.h"		// double
/* 5 4 */ #include "FV-1/spn/rev_pl_1.h"
/* 5 5 */ #include "FV-1/spn/rev_pl_2.h"
/* 5 6 */ #include "FV-1/spn/rev_pl_3.h"
/* 5 7 */ #include "FV-1/spn/spinsemi/3K_V1_0_Hall.h"
     
/* 6 0 */ #include "FV-1/spn/spinsemi/3K_V1_1_Room.h"
/* 6 1 */ #include "FV-1/spn/spinsemi/3K_V1_2_PLATE.h"
/* 6 2 */ #include "FV-1/spn/spinsemi/3K_V1_3_GATED.h"
/* 6 3 */ #include "FV-1/spn/spinsemi/key_rev.h"
/* 6 4 */ #include "FV-1/spn/spinsemi/min_rev1.h"
/* 6 5 */ #include "FV-1/spn/spinsemi/rev_rt_d_f.h"
/* 6 6 */ #include "FV-1/spn/spring_verb.h"
/* 6 7 */ #include "FV-1/spn/triple-delay-feedback.h"
     
/* 7 0 */ #include "FV-1/spn/chorus-dual-rate.h"
/* 7 1 */ #include "FV-1/spn/softclipping_overdrive.h"
/* 7 2 */ #include "FV-1/spn/dervish/drv102/dv102-1head-reverb.h"
/* 7 3 */ #include "FV-1/spn/dervish/drv102/dv102-2head-reverb.h"
/* 7 4 */ #include "FV-1/spn/dervish/drv102/dv102-pp-1head-reverb.h"
/* 7 5 */ #include "FV-1/spn/dervish/drv102/dv102-pp-2head-reverb.h"
/* 7 6 */ #include "FV-1/spn/dervish/drv103/dv103-1head-4xreverb.h"
/* 7 7 */ #include "FV-1/spn/dervish/looper/looper-pingpong-fb.h"
};
