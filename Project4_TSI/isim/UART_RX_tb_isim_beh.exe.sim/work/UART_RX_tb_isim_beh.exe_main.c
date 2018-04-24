/**********************************************************************/
/*   ____  ____                                                       */
/*  /   /\/   /                                                       */
/* /___/  \  /                                                        */
/* \   \   \/                                                       */
/*  \   \        Copyright (c) 2003-2009 Xilinx, Inc.                */
/*  /   /          All Right Reserved.                                 */
/* /---/   /\                                                         */
/* \   \  /  \                                                      */
/*  \___\/\___\                                                    */
/***********************************************************************/

#include "xsi.h"

struct XSI_INFO xsi_info;



int main(int argc, char **argv)
{
    xsi_init_design(argc, argv);
    xsi_register_info(&xsi_info);

    xsi_register_min_prec_unit(-12);
    work_m_00000000001390797940_2696792471_init();
    work_m_00000000001428080664_2993616596_init();
    work_m_00000000002633692256_1029109627_init();
    work_m_00000000003492768828_2776210399_init();
    work_m_00000000003333861921_4230982292_init();
    work_m_00000000001817459328_2144479057_init();
    work_m_00000000004134447467_2073120511_init();


    xsi_register_tops("work_m_00000000001817459328_2144479057");
    xsi_register_tops("work_m_00000000004134447467_2073120511");


    return xsi_run_simulation(argc, argv);

}
