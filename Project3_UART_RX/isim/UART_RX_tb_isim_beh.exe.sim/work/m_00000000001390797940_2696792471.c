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
static const char *ng0 = "C:/Users/Charles/Desktop/CECS460/CECS460_SOPC_UART/Project3_UART_RX/RX_Control.v";
static int ng1[] = {1, 0};
static unsigned int ng2[] = {0U, 0U};
static unsigned int ng3[] = {1U, 0U};
static unsigned int ng4[] = {9U, 0U};
static unsigned int ng5[] = {10U, 0U};
static unsigned int ng6[] = {2U, 0U};
static unsigned int ng7[] = {3U, 0U};
static unsigned int ng8[] = {11U, 0U};
static unsigned int ng9[] = {7U, 0U};



static void Cont_68_0(char *t0)
{
    char t7[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t8;
    unsigned int t9;
    unsigned int t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    char *t21;
    char *t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    unsigned int t27;
    unsigned int t28;
    char *t29;
    unsigned int t30;
    unsigned int t31;
    char *t32;
    unsigned int t33;
    unsigned int t34;
    char *t35;

LAB0:    t1 = (t0 + 5496U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(68, ng0);
    t2 = (t0 + 4256);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 2896U);
    t6 = *((char **)t5);
    memset(t7, 0, 8);
    t5 = (t4 + 4);
    t8 = (t6 + 4);
    t9 = *((unsigned int *)t4);
    t10 = *((unsigned int *)t6);
    t11 = (t9 ^ t10);
    t12 = *((unsigned int *)t5);
    t13 = *((unsigned int *)t8);
    t14 = (t12 ^ t13);
    t15 = (t11 | t14);
    t16 = *((unsigned int *)t5);
    t17 = *((unsigned int *)t8);
    t18 = (t16 | t17);
    t19 = (~(t18));
    t20 = (t15 & t19);
    if (t20 != 0)
        goto LAB7;

LAB4:    if (t18 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t7) = 1;

LAB7:    t22 = (t0 + 8008);
    t23 = (t22 + 56U);
    t24 = *((char **)t23);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    memset(t26, 0, 8);
    t27 = 1U;
    t28 = t27;
    t29 = (t7 + 4);
    t30 = *((unsigned int *)t7);
    t27 = (t27 & t30);
    t31 = *((unsigned int *)t29);
    t28 = (t28 & t31);
    t32 = (t26 + 4);
    t33 = *((unsigned int *)t26);
    *((unsigned int *)t26) = (t33 | t27);
    t34 = *((unsigned int *)t32);
    *((unsigned int *)t32) = (t34 | t28);
    xsi_driver_vfirst_trans(t22, 0, 0);
    t35 = (t0 + 7800);
    *((int *)t35) = 1;

LAB1:    return;
LAB6:    t21 = (t7 + 4);
    *((unsigned int *)t7) = 1;
    *((unsigned int *)t21) = 1;
    goto LAB7;

}

static void Cont_69_1(char *t0)
{
    char t3[8];
    char t4[8];
    char t20[8];
    char *t1;
    char *t2;
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
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    unsigned int t21;
    unsigned int t22;
    unsigned int t23;
    unsigned int t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    char *t29;
    char *t30;
    unsigned int t31;
    unsigned int t32;
    char *t33;
    unsigned int t34;
    unsigned int t35;
    char *t36;
    unsigned int t37;
    unsigned int t38;
    char *t39;

LAB0:    t1 = (t0 + 5744U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(69, ng0);
    t2 = (t0 + 3616);
    t5 = (t2 + 56U);
    t6 = *((char **)t5);
    memset(t4, 0, 8);
    t7 = (t6 + 4);
    t8 = *((unsigned int *)t7);
    t9 = (~(t8));
    t10 = *((unsigned int *)t6);
    t11 = (t10 & t9);
    t12 = (t11 & 1U);
    if (t12 != 0)
        goto LAB4;

LAB5:    if (*((unsigned int *)t7) != 0)
        goto LAB6;

LAB7:    t14 = (t4 + 4);
    t15 = *((unsigned int *)t4);
    t16 = *((unsigned int *)t14);
    t17 = (t15 || t16);
    if (t17 > 0)
        goto LAB8;

LAB9:    t21 = *((unsigned int *)t4);
    t22 = (~(t21));
    t23 = *((unsigned int *)t14);
    t24 = (t22 || t23);
    if (t24 > 0)
        goto LAB10;

LAB11:    if (*((unsigned int *)t14) > 0)
        goto LAB12;

LAB13:    if (*((unsigned int *)t4) > 0)
        goto LAB14;

LAB15:    memcpy(t3, t26, 8);

LAB16:    t25 = (t0 + 8072);
    t27 = (t25 + 56U);
    t28 = *((char **)t27);
    t29 = (t28 + 56U);
    t30 = *((char **)t29);
    memset(t30, 0, 8);
    t31 = 524287U;
    t32 = t31;
    t33 = (t3 + 4);
    t34 = *((unsigned int *)t3);
    t31 = (t31 & t34);
    t35 = *((unsigned int *)t33);
    t32 = (t32 & t35);
    t36 = (t30 + 4);
    t37 = *((unsigned int *)t30);
    *((unsigned int *)t30) = (t37 | t31);
    t38 = *((unsigned int *)t36);
    *((unsigned int *)t36) = (t38 | t32);
    xsi_driver_vfirst_trans(t25, 0, 18);
    t39 = (t0 + 7816);
    *((int *)t39) = 1;

LAB1:    return;
LAB4:    *((unsigned int *)t4) = 1;
    goto LAB7;

LAB6:    t13 = (t4 + 4);
    *((unsigned int *)t4) = 1;
    *((unsigned int *)t13) = 1;
    goto LAB7;

LAB8:    t18 = (t0 + 1776U);
    t19 = *((char **)t18);
    t18 = ((char*)((ng1)));
    memset(t20, 0, 8);
    xsi_vlog_unsigned_rshift(t20, 19, t19, 19, t18, 32);
    goto LAB9;

LAB10:    t25 = (t0 + 1776U);
    t26 = *((char **)t25);
    goto LAB11;

LAB12:    xsi_vlog_unsigned_bit_combine(t3, 19, t20, 19, t26, 19);
    goto LAB16;

LAB14:    memcpy(t3, t20, 8);
    goto LAB16;

}

static void Always_71_2(char *t0)
{
    char t15[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t16;

LAB0:    t1 = (t0 + 5992U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(71, ng0);
    t2 = (t0 + 7832);
    *((int *)t2) = 1;
    t3 = (t0 + 6024);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(72, ng0);
    t4 = (t0 + 1616U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(73, ng0);
    t2 = (t0 + 2416U);
    t3 = *((char **)t2);
    t2 = (t3 + 4);
    t6 = *((unsigned int *)t2);
    t7 = (~(t6));
    t8 = *((unsigned int *)t3);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB8;

LAB9:    xsi_set_current_line(74, ng0);
    t2 = (t0 + 3296);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB11;

LAB12:    xsi_set_current_line(75, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4256);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 19, 0LL);

LAB13:
LAB10:
LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(72, ng0);
    t11 = ((char*)((ng2)));
    t12 = (t0 + 4256);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 19, 0LL);
    goto LAB7;

LAB8:    xsi_set_current_line(73, ng0);
    t4 = ((char*)((ng2)));
    t5 = (t0 + 4256);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 19, 0LL);
    goto LAB10;

LAB11:    xsi_set_current_line(74, ng0);
    t11 = (t0 + 4256);
    t12 = (t11 + 56U);
    t13 = *((char **)t12);
    t14 = ((char*)((ng3)));
    memset(t15, 0, 8);
    xsi_vlog_unsigned_add(t15, 19, t13, 19, t14, 19);
    t16 = (t0 + 4256);
    xsi_vlogvar_wait_assign_value(t16, t15, 0, 0, 19, 0LL);
    goto LAB13;

}

static void Cont_84_3(char *t0)
{
    char t8[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t9;
    char *t10;
    unsigned int t11;
    unsigned int t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    unsigned int t18;
    unsigned int t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    char *t24;
    char *t25;
    char *t26;
    char *t27;
    char *t28;
    unsigned int t29;
    unsigned int t30;
    char *t31;
    unsigned int t32;
    unsigned int t33;
    char *t34;
    unsigned int t35;
    unsigned int t36;
    char *t37;

LAB0:    t1 = (t0 + 6240U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(84, ng0);
    t2 = (t0 + 4416);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4576);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    memset(t8, 0, 8);
    t9 = (t4 + 4);
    t10 = (t7 + 4);
    t11 = *((unsigned int *)t4);
    t12 = *((unsigned int *)t7);
    t13 = (t11 ^ t12);
    t14 = *((unsigned int *)t9);
    t15 = *((unsigned int *)t10);
    t16 = (t14 ^ t15);
    t17 = (t13 | t16);
    t18 = *((unsigned int *)t9);
    t19 = *((unsigned int *)t10);
    t20 = (t18 | t19);
    t21 = (~(t20));
    t22 = (t17 & t21);
    if (t22 != 0)
        goto LAB7;

LAB4:    if (t20 != 0)
        goto LAB6;

LAB5:    *((unsigned int *)t8) = 1;

LAB7:    t24 = (t0 + 8136);
    t25 = (t24 + 56U);
    t26 = *((char **)t25);
    t27 = (t26 + 56U);
    t28 = *((char **)t27);
    memset(t28, 0, 8);
    t29 = 1U;
    t30 = t29;
    t31 = (t8 + 4);
    t32 = *((unsigned int *)t8);
    t29 = (t29 & t32);
    t33 = *((unsigned int *)t31);
    t30 = (t30 & t33);
    t34 = (t28 + 4);
    t35 = *((unsigned int *)t28);
    *((unsigned int *)t28) = (t35 | t29);
    t36 = *((unsigned int *)t34);
    *((unsigned int *)t34) = (t36 | t30);
    xsi_driver_vfirst_trans(t24, 0, 0);
    t37 = (t0 + 7848);
    *((int *)t37) = 1;

LAB1:    return;
LAB6:    t23 = (t8 + 4);
    *((unsigned int *)t8) = 1;
    *((unsigned int *)t23) = 1;
    goto LAB7;

}

static void Always_86_4(char *t0)
{
    char t22[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    char *t20;
    char *t21;
    char *t23;

LAB0:    t1 = (t0 + 6488U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(86, ng0);
    t2 = (t0 + 7864);
    *((int *)t2) = 1;
    t3 = (t0 + 6520);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(87, ng0);
    t4 = (t0 + 1616U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(88, ng0);
    t2 = (t0 + 3296);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t4 + 4);
    t6 = *((unsigned int *)t5);
    t7 = (~(t6));
    t8 = *((unsigned int *)t4);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB8;

LAB9:    xsi_set_current_line(92, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 4416);
    xsi_vlogvar_wait_assign_value(t3, t2, 0, 0, 4, 0LL);

LAB10:
LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(87, ng0);
    t11 = ((char*)((ng2)));
    t12 = (t0 + 4416);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 4, 0LL);
    goto LAB7;

LAB8:    xsi_set_current_line(88, ng0);

LAB11:    xsi_set_current_line(89, ng0);
    t11 = (t0 + 2416U);
    t12 = *((char **)t11);
    t11 = (t12 + 4);
    t13 = *((unsigned int *)t11);
    t14 = (~(t13));
    t15 = *((unsigned int *)t12);
    t16 = (t15 & t14);
    t17 = (t16 != 0);
    if (t17 > 0)
        goto LAB12;

LAB13:    xsi_set_current_line(90, ng0);
    t2 = (t0 + 4416);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 4416);
    xsi_vlogvar_wait_assign_value(t5, t4, 0, 0, 4, 0LL);

LAB14:    goto LAB10;

LAB12:    xsi_set_current_line(89, ng0);
    t18 = (t0 + 4416);
    t19 = (t18 + 56U);
    t20 = *((char **)t19);
    t21 = ((char*)((ng3)));
    memset(t22, 0, 8);
    xsi_vlog_unsigned_add(t22, 4, t20, 4, t21, 4);
    t23 = (t0 + 4416);
    xsi_vlogvar_wait_assign_value(t23, t22, 0, 0, 4, 0LL);
    goto LAB14;

}

static void Always_94_5(char *t0)
{
    char t4[8];
    char *t1;
    char *t2;
    char *t3;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t9;
    char *t10;

LAB0:    t1 = (t0 + 6736U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(94, ng0);
    t2 = (t0 + 7880);
    *((int *)t2) = 1;
    t3 = (t0 + 6768);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(95, ng0);
    t5 = (t0 + 2256U);
    t6 = *((char **)t5);
    t5 = (t0 + 2096U);
    t7 = *((char **)t5);
    xsi_vlogtype_concat(t4, 2, 2, 2U, t7, 1, t6, 1);

LAB5:    t5 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t5, 2);
    if (t8 == 1)
        goto LAB6;

LAB7:    t2 = ((char*)((ng3)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t8 == 1)
        goto LAB8;

LAB9:    t2 = ((char*)((ng6)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t8 == 1)
        goto LAB10;

LAB11:    t2 = ((char*)((ng7)));
    t8 = xsi_vlog_unsigned_case_compare(t4, 2, t2, 2);
    if (t8 == 1)
        goto LAB12;

LAB13:
LAB14:    goto LAB2;

LAB6:    xsi_set_current_line(96, ng0);
    t9 = ((char*)((ng4)));
    t10 = (t0 + 4576);
    xsi_vlogvar_assign_value(t10, t9, 0, 0, 4);
    goto LAB14;

LAB8:    xsi_set_current_line(97, ng0);
    t3 = ((char*)((ng5)));
    t5 = (t0 + 4576);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 4);
    goto LAB14;

LAB10:    xsi_set_current_line(98, ng0);
    t3 = ((char*)((ng5)));
    t5 = (t0 + 4576);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 4);
    goto LAB14;

LAB12:    xsi_set_current_line(99, ng0);
    t3 = ((char*)((ng8)));
    t5 = (t0 + 4576);
    xsi_vlogvar_assign_value(t5, t3, 0, 0, 4);
    goto LAB14;

}

static void Cont_112_6(char *t0)
{
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    char *t8;
    char *t9;
    unsigned int t10;
    unsigned int t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    char *t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;

LAB0:    t1 = (t0 + 6984U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(112, ng0);
    t2 = (t0 + 3616);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 8200);
    t6 = (t5 + 56U);
    t7 = *((char **)t6);
    t8 = (t7 + 56U);
    t9 = *((char **)t8);
    memset(t9, 0, 8);
    t10 = 1U;
    t11 = t10;
    t12 = (t4 + 4);
    t13 = *((unsigned int *)t4);
    t10 = (t10 & t13);
    t14 = *((unsigned int *)t12);
    t11 = (t11 & t14);
    t15 = (t9 + 4);
    t16 = *((unsigned int *)t9);
    *((unsigned int *)t9) = (t16 | t10);
    t17 = *((unsigned int *)t15);
    *((unsigned int *)t15) = (t17 | t11);
    xsi_driver_vfirst_trans(t5, 0, 0);
    t18 = (t0 + 7896);
    *((int *)t18) = 1;

LAB1:    return;
}

static void Always_114_7(char *t0)
{
    char t15[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    unsigned int t6;
    unsigned int t7;
    unsigned int t8;
    unsigned int t9;
    unsigned int t10;
    char *t11;
    char *t12;
    char *t13;
    char *t14;
    char *t16;
    char *t17;
    char *t18;
    char *t19;

LAB0:    t1 = (t0 + 7232U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(114, ng0);
    t2 = (t0 + 7912);
    *((int *)t2) = 1;
    t3 = (t0 + 7264);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(115, ng0);
    t4 = (t0 + 1616U);
    t5 = *((char **)t4);
    t4 = (t5 + 4);
    t6 = *((unsigned int *)t4);
    t7 = (~(t6));
    t8 = *((unsigned int *)t5);
    t9 = (t8 & t7);
    t10 = (t9 != 0);
    if (t10 > 0)
        goto LAB5;

LAB6:    xsi_set_current_line(116, ng0);
    t2 = (t0 + 3456);
    t3 = (t2 + 56U);
    t4 = *((char **)t3);
    t5 = (t0 + 3776);
    t11 = (t5 + 56U);
    t12 = *((char **)t11);
    t13 = (t0 + 4096);
    t14 = (t13 + 56U);
    t16 = *((char **)t14);
    xsi_vlogtype_concat(t15, 4, 4, 3U, t16, 2, t12, 1, t4, 1);
    t17 = (t0 + 3296);
    xsi_vlogvar_wait_assign_value(t17, t15, 0, 0, 1, 0LL);
    t18 = (t0 + 3616);
    xsi_vlogvar_wait_assign_value(t18, t15, 1, 0, 1, 0LL);
    t19 = (t0 + 3936);
    xsi_vlogvar_wait_assign_value(t19, t15, 2, 0, 2, 0LL);

LAB7:    goto LAB2;

LAB5:    xsi_set_current_line(115, ng0);
    t11 = ((char*)((ng2)));
    t12 = (t0 + 3296);
    xsi_vlogvar_wait_assign_value(t12, t11, 0, 0, 1, 0LL);
    t13 = (t0 + 3616);
    xsi_vlogvar_wait_assign_value(t13, t11, 1, 0, 1, 0LL);
    t14 = (t0 + 3936);
    xsi_vlogvar_wait_assign_value(t14, t11, 2, 0, 2, 0LL);
    goto LAB7;

}

static void Always_118_8(char *t0)
{
    char t9[8];
    char t10[8];
    char t32[8];
    char t33[8];
    char t34[8];
    char *t1;
    char *t2;
    char *t3;
    char *t4;
    char *t5;
    char *t6;
    char *t7;
    int t8;
    char *t11;
    char *t12;
    unsigned int t13;
    unsigned int t14;
    unsigned int t15;
    unsigned int t16;
    unsigned int t17;
    char *t18;
    char *t19;
    unsigned int t20;
    unsigned int t21;
    unsigned int t22;
    char *t23;
    unsigned int t24;
    unsigned int t25;
    unsigned int t26;
    unsigned int t27;
    char *t28;
    char *t29;
    char *t30;
    char *t31;
    unsigned int t35;
    unsigned int t36;
    unsigned int t37;
    unsigned int t38;
    unsigned int t39;
    unsigned int t40;
    unsigned int t41;
    unsigned int t42;
    unsigned int t43;
    unsigned int t44;
    unsigned int t45;
    unsigned int t46;
    unsigned int t47;
    unsigned int t48;
    unsigned int t49;
    unsigned int t50;
    unsigned int t51;
    char *t52;
    char *t53;
    char *t54;

LAB0:    t1 = (t0 + 7480U);
    t2 = *((char **)t1);
    if (t2 == 0)
        goto LAB2;

LAB3:    goto *t2;

LAB2:    xsi_set_current_line(118, ng0);
    t2 = (t0 + 7928);
    *((int *)t2) = 1;
    t3 = (t0 + 7512);
    *((char **)t3) = t2;
    *((char **)t1) = &&LAB4;

LAB1:    return;
LAB4:    xsi_set_current_line(118, ng0);

LAB5:    xsi_set_current_line(119, ng0);
    t4 = (t0 + 3936);
    t5 = (t4 + 56U);
    t6 = *((char **)t5);

LAB6:    t7 = ((char*)((ng2)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t7, 2);
    if (t8 == 1)
        goto LAB7;

LAB8:    t2 = ((char*)((ng3)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t8 == 1)
        goto LAB9;

LAB10:    t2 = ((char*)((ng6)));
    t8 = xsi_vlog_unsigned_case_compare(t6, 2, t2, 2);
    if (t8 == 1)
        goto LAB11;

LAB12:
LAB14:
LAB13:    xsi_set_current_line(133, ng0);
    t2 = ((char*)((ng2)));
    t3 = (t0 + 3456);
    xsi_vlogvar_assign_value(t3, t2, 0, 0, 1);
    t4 = (t0 + 3776);
    xsi_vlogvar_assign_value(t4, t2, 1, 0, 1);
    t5 = (t0 + 4096);
    xsi_vlogvar_assign_value(t5, t2, 2, 0, 2);

LAB15:    goto LAB2;

LAB7:    xsi_set_current_line(120, ng0);

LAB16:    xsi_set_current_line(121, ng0);
    t11 = (t0 + 1936U);
    t12 = *((char **)t11);
    memset(t10, 0, 8);
    t11 = (t12 + 4);
    t13 = *((unsigned int *)t11);
    t14 = (~(t13));
    t15 = *((unsigned int *)t12);
    t16 = (t15 & t14);
    t17 = (t16 & 1U);
    if (t17 != 0)
        goto LAB17;

LAB18:    if (*((unsigned int *)t11) != 0)
        goto LAB19;

LAB20:    t19 = (t10 + 4);
    t20 = *((unsigned int *)t10);
    t21 = *((unsigned int *)t19);
    t22 = (t20 || t21);
    if (t22 > 0)
        goto LAB21;

LAB22:    t24 = *((unsigned int *)t10);
    t25 = (~(t24));
    t26 = *((unsigned int *)t19);
    t27 = (t25 || t26);
    if (t27 > 0)
        goto LAB23;

LAB24:    if (*((unsigned int *)t19) > 0)
        goto LAB25;

LAB26:    if (*((unsigned int *)t10) > 0)
        goto LAB27;

LAB28:    memcpy(t9, t28, 8);

LAB29:    t29 = (t0 + 3456);
    xsi_vlogvar_assign_value(t29, t9, 0, 0, 1);
    t30 = (t0 + 3776);
    xsi_vlogvar_assign_value(t30, t9, 1, 0, 1);
    t31 = (t0 + 4096);
    xsi_vlogvar_assign_value(t31, t9, 2, 0, 2);
    goto LAB15;

LAB9:    xsi_set_current_line(124, ng0);

LAB30:    xsi_set_current_line(125, ng0);
    t3 = (t0 + 1936U);
    t4 = *((char **)t3);
    memset(t10, 0, 8);
    t3 = (t4 + 4);
    t13 = *((unsigned int *)t3);
    t14 = (~(t13));
    t15 = *((unsigned int *)t4);
    t16 = (t15 & t14);
    t17 = (t16 & 1U);
    if (t17 != 0)
        goto LAB31;

LAB32:    if (*((unsigned int *)t3) != 0)
        goto LAB33;

LAB34:    t7 = (t10 + 4);
    t20 = *((unsigned int *)t10);
    t21 = *((unsigned int *)t7);
    t22 = (t20 || t21);
    if (t22 > 0)
        goto LAB35;

LAB36:    t24 = *((unsigned int *)t10);
    t25 = (~(t24));
    t26 = *((unsigned int *)t7);
    t27 = (t25 || t26);
    if (t27 > 0)
        goto LAB37;

LAB38:    if (*((unsigned int *)t7) > 0)
        goto LAB39;

LAB40:    if (*((unsigned int *)t10) > 0)
        goto LAB41;

LAB42:    memcpy(t9, t32, 8);

LAB43:    t52 = (t0 + 3456);
    xsi_vlogvar_assign_value(t52, t9, 0, 0, 1);
    t53 = (t0 + 3776);
    xsi_vlogvar_assign_value(t53, t9, 1, 0, 1);
    t54 = (t0 + 4096);
    xsi_vlogvar_assign_value(t54, t9, 2, 0, 2);
    goto LAB15;

LAB11:    xsi_set_current_line(129, ng0);

LAB61:    xsi_set_current_line(130, ng0);
    t3 = (t0 + 2576U);
    t4 = *((char **)t3);
    memset(t10, 0, 8);
    t3 = (t4 + 4);
    t13 = *((unsigned int *)t3);
    t14 = (~(t13));
    t15 = *((unsigned int *)t4);
    t16 = (t15 & t14);
    t17 = (t16 & 1U);
    if (t17 != 0)
        goto LAB62;

LAB63:    if (*((unsigned int *)t3) != 0)
        goto LAB64;

LAB65:    t7 = (t10 + 4);
    t20 = *((unsigned int *)t10);
    t21 = *((unsigned int *)t7);
    t22 = (t20 || t21);
    if (t22 > 0)
        goto LAB66;

LAB67:    t24 = *((unsigned int *)t10);
    t25 = (~(t24));
    t26 = *((unsigned int *)t7);
    t27 = (t25 || t26);
    if (t27 > 0)
        goto LAB68;

LAB69:    if (*((unsigned int *)t7) > 0)
        goto LAB70;

LAB71:    if (*((unsigned int *)t10) > 0)
        goto LAB72;

LAB73:    memcpy(t9, t12, 8);

LAB74:    t18 = (t0 + 3456);
    xsi_vlogvar_assign_value(t18, t9, 0, 0, 1);
    t19 = (t0 + 3776);
    xsi_vlogvar_assign_value(t19, t9, 1, 0, 1);
    t23 = (t0 + 4096);
    xsi_vlogvar_assign_value(t23, t9, 2, 0, 2);
    goto LAB15;

LAB17:    *((unsigned int *)t10) = 1;
    goto LAB20;

LAB19:    t18 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t18) = 1;
    goto LAB20;

LAB21:    t23 = ((char*)((ng2)));
    goto LAB22;

LAB23:    t28 = ((char*)((ng9)));
    goto LAB24;

LAB25:    xsi_vlog_unsigned_bit_combine(t9, 4, t23, 4, t28, 4);
    goto LAB29;

LAB27:    memcpy(t9, t23, 8);
    goto LAB29;

LAB31:    *((unsigned int *)t10) = 1;
    goto LAB34;

LAB33:    t5 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t5) = 1;
    goto LAB34;

LAB35:    t11 = ((char*)((ng2)));
    goto LAB36;

LAB37:    t12 = (t0 + 2416U);
    t18 = *((char **)t12);
    memset(t34, 0, 8);
    t12 = (t18 + 4);
    t35 = *((unsigned int *)t12);
    t36 = (~(t35));
    t37 = *((unsigned int *)t18);
    t38 = (t37 & t36);
    t39 = (t38 & 1U);
    if (t39 != 0)
        goto LAB47;

LAB45:    if (*((unsigned int *)t12) == 0)
        goto LAB44;

LAB46:    t19 = (t34 + 4);
    *((unsigned int *)t34) = 1;
    *((unsigned int *)t19) = 1;

LAB47:    memset(t33, 0, 8);
    t23 = (t34 + 4);
    t40 = *((unsigned int *)t23);
    t41 = (~(t40));
    t42 = *((unsigned int *)t34);
    t43 = (t42 & t41);
    t44 = (t43 & 1U);
    if (t44 != 0)
        goto LAB48;

LAB49:    if (*((unsigned int *)t23) != 0)
        goto LAB50;

LAB51:    t29 = (t33 + 4);
    t45 = *((unsigned int *)t33);
    t46 = *((unsigned int *)t29);
    t47 = (t45 || t46);
    if (t47 > 0)
        goto LAB52;

LAB53:    t48 = *((unsigned int *)t33);
    t49 = (~(t48));
    t50 = *((unsigned int *)t29);
    t51 = (t49 || t50);
    if (t51 > 0)
        goto LAB54;

LAB55:    if (*((unsigned int *)t29) > 0)
        goto LAB56;

LAB57:    if (*((unsigned int *)t33) > 0)
        goto LAB58;

LAB59:    memcpy(t32, t31, 8);

LAB60:    goto LAB38;

LAB39:    xsi_vlog_unsigned_bit_combine(t9, 4, t11, 4, t32, 4);
    goto LAB43;

LAB41:    memcpy(t9, t11, 8);
    goto LAB43;

LAB44:    *((unsigned int *)t34) = 1;
    goto LAB47;

LAB48:    *((unsigned int *)t33) = 1;
    goto LAB51;

LAB50:    t28 = (t33 + 4);
    *((unsigned int *)t33) = 1;
    *((unsigned int *)t28) = 1;
    goto LAB51;

LAB52:    t30 = ((char*)((ng9)));
    goto LAB53;

LAB54:    t31 = ((char*)((ng4)));
    goto LAB55;

LAB56:    xsi_vlog_unsigned_bit_combine(t32, 4, t30, 4, t31, 4);
    goto LAB60;

LAB58:    memcpy(t32, t30, 8);
    goto LAB60;

LAB62:    *((unsigned int *)t10) = 1;
    goto LAB65;

LAB64:    t5 = (t10 + 4);
    *((unsigned int *)t10) = 1;
    *((unsigned int *)t5) = 1;
    goto LAB65;

LAB66:    t11 = ((char*)((ng2)));
    goto LAB67;

LAB68:    t12 = ((char*)((ng4)));
    goto LAB69;

LAB70:    xsi_vlog_unsigned_bit_combine(t9, 4, t11, 4, t12, 4);
    goto LAB74;

LAB72:    memcpy(t9, t11, 8);
    goto LAB74;

}


extern void work_m_00000000001390797940_2696792471_init()
{
	static char *pe[] = {(void *)Cont_68_0,(void *)Cont_69_1,(void *)Always_71_2,(void *)Cont_84_3,(void *)Always_86_4,(void *)Always_94_5,(void *)Cont_112_6,(void *)Always_114_7,(void *)Always_118_8};
	xsi_register_didat("work_m_00000000001390797940_2696792471", "isim/UART_RX_tb_isim_beh.exe.sim/work/m_00000000001390797940_2696792471.didat");
	xsi_register_executes(pe);
}
