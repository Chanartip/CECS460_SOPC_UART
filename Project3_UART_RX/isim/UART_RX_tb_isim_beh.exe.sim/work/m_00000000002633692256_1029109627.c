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
static const char *ng0 = "C:/Users/Charles/Desktop/CECS460/CECS460_SOPC_UART/Project3_UART_RX/RX_REMAP.v";
static unsigned int ng1[] = {0U, 0U};
static unsigned int ng2[] = {3U, 0U};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {2U, 0U};



static void Always_51_0(char *t0)
{
    char t4[8];
    char t9[8];
    char t10[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t11;
    char *t12;
    char *t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    char *t20;
    char *t21;

LAB0:    t1 = (t0 + 2688U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(51, ng0);
    t2 = (t0 + 3008);
    *((int *)t2) = 1;
    t3 = (t0 + 2720);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(51, ng0);

LAB5:    xsi_set_current_line(52, ng0);
    t5 = (t0 + 1208U);
    t6 = *((char **)t5);
    t5 = (t0 + 1048U);
    t7 = *((char **)t5);
    xsi_vlogtype_concat(t4, 2, 2, 2U, t7, 1, t6, 1);

LAB6:    t5 = ((char*)((ng1)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t5, 2);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng3)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng4)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t8 == 1)
        goto LAB11;

LAB12:    t2 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t8 == 1)
        goto LAB13;

LAB14:
LAB15:    goto LAB2;

LAB7:    xsi_set_current_line(53, ng0);
    t11 = (t0 + 1368U);
    t12 = *((char **)t11);
    memset(t10, 0, 8);
    t11 = (t10 + 4);
    t13 = (t12 + 4);
    t14 = *((unsigned int *)t12);
    t15 = (t14 >> 2);
    *((unsigned int *)t10) = t15;
    t16 = *((unsigned int *)t13);
    t17 = (t16 >> 2);
    *((unsigned int *)t11) = t17;
    t18 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t18 & 255U);
    t19 = *((unsigned int *)t11);
    *((unsigned int *)t11) = (t19 & 255U);
    t20 = ((char*)((ng2)));
    xsi_vlogtype_concat(t9, 10, 10, 2U, t20, 2, t10, 8);
    t21 = (t0 + 1768);
    xsi_vlogvar_assign_value(t21, t9, 0, 0, 10);
    goto LAB15;

LAB9:    xsi_set_current_line(54, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    memset(t10, 0, 8);
    t3 = (t10 + 4);
    t6 = (t5 + 4);
    t14 = *((unsigned int *)t5);
    t15 = (t14 >> 1);
    *((unsigned int *)t10) = t15;
    t16 = *((unsigned int *)t6);
    t17 = (t16 >> 1);
    *((unsigned int *)t3) = t17;
    t18 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t18 & 511U);
    t19 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t19 & 511U);
    t7 = ((char*)((ng3)));
    xsi_vlogtype_concat(t9, 10, 10, 2U, t7, 1, t10, 9);
    t11 = (t0 + 1768);
    xsi_vlogvar_assign_value(t11, t9, 0, 0, 10);
    goto LAB15;

LAB11:    xsi_set_current_line(55, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    memset(t10, 0, 8);
    t3 = (t10 + 4);
    t6 = (t5 + 4);
    t14 = *((unsigned int *)t5);
    t15 = (t14 >> 1);
    *((unsigned int *)t10) = t15;
    t16 = *((unsigned int *)t6);
    t17 = (t16 >> 1);
    *((unsigned int *)t3) = t17;
    t18 = *((unsigned int *)t10);
    *((unsigned int *)t10) = (t18 & 511U);
    t19 = *((unsigned int *)t3);
    *((unsigned int *)t3) = (t19 & 511U);
    t7 = ((char*)((ng3)));
    xsi_vlogtype_concat(t9, 10, 10, 2U, t7, 1, t10, 9);
    t11 = (t0 + 1768);
    xsi_vlogvar_assign_value(t11, t9, 0, 0, 10);
    goto LAB15;

LAB13:    xsi_set_current_line(56, ng0);
    t3 = (t0 + 1368U);
    t5 = *((char **)t3);
    t3 = (t0 + 1768);
    xsi_vlogvar_assign_value(t3, t5, 0, 0, 10);
    goto LAB15;

}


extern void work_m_00000000002633692256_1029109627_init()
{
	static char *pe[] = {(void *)Always_51_0};
	xsi_register_didat("work_m_00000000002633692256_1029109627", "isim/UART_RX_tb_isim_beh.exe.sim/work/m_00000000002633692256_1029109627.didat");
	xsi_register_executes(pe);
}
