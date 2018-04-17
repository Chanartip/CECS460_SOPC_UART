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

/* This file is designed for use with ISim build 0x7708f090 */

#define XSI_HIDE_SYMBOL_SPEC true
#include "xsi.h"
#include <memory.h>
#ifdef __GNUC__
#include <stdlib.h>
#else
#include <malloc.h>
#define alloca _alloca
#endif
static const char *ng0 = "C:/Users/Charles/Desktop/CECS460/CECS460_SOPC_UART/Project3_UART_RX/uart_tx_tb.v";
static const char *ng1 = "";
static const char *ng2 = " ";
static const char *ng3 = "output.txt";
static int ng4[] = {0, 0};
static int ng5[] = {1, 0};
static unsigned int ng6[] = {58U, 0U};
static unsigned int ng7[] = {109U, 0U};
static int ng8[] = {100, 0, 0, 0};
static unsigned int ng9[] = {0U, 0U};



static void Always_59_0(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    char *t13;
    char *t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    char *t24;

LAB0:    t1 = (t0 + 4128U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(59, ng0);
    t2 = (t0 + 3936);
    xsi_process_wait(t2, 5000LL);
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(59, ng0);
    t4 = (t0 + 1608);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    memset(t3, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB8;

LAB6:    if (*((unsigned int *)t7) == 0)
        goto LAB5;

LAB7:    t13 = (t3 + 4);
    *((unsigned int *)t3) = 1;
    *((unsigned int *)t13) = 1;

LAB8:    t14 = (t3 + 4);
    t15 = (t6 + 4);
    t16 = *((unsigned int *)t6);
    t17 = (~(t16));
    *((unsigned int *)t3) = t17;
    *((unsigned int *)t14) = 0;
    if (*((unsigned int *)t15) != 0)
        goto LAB10;

LAB9:    t22 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t22 & 1U);
    t23 = *((unsigned int *)t14);
    *((unsigned int *)t14) = (t23 & 1U);
    t24 = (t0 + 1608);
    xsi_vlogvar_assign_value(t24, t3, 0, 0, 1);
    goto LAB2;

LAB5:    *((unsigned int *)t3) = 1;
    goto LAB8;

LAB10:    t18 = *((unsigned int *)t3);
    t19 = *((unsigned int *)t15);
    *((unsigned int *)t3) = (t18 | t19);
    t20 = *((unsigned int *)t14);
    t21 = *((unsigned int *)t15);
    *((unsigned int *)t14) = (t20 | t21);
    goto LAB9;

}

static void Always_61_1(char *t0)
{
    char t8[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    double t5;
    double t6;
    char *t7;
    char *t9;
    char *t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;

LAB0:    t1 = (t0 + 4376U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(61, ng0);
    t2 = (t0 + 3208);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = xsi_vlog_convert_to_real(t4, 64, 2);
    t5 = (t5 * 1000.0000000000000);
    t6 = (t5 < 0.00000000000000000);
    if (t6 == 1)
        goto LAB4;

LAB5:    t5 = (t5 + 0.50000000000000000);
    t5 = ((int64)(t5));

LAB6:    t5 = (t5 * 1.0000000000000000);
    t7 = (t0 + 4184);
    xsi_process_wait(t7, t5);
    *((char **)t1) = &&LAB7;

LAB1:    return;
LAB4:    t5 = 0.00000000000000000;
    goto LAB6;

LAB7:    xsi_set_current_line(62, ng0);

LAB8:    xsi_set_current_line(63, ng0);
    t9 = (t0 + 3048);
    t10 = (t9 + 56U);
    t11 = *((char **)t10);
    memset(t8, 0, 8);
    t12 = (t11 + 4);
    t13 = *((unsigned int *)t12);
    t14 = (~(t13));
    t15 = *((unsigned int *)t11);
    t16 = (t15 & t14);
    t17 = (t16 & 1U);
    if (t17 != 0)
        goto LAB12;

LAB10:    if (*((unsigned int *)t12) == 0)
        goto LAB9;

LAB11:    t18 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t18) = 1;

LAB12:    t19 = (t0 + 3048);
    xsi_vlogvar_assign_value(t19, t8, 0, 0, 1);
    xsi_set_current_line(64, ng0);
    t2 = (t0 + 2888);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t7 = (t0 + 1048U);
    t9 = *((char **)t7);
    xsi_vlogfile_fwrite(*((unsigned int *)t4), 0, 0, 1, ng1, 2, t0, (char)118, t9, 1);
    xsi_vlogfile_fwrite(*((unsigned int *)t4), 0, 0, 1, ng2, 1, t0);
    goto LAB2;

LAB9:    *((unsigned int *)t8) = 1;
    goto LAB12;

}

static void Initial_67_2(char *t0)
{
    char t3[8];
    char *t1;
    char *t2;
    char *t4;
    char *t5;
    char *t6;

LAB0:    t1 = (t0 + 4624U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(67, ng0);

LAB4:    xsi_set_current_line(69, ng0);
    *((int *)t3) = xsi_vlogfile_file_open_of_cname(ng3);
    t2 = (t3 + 4);
    *((int *)t2) = 0;
    t4 = (t0 + 2888);
    xsi_vlogvar_assign_value(t4, t3, 0, 0, 32);
    xsi_set_current_line(70, ng0);
    t2 = ((char*)((ng4)));
    t4 = (t0 + 3048);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(71, ng0);
    t2 = ((char*)((ng4)));
    t4 = (t0 + 1608);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(72, ng0);
    t2 = ((char*)((ng5)));
    t4 = (t0 + 1768);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(73, ng0);
    t2 = ((char*)((ng4)));
    t4 = (t0 + 1928);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(74, ng0);
    t2 = ((char*)((ng6)));
    t4 = (t0 + 2088);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 8);
    xsi_set_current_line(75, ng0);
    t2 = ((char*)((ng4)));
    t4 = (t0 + 2248);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(76, ng0);
    t2 = ((char*)((ng4)));
    t4 = (t0 + 2408);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(77, ng0);
    t2 = ((char*)((ng4)));
    t4 = (t0 + 2568);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 1);
    xsi_set_current_line(78, ng0);
    t2 = ((char*)((ng7)));
    t4 = (t0 + 2728);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 19);
    xsi_set_current_line(79, ng0);
    t2 = ((char*)((ng8)));
    t4 = (t0 + 3208);
    xsi_vlogvar_assign_value(t4, t2, 0, 0, 64);
    xsi_set_current_line(81, ng0);
    t2 = (t0 + 4432);
    xsi_process_wait(t2, 100000LL);
    *((char **)t1) = &&LAB5;

LAB1:    return;
LAB5:    xsi_set_current_line(82, ng0);
    t4 = ((char*)((ng9)));
    t5 = (t0 + 1768);
    xsi_vlogvar_assign_value(t5, t4, 0, 0, 1);
    xsi_set_current_line(83, ng0);
    t2 = (t0 + 4944);
    *((int *)t2) = 1;
    t4 = (t0 + 4656);
    *((char **)t4) = t2;
    *((char **)t1) = &&LAB6;
    goto LAB1;

LAB6:    xsi_set_current_line(83, ng0);
    t5 = ((char*)((ng5)));
    t6 = (t0 + 1928);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 1);
    xsi_set_current_line(84, ng0);
    t2 = (t0 + 4960);
    *((int *)t2) = 1;
    t4 = (t0 + 4656);
    *((char **)t4) = t2;
    *((char **)t1) = &&LAB7;
    goto LAB1;

LAB7:    xsi_set_current_line(84, ng0);
    t5 = ((char*)((ng4)));
    t6 = (t0 + 1928);
    xsi_vlogvar_assign_value(t6, t5, 0, 0, 1);
    xsi_set_current_line(85, ng0);
    t2 = (t0 + 4432);
    xsi_process_wait(t2, 50000000000LL);
    *((char **)t1) = &&LAB8;
    goto LAB1;

LAB8:    xsi_set_current_line(86, ng0);
    t4 = (t0 + 2888);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);
    xsi_vlogfile_fclose(*((unsigned int *)t6));
    xsi_set_current_line(87, ng0);
    xsi_vlog_finish(1);
    goto LAB1;

}


extern void work_m_00000000000069410307_1778813042_init()
{
	static char *pe[] = {(void *)Always_59_0,(void *)Always_61_1,(void *)Initial_67_2};
	xsi_register_didat("work_m_00000000000069410307_1778813042", "isim/uart_tx_tb_isim_beh.exe.sim/work/m_00000000000069410307_1778813042.didat");
	xsi_register_executes(pe);
}
