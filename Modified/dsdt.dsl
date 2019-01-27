DefinitionBlock ("DSDT-Original.aml", "DSDT", 1, "HPQOEM", "84AE    ", 0x00040000)
{
    External (WMID)
    External (AFN4, MethodObj)    // 1 Arguments
    External (WLVD)
    External (AFN7, MethodObj)    // 1 Arguments
    External (ALIB, MethodObj)    // 2 Arguments
    External (MWAK, MethodObj)    // 1 Arguments
    External (MPTS, MethodObj)    // 1 Arguments
    External (\_SB_.AWAK, MethodObj)    // 7 Arguments
    External (\_SB_.APTS, MethodObj)    // 3 Arguments
    External (\_SB_.WMID.ESDT, MethodObj)    // 0 Arguments
    External (\_SB_.WMID.WED1)
    External (\_SB_.WMID.WEI1)
    External (\_SB_.WMID.BRTE)
    External (\_PR_.C007.PPCV)
    External (\_PR_.C006.PPCV)
    External (\_PR_.C005.PPCV)
    External (\_PR_.C004.PPCV)
    External (\_PR_.C003.PPCV)
    External (\_PR_.C002.PPCV)
    External (\_PR_.C001.PPCV)
    External (\_PR_.C000.PPCV)
    External (\_PR_.C000._PPC, IntObj)
    External (\_SB_.TPM2.PTS_, MethodObj)    // 1 Arguments
    External (\_SB_.PCI0.GPP0.VGA_.AFN2, MethodObj)    // 2 Arguments
    OperationRegion (SPRT, SystemIO, 0xB0, 0x02)
    Field (SPRT, ByteAcc, Lock, Preserve)
    {
        SSMP,   8
    }
    OperationRegion (CMS1, SystemIO, 0x72, 0x02)
    Field (CMS1, ByteAcc, NoLock, Preserve)
    {
        CMSI,   8, 
        CMSD,   8
    }
    IndexField (CMSI, CMSD, ByteAcc, NoLock, Preserve)
    {
        Offset (0xF7), 
        HSDC,   8, 
        HSDS,   8, 
        HBUC,   8, 
        HBUS,   8
    }
    Method (CMSW, 2, NotSerialized)
    {
        Store (Arg0, CMSI)
        Store (Arg1, CMSD)
    }
    OperationRegion (DBG0, SystemIO, 0x80, One)
    Field (DBG0, ByteAcc, NoLock, Preserve)
    {
        IO80,   8
    }
    OperationRegion (DBG1, SystemIO, 0x80, 0x02)
    Field (DBG1, WordAcc, NoLock, Preserve)
    {
        P80H,   16
    }
    OperationRegion (ACMS, SystemIO, 0x72, 0x02)
    Field (ACMS, ByteAcc, NoLock, Preserve)
    {
        ACMX,   8, 
        ACMA,   8
    }
    IndexField (ACMX, ACMA, ByteAcc, NoLock, Preserve)
    {
        Offset (0xB9), 
        IMEN,   8
    }
    OperationRegion (PCB0, SystemIO, 0x70, 0x02)
    Field (PCB0, ByteAcc, NoLock, Preserve)
    {
        PCI0,   8, 
        PCD0,   8
    }
    IndexField (PCI0, PCD0, ByteAcc, NoLock, Preserve)
    {
    }
    OperationRegion (PCB1, SystemIO, 0x72, 0x02)
    Field (PCB1, ByteAcc, NoLock, Preserve)
    {
        PCI1,   8, 
        PCD1,   8
    }
    IndexField (PCI1, PCD1, ByteAcc, NoLock, Preserve)
    {
        Offset (0x8C), 
        S3PT,   8, 
        S3CB,   8, 
        S4PT,   8, 
        S4CB,   8, 
        Offset (0xCF), 
        ECSF,   1, 
        Offset (0xF0), 
        LID1,   8, 
        LID2,   8, 
        LID3,   8, 
        Offset (0xFC), 
        CMST,   8, 
        Offset (0xFE), 
        FFAL,   1, 
        THSD,   1, 
        PDPN,   1
    }
    OperationRegion (PSMI, SystemIO, 0xB0, 0x02)
    Field (PSMI, ByteAcc, NoLock, Preserve)
    {
        APMC,   8, 
        APMD,   8
    }
    OperationRegion (PMRG, SystemIO, 0x0CD6, 0x02)
    Field (PMRG, ByteAcc, NoLock, Preserve)
    {
        PMRI,   8, 
        PMRD,   8
    }
    IndexField (PMRI, PMRD, ByteAcc, NoLock, Preserve)
    {
            ,   6, 
        HPEN,   1, 
        Offset (0x60), 
        P1EB,   16, 
        Offset (0xF0), 
            ,   3, 
        RSTU,   1
    }
    OperationRegion (GSMG, SystemMemory, 0xFED81500, 0x03FF)
    Field (GSMG, AnyAcc, NoLock, Preserve)
    {
        Offset (0x24), 
            ,   22, 
        GP09,   1, 
        Offset (0x1E4), 
            ,   22, 
        G121,   1
    }
    OperationRegion (GSMM, SystemMemory, 0xFED80000, 0x1000)
    Field (GSMM, AnyAcc, NoLock, Preserve)
    {
        Offset (0x288), 
            ,   1, 
        CLPS,   1, 
        Offset (0x2B0), 
            ,   2, 
        SLPS,   2, 
        Offset (0x3BB), 
            ,   6, 
        PWDE,   1, 
        Offset (0x3E4), 
        BLNK,   2
    }
    OperationRegion (P1E0, SystemIO, P1EB, 0x04)
    Field (P1E0, ByteAcc, NoLock, Preserve)
    {
            ,   14, 
        PEWS,   1, 
        WSTA,   1, 
            ,   14, 
        PEWD,   1
    }
    OperationRegion (IOCC, SystemIO, 0x0400, 0x80)
    Field (IOCC, ByteAcc, NoLock, Preserve)
    {
        Offset (0x01), 
            ,   2, 
        RTCS,   1
    }
    Name (PRWP, Package (0x02)
    {
        Zero, 
        Zero
    })
    Method (GPRW, 2, NotSerialized)
    {
        Store (Arg0, Index (PRWP, Zero))
        Store (Arg1, Index (PRWP, One))
        If (LEqual (DAS3, Zero))
        {
            If (LLessEqual (Arg1, 0x03))
            {
                Store (Zero, Index (PRWP, One))
            }
        }
        Return (PRWP)
    }
    Method (SPTS, 1, NotSerialized)
    {
        If (LEqual (Arg0, 0x03))
        {
            Store (One, BLNK)
        }
        If (LOr (LEqual (Arg0, 0x04), LEqual (Arg0, 0x05)))
        {
            Store (Zero, BLNK)
        }
        If (LEqual (Arg0, 0x03))
        {
            Store (Zero, RSTU)
        }
        Store (One, CLPS)
        Store (One, SLPS)
        Store (PEWS, PEWS)
    }
    Method (SWAK, 1, NotSerialized)
    {
        Store (0x03, BLNK)
        If (LEqual (Arg0, 0x03))
        {
            Store (One, RSTU)
        }
        Store (PEWS, PEWS)
        Store (One, PWDE)
        Store (Zero, PEWD)
    }
    OperationRegion (GNVS, SystemMemory, 0xBF75CA98, 0x00000186)
    Field (GNVS, AnyAcc, NoLock, Preserve)
    {
        SMIF,   8, 
        PRM0,   8, 
        PRM1,   8, 
        BRTL,   8, 
        TLST,   8, 
        IGDS,   8, 
        LCDA,   16, 
        CSTE,   16, 
        NSTE,   16, 
        CADL,   16, 
        PADL,   16, 
        LIDS,   8, 
        PWRS,   8, 
        BVAL,   32, 
        ADDL,   16, 
        BCMD,   8, 
        SBFN,   8, 
        DID,    32, 
        INFO,   2048, 
        TOML,   8, 
        TOMH,   8, 
        CEBP,   8, 
        C0LS,   8, 
        C1LS,   8, 
        C0HS,   8, 
        C1HS,   8, 
        ROMS,   32, 
        MUXF,   8, 
        PDDN,   8, 
        CNSB,   8, 
        RDHW,   8, 
        DAS3,   8, 
        TNBH,   8, 
        TCP0,   8, 
        TCP1,   8, 
        ATNB,   8, 
        PCP0,   8, 
        PCP1,   8, 
        PWMN,   8, 
        LPTY,   8, 
        M92D,   8, 
        WKPM,   8, 
        ALST,   8, 
        AFUC,   8, 
        EXUS,   8, 
        GV0E,   8, 
        WLSH,   8, 
        TSSS,   8, 
        AOZP,   8, 
        TZFG,   8, 
        BPS0,   8, 
        NAPC,   8, 
        PCBA,   32, 
        PCBL,   32, 
        WLAN,   8, 
        BLTH,   8, 
        GPSS,   8, 
        NFCS,   8, 
        SBTY,   8, 
        BDID,   16, 
        MWTT,   8, 
        ACPM,   8, 
        KBCS,   8, 
        ACEC,   8, 
        MM64,   8, 
        HMB1,   64, 
        HMB2,   64, 
        HMM1,   64, 
        HMM2,   64, 
        HML1,   64, 
        HML2,   64
    }
    OperationRegion (OGNS, SystemMemory, 0xBF75CD18, 0x00000034)
    Field (OGNS, AnyAcc, Lock, Preserve)
    {
        EGPO,   8, 
        BTBE,   8, 
        M2WL,   8, 
        THPN,   8, 
        PBAR,   8, 
        THPD,   8, 
        OG06,   8, 
        OG07,   8, 
        OG08,   8, 
        OG09,   8, 
        OG10,   8, 
        STXE,   8, 
        STX0,   8, 
        STX1,   8, 
        STX2,   8, 
        STX3,   8, 
        STX4,   8, 
        STX5,   8, 
        STX6,   8, 
        STX7,   8, 
        STX8,   8, 
        STX9,   8, 
        WRFE,   8, 
        WRC1,   8, 
        WRC2,   8, 
        WRC3,   8, 
        WRC4,   8, 
        RTXE,   8, 
        RTX1,   8, 
        RTX2,   8, 
        RTX3,   8, 
        RTX4,   8, 
        RTX5,   8, 
        RTX6,   8, 
        RTX7,   8, 
        RTX8,   8, 
        RTX9,   8, 
        RX10,   8, 
        RX11,   8, 
        RX12,   8, 
        RX13,   8, 
        RX14,   8, 
        RX15,   8, 
        RX16,   8, 
        RX17,   8, 
        RX18,   8, 
        RX19,   8, 
        RX20,   8, 
        ECON,   8, 
        OSYS,   16, 
        PSSP,   8
    }
    Method (SCMP, 2, NotSerialized)
    {
        Name (STG1, Buffer (0x50) {})
        Name (STG2, Buffer (0x50) {})
        Store (Arg0, STG1)
        Store (Arg1, STG2)
        If (LNotEqual (SizeOf (Arg0), SizeOf (Arg1)))
        {
            Return (Zero)
        }
        Store (Zero, Local0)
        While (LLess (Local0, SizeOf (Arg0)))
        {
            If (LNotEqual (DerefOf (Index (STG1, Local0)), DerefOf (Index (
                STG2, Local0))))
            {
                Return (Zero)
            }
            Increment (Local0)
        }
        Return (One)
    }
    Name (WNOS, Zero)
    Name (MYOS, Zero)
    Name (HTTS, Zero)
    Name (OSTB, Ones)
    Name (TPOS, Zero)
    Name (LINX, Zero)
    Name (OSSP, Zero)
    Method (SEQL, 2, Serialized)
    {
        Store (SizeOf (Arg0), Local0)
        Store (SizeOf (Arg1), Local1)
        If (LNotEqual (Local0, Local1))
        {
            Return (Zero)
        }
        Name (BUF0, Buffer (Local0) {})
        Store (Arg0, BUF0)
        Name (BUF1, Buffer (Local0) {})
        Store (Arg1, BUF1)
        Store (Zero, Local2)
        While (LLess (Local2, Local0))
        {
            Store (DerefOf (Index (BUF0, Local2)), Local3)
            Store (DerefOf (Index (BUF1, Local2)), Local4)
            If (LNotEqual (Local3, Local4))
            {
                Return (Zero)
            }
            Increment (Local2)
        }
        Return (One)
    }
    Method (OSTP, 0, NotSerialized)
    {
        If (LEqual (OSTB, Ones))
        {
            If (CondRefOf (\_OSI, Local0))
            {
                Store (0x70, OSTB)
                Store (0x70, TPOS)
                Store (0x07DD, OSYS)
                If (_OSI ("Windows 2001"))
                {
                    Store (0x08, OSTB)
                    Store (0x08, TPOS)
                    Store (0x07D1, OSYS)
                }
                If (_OSI ("Windows 2001.1"))
                {
                    Store (0x20, OSTB)
                    Store (0x20, TPOS)
                    Store (0x07D3, OSYS)
                }
                If (_OSI ("Windows 2001 SP1"))
                {
                    Store (0x10, OSTB)
                    Store (0x10, TPOS)
                    Store (0x07D1, OSYS)
                }
                If (_OSI ("Windows 2001 SP2"))
                {
                    Store (0x11, OSTB)
                    Store (0x11, TPOS)
                    Store (0x07D2, OSYS)
                }
                If (_OSI ("Windows 2001 SP3"))
                {
                    Store (0x12, OSTB)
                    Store (0x12, TPOS)
                    Store (0x07D2, OSYS)
                }
                If (_OSI ("Windows 2006"))
                {
                    Store (0x40, OSTB)
                    Store (0x40, TPOS)
                    Store (0x07D6, OSYS)
                }
                If (_OSI ("Windows 2006 SP1"))
                {
                    Store (0x41, OSTB)
                    Store (0x41, TPOS)
                    Store (One, OSSP)
                    Store (0x07D6, OSYS)
                }
                If (_OSI ("Windows 2009"))
                {
                    Store (One, OSSP)
                    Store (0x50, OSTB)
                    Store (0x50, TPOS)
                    Store (0x07D9, OSYS)
                }
                If (_OSI ("Windows 2012"))
                {
                    Store (One, OSSP)
                    Store (0x60, OSTB)
                    Store (0x60, TPOS)
                    Store (0x07DC, OSYS)
                }
                If (_OSI ("Windows 2013"))
                {
                    Store (One, OSSP)
                    Store (0x61, OSTB)
                    Store (0x61, TPOS)
                    Store (0x07DD, OSYS)
                }
                If (_OSI ("Windows 2015"))
                {
                    Store (One, OSSP)
                    Store (0x70, OSTB)
                    Store (0x70, TPOS)
                    Store (0x07DF, OSYS)
                }
                If (_OSI ("Linux"))
                {
                    Store (One, LINX)
                    Store (0x80, OSTB)
                    Store (0x80, TPOS)
                    Store (0x03E8, OSYS)
                }
            }
            Else
            {
                If (CondRefOf (\_OS, Local0))
                {
                    If (SEQL (_OS, "Microsoft Windows"))
                    {
                        Store (One, OSTB)
                        Store (One, TPOS)
                    }
                    Else
                    {
                        If (SEQL (_OS, "Microsoft WindowsME: Millennium Edition"))
                        {
                            Store (0x02, OSTB)
                            Store (0x02, TPOS)
                        }
                        Else
                        {
                            If (SEQL (_OS, "Microsoft Windows NT"))
                            {
                                Store (0x04, OSTB)
                                Store (0x04, TPOS)
                            }
                            Else
                            {
                                Store (Zero, OSTB)
                                Store (Zero, TPOS)
                            }
                        }
                    }
                }
                Else
                {
                    Store (Zero, OSTB)
                    Store (Zero, TPOS)
                }
            }
        }
        Return (OSTB)
    }
    Name (BUFN, Zero)
    Name (MBUF, Buffer (0x1000) {})
    OperationRegion (MDBG, SystemMemory, 0xBF355018, 0x00001004)
    Field (MDBG, AnyAcc, Lock, Preserve)
    {
        MDG0,   32768
    }
    Method (DB2H, 1, Serialized)
    {
        SHOW (Arg0)
        MDGC (0x20)
        Store (MBUF, MDG0)
    }
    Method (DW2H, 1, Serialized)
    {
        Store (Arg0, Local0)
        ShiftRight (Arg0, 0x08, Local1)
        And (Local0, 0xFF, Local0)
        And (Local1, 0xFF, Local1)
        DB2H (Local1)
        Decrement (BUFN)
        DB2H (Local0)
    }
    Method (DD2H, 1, Serialized)
    {
        Store (Arg0, Local0)
        ShiftRight (Arg0, 0x10, Local1)
        And (Local0, 0xFFFF, Local0)
        And (Local1, 0xFFFF, Local1)
        DW2H (Local1)
        Decrement (BUFN)
        DW2H (Local0)
    }
    Method (MBGS, 1, Serialized)
    {
        Store (SizeOf (Arg0), Local0)
        Name (BUFS, Buffer (Local0) {})
        Store (Arg0, BUFS)
        MDGC (0x20)
        While (Local0)
        {
            MDGC (DerefOf (Index (BUFS, Subtract (SizeOf (Arg0), Local0))))
            Decrement (Local0)
        }
        Store (MBUF, MDG0)
    }
    Method (SHOW, 1, Serialized)
    {
        MDGC (NTOC (ShiftRight (Arg0, 0x04)))
        MDGC (NTOC (Arg0))
    }
    Method (LINE, 0, Serialized)
    {
        Store (BUFN, Local0)
        And (Local0, 0x0F, Local0)
        While (Local0)
        {
            MDGC (Zero)
            Increment (Local0)
            And (Local0, 0x0F, Local0)
        }
    }
    Method (MDGC, 1, Serialized)
    {
        Store (Arg0, Index (MBUF, BUFN))
        Add (BUFN, One, BUFN)
        If (LGreater (BUFN, 0x0FFF))
        {
            And (BUFN, 0x0FFF, BUFN)
            UP_L (One)
        }
    }
    Method (UP_L, 1, Serialized)
    {
        Store (Arg0, Local2)
        ShiftLeft (Local2, 0x04, Local2)
        MOVE (Local2)
        Subtract (0x1000, Local2, Local3)
        While (Local2)
        {
            Store (Zero, Index (MBUF, Local3))
            Increment (Local3)
            Decrement (Local2)
        }
    }
    Method (MOVE, 1, Serialized)
    {
        Store (Arg0, Local4)
        Store (Zero, BUFN)
        Subtract (0x1000, Local4, Local5)
        While (Local5)
        {
            Decrement (Local5)
            Store (DerefOf (Index (MBUF, Local4)), Index (MBUF, BUFN))
            Increment (BUFN)
            Increment (Local4)
        }
    }
    Method (NTOC, 1, Serialized)
    {
        And (Arg0, 0x0F, Local0)
        If (LLess (Local0, 0x0A))
        {
            Add (Local0, 0x30, Local0)
        }
        Else
        {
            Add (Local0, 0x37, Local0)
        }
        Return (Local0)
    }
    Scope (_PR)
    {
        Processor (C000, 0x00, 0x00000410, 0x06)
        {
        }
        Processor (C001, 0x01, 0x00000410, 0x06)
        {
        }
        Processor (C002, 0x02, 0x00000410, 0x06)
        {
        }
        Processor (C003, 0x03, 0x00000410, 0x06)
        {
        }
        Processor (C004, 0x04, 0x00000410, 0x06)
        {
        }
        Processor (C005, 0x05, 0x00000410, 0x06)
        {
        }
        Processor (C006, 0x06, 0x00000410, 0x06)
        {
        }
        Processor (C007, 0x07, 0x00000410, 0x06)
        {
        }
    }
    Name (_S0, Package (0x04)
    {
        Zero, 
        Zero, 
        Zero, 
        Zero
    })
    If (LEqual (DAS3, One))
    {
        Name (_S3, Package (0x04)
        {
            0x03, 
            0x03, 
            Zero, 
            Zero
        })
    }
    Name (_S4, Package (0x04)
    {
        0x04, 
        0x04, 
        Zero, 
        Zero
    })
    Name (_S5, Package (0x04)
    {
        0x05, 
        0x05, 
        Zero, 
        Zero
    })
    Scope (_GPE)
    {
        Method (_L08, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.GPP0, 0x02)
            Notify (\_SB.PCI0.GPP1, 0x02)
            Notify (\_SB.PCI0.GPP2, 0x02)
            Notify (\_SB.PCI0.GPP3, 0x02)
            Notify (\_SB.PCI0.GPP4, 0x02)
            Notify (\_SB.PCI0.GPP5, 0x02)
            Notify (\_SB.PCI0.GPP6, 0x02)
            Notify (\_SB.PCI0.GP17, 0x02)
            Notify (\_SB.PCI0.GP18, 0x02)
            Notify (\_SB.PWRB, 0x02)
        }
        Method (_L19, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.GP17.XHC0, 0x02)
            Notify (\_SB.PCI0.GP17.XHC1, 0x02)
            Notify (\_SB.PWRB, 0x02)
        }
    }
    Name (PICM, Zero)
    Name (GPIC, Zero)
    Method (_PIC, 1, NotSerialized)
    {
        Store (Arg0, PICM)
        Store (Arg0, GPIC)
        If (PICM)
        {
            \_SB.DSPI ()
            If (NAPC)
            {
                \_SB.PCI0.NAPE ()
            }
        }
    }
    Method (_PTS, 1, NotSerialized)
    {
        SPTS (Arg0)
        If (LEqual (\_SB.PCI0.GPP1.XPDV.LANS, One))
        {
            Store (One, \_SB.PCI0.LPC0.EC0.LWAK)
        }
        Else
        {
            Store (Zero, \_SB.PCI0.LPC0.EC0.LWAK)
        }
        Store (0xFF, LID1)
        Store (0xFF, LID2)
        Store (0xFF, LID3)
        If (LEqual (Arg0, One))
        {
            \_SB.S80H (0x51)
        }
        If (LEqual (Arg0, 0x03))
        {
            \_SB.S80H (0x53)
            Store (One, SLPS)
            Store (One, \_SB.PCI0.LPC0.EC0.S3ST)
            Store (One, \_SB.PCI0.LPC0.EC0.UWAK)
        }
        If (LEqual (Arg0, 0x04))
        {
            \_SB.S80H (0x54)
            Store (One, SLPS)
            Store (One, RSTU)
            Store (One, \_SB.PCI0.LPC0.EC0.S4ST)
        }
        If (LEqual (Arg0, 0x05))
        {
            \_SB.S80H (0x55)
            Store (0x90, BCMD)
            \_SB.BSMI (Zero)
            \_SB.GSMI (0x03)
            Store (One, \_SB.PCI0.LPC0.EC0.S5ST)
        }
        If (CondRefOf (\_SB.TPM2.PTS))
        {
            \_SB.TPM2.PTS (Arg0)
        }
        \_SB.APTS (Arg0, MPTS (Arg0))
    }
    OperationRegion (ECMP, SystemMemory, 0xFE0B0000, 0x1000)
    Field (ECMP, AnyAcc, Lock, Preserve)
    {
        Offset (0x800), 
        REC1,   8, 
        REC2,   8, 
        WEC1,   8, 
        WEC2,   8, 
        WMIM,   8, 
        ACKM,   1, 
        Offset (0x806), 
        STMS,   2, 
        MBMS,   2, 
        ACLS,   1, 
        MBSS,   1, 
        CSHE,   1, 
        ACSP,   1, 
        PSAC,   1, 
        PSBC,   1, 
        PSED,   1, 
        Offset (0x808), 
        PSPD,   8, 
        BCPD,   8, 
        BSTH,   8, 
        PRDT,   8, 
        PSSE,   8, 
        CPTP,   8, 
        SAID,   8, 
        FANE,   1, 
        CPUO,   1, 
        M4GO,   1, 
        FNSW,   1, 
        SBTC,   1, 
            ,   2, 
        OHP0,   1, 
        IBCL,   8, 
        FRPM,   8, 
        FNMX,   8, 
        FNMN,   8, 
        FWPM,   8, 
        RSTV,   8, 
        CPTV,   8, 
        GPTV,   8, 
        PHTV,   8, 
        FNTV,   8, 
        BTTV,   8, 
        HDTV,   8, 
            ,   3, 
        SK6U,   1, 
            ,   2, 
        FNHK,   1, 
        Offset (0x81D), 
        Offset (0x821), 
        BTNO,   8, 
        Offset (0x823), 
        DTCL,   3, 
        Offset (0x825), 
        CFBE,   1, 
        EPCF,   1, 
        Offset (0x82A), 
        PBSM,   2, 
        SBSM,   2, 
        Offset (0x82B), 
        Offset (0x82D), 
        BCTL,   128, 
        Offset (0x84D), 
        PENS,   120, 
        WACL,   1, 
        AADT,   1, 
        Offset (0x85D), 
        ENSI,   8, 
        ENSB,   8, 
        ENSD,   8, 
        SMBP,   8, 
        SMBS,   5, 
            ,   1, 
        SMAL,   1, 
        SMDN,   1, 
        SMAR,   8, 
        SMCD,   8, 
        SMDA,   256, 
        SMBC,   8, 
        SALA,   8, 
        SAD0,   8, 
        SAD1,   8, 
        Offset (0x8AE), 
        CPTR,   8, 
        Offset (0x8B4), 
        GPTP,   8, 
        PHTP,   8, 
        Offset (0x8C1), 
        GBIS,   2, 
        Offset (0x8D7), 
        BTTP,   8, 
        Offset (0x8F2), 
            ,   5, 
        SBIS,   1, 
        Offset (0xAC3), 
            ,   3, 
        GBTC,   1, 
        Offset (0xBB0), 
        Offset (0xBBC), 
        CPUT,   8, 
        Offset (0xBC0), 
        Offset (0xBC2), 
        PRTM,   16, 
        Offset (0xD82), 
        ECPC,   1, 
        ECST,   1, 
        Offset (0xD8B), 
        ECMB,   8, 
        EDTB,   8, 
        Offset (0xD8E)
    }
    OperationRegion (ECMM, SystemMemory, 0xFE0B0000, 0x1000)
    Field (ECMM, AnyAcc, Lock, Preserve)
    {
        Offset (0x800), 
        Offset (0x827), 
        DGPW,   1, 
        Offset (0x82C), 
        IASF,   8, 
        Offset (0x845), 
        ATTE,   16, 
        RTTE,   16, 
        BTDC,   64, 
        MXER,   8, 
        ATTF,   16, 
        BTVI,   16, 
        IIWT,   16, 
        IIST,   16, 
        AASD,   8, 
        Offset (0x890), 
        BMFN,   72, 
        BATD,   56, 
        AATL,   1, 
        AACL,   1, 
        AAST,   1, 
        AARW,   1, 
        AAEN,   1, 
            ,   1, 
        WKRN,   1, 
        Offset (0x8A1), 
            ,   1, 
        VIDO,   1, 
        TOUP,   1, 
        Offset (0x8A2), 
        ODTS,   8, 
        OSTY,   4, 
            ,   2, 
        ECRD,   1, 
        ADPT,   1, 
        PWAK,   1, 
        MDWK,   1, 
        LWAK,   1, 
        RWAK,   1, 
        WWAK,   1, 
        UWAK,   1, 
        KWAK,   1, 
        TPWK,   1, 
        CCAC,   1, 
        AOAC,   1, 
        BLAC,   1, 
        PSRC,   1, 
        BOAC,   1, 
        LCAC,   1, 
        AAAC,   1, 
        ACAC,   1, 
        S3ST,   1, 
        S3RM,   1, 
        S4ST,   1, 
        S4RM,   1, 
        S5ST,   1, 
        S5RM,   1, 
        CSST,   1, 
        CSRM,   1, 
        OSTT,   8, 
        OSST,   8, 
        THLT,   8, 
        TCNL,   8, 
        MODE,   1, 
            ,   2, 
        INIT,   1, 
        FAN1,   1, 
        FAN2,   1, 
        FANT,   1, 
        SKNM,   1, 
        SDTM,   8, 
        FSSN,   4, 
        FANU,   4, 
        PCVL,   6, 
        SWTO,   1, 
        TTHR,   1, 
        TTHM,   1, 
        THTL,   1, 
        CTDP,   1, 
        NPST,   5, 
        CTMP,   8, 
        CTML,   8, 
        SKTA,   8, 
        SKTB,   8, 
        SKTC,   8, 
        Offset (0x8B6), 
        NTMP,   8, 
        APLE,   1, 
            ,   1, 
            ,   1, 
            ,   1, 
        CTHL,   4, 
            ,   1, 
        LIDF,   1, 
        PMEE,   1, 
        PWBE,   1, 
        RNGE,   1, 
        BTWE,   1, 
        Offset (0x8B9), 
        BRTS,   8, 
        S35M,   1, 
        S35S,   1, 
            ,   2, 
        FFEN,   1, 
        FFST,   1, 
        Offset (0x8BB), 
        WLAT,   1, 
        BTAT,   1, 
        WLEX,   1, 
        BTEX,   1, 
        KLSW,   1, 
        WLOK,   1, 
        AT3G,   1, 
        EX3G,   1, 
        PJID,   8, 
        CPUJ,   3, 
        CPNM,   3, 
        GATY,   2, 
        BOL0,   1, 
        BOL1,   1, 
            ,   2, 
        BCC0,   1, 
        BCC1,   1, 
        Offset (0x8BF), 
        BPU0,   1, 
        BPU1,   1, 
            ,   2, 
        BOS0,   1, 
        BOS1,   1, 
        Offset (0x8C0), 
        BTY0,   1, 
        BAM0,   1, 
        BAL0,   1, 
            ,   1, 
        BMF0,   4, 
        BST0,   8, 
        BRC0,   16, 
        BSN0,   16, 
        BPV0,   16, 
        BDV0,   16, 
        BDC0,   16, 
        BFC0,   16, 
        GAU0,   8, 
        CYC0,   8, 
        BPC0,   16, 
        BAC0,   16, 
        BTW0,   8, 
        BVL0,   8, 
        BTM0,   8, 
        BAT0,   8, 
        BCG0,   16, 
        BCT0,   8, 
        BCI0,   8, 
        BCM0,   8, 
        BOT0,   8, 
        BSSB,   16, 
        BOV0,   8, 
        BCF0,   8, 
        BAD0,   8, 
        BCV1,   16, 
        BCV2,   16, 
        BCV3,   16, 
        BCV4,   16, 
        Offset (0x8ED), 
        BFCB,   16, 
        Offset (0x8F1), 
            ,   6, 
        ORRF,   1, 
        Offset (0x8F4), 
        BMD0,   16, 
        BACV,   16, 
        BDN0,   8, 
        BTPP,   16, 
        Offset (0x8FC)
    }
    OperationRegion (ERAM, EmbeddedControl, Zero, 0xFF)
    Field (ERAM, ByteAcc, Lock, Preserve)
    {
        Offset (0x01), 
        Offset (0x02), 
        Offset (0x03), 
        ENIB,   16, 
        ENDD,   8, 
        Offset (0x60), 
        SMPR,   8, 
        SMST,   8, 
        SMAD,   8, 
        SMCM,   8, 
        SMD0,   256, 
        BCNT,   8, 
        SMAA,   24, 
        SMBN,   8, 
        Offset (0x8A)
    }
    OperationRegion (ECPR, EmbeddedControl, Zero, 0xFF)
    Field (ECPR, ByteAcc, Lock, Preserve)
    {
        Offset (0x06), 
            ,   4, 
        GSPN,   1, 
        Offset (0x0E), 
        SADP,   8, 
        Offset (0x10), 
        SAD2,   8, 
        Offset (0x1C), 
        CPBC,   8, 
        Offset (0x2A), 
            ,   6, 
        BMNC,   1, 
        BCLC,   1, 
        Offset (0x2D), 
        Offset (0x5A), 
        BMN9,   16, 
        Offset (0x64), 
        SMDR,   8, 
        Offset (0x90), 
        BMNN,   72, 
        BDVN,   56, 
        Offset (0xEB), 
        MUAC,   16, 
        Offset (0xF1), 
            ,   6, 
        OSRF,   1
    }
    Method (_WAK, 1, NotSerialized)
    {
        SWAK (Arg0)
        \_SB.AWAK (Arg0)
        If (LOr (LEqual (Arg0, 0x03), LEqual (Arg0, 0x04)))
            {
                If (LNotEqual (GPIC, Zero))
                {
                    \_SB.DSPI ()
                    If (NAPC)
                    {
                        \_SB.PCI0.NAPE ()
                    }
                }
            } If (LEqual (Arg0, 0x03))
            {
                \_SB.S80H (0xE3)
                Notify (\_SB.LID, 0x80)
                Store (One, \_SB.PCI0.LPC0.EC0.S3RM)
                Store (Zero, \_SB.PCI0.LPC0.EC0.UWAK)
            } If (LEqual (Arg0, 0x04))
            {
                \_SB.S80H (0xE4)
                Notify (\_SB.LID, 0x80)
                Store (One, \_SB.PCI0.LPC0.EC0.S4RM)
            } If (LEqual (Arg0, 0x05))
            {
                Notify (\_SB.LID, 0x80)
                Store (One, \_SB.PCI0.LPC0.EC0.S5RM)
            } If (LOr (LOr (LEqual (Arg0, 0x03), LEqual (
                    Arg0, 0x04)), LEqual (Arg0, 0x05)))
            {
                Store (Zero, \_SB.PCI0.LPC0.EC0.RWAK)
                Store (One, \_SB.PCI0.LPC0.EC0.ECRD)
                Store (0x03, \_SB.PCI0.LPC0.EC0.NPST)
            } MWAK (Arg0)
        Return (Zero)
    }
    Scope (_SB)
    {
        Device (PWRB)
        {
            Name (_HID, EisaId ("PNP0C0C"))
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0B)
            }
        }
        Device (PCI0)
        {
            Name (_HID, EisaId ("PNP0A08"))
            Name (_CID, EisaId ("PNP0A03"))
            Name (_UID, One)
            Name (_BBN, Zero)
            Name (_ADR, Zero)
            //Method (DPTC, 2, NotSerialized)
            //{
            //    Name (XX11, Buffer (0x07) {})
            //    CreateWordField (XX11, Zero, SSZE)
            //    CreateByteField (XX11, 0x02, SMUF)
            //    CreateDWordField (XX11, 0x03, SMUD)
            //    Store (0x07, SSZE)
            //    Store (0x55, P80H)
            //    Store (Arg0, SMUF)
            //    Store (Arg1, SMUD)
            //    ALIB (0x0C, XX11)
            //}
            //Method (DPTP, 3, NotSerialized)
            //{
            //    Name (XX11, Buffer (0x0B) {})
            //    CreateWordField (XX11, Zero, SSZE)
            //    CreateByteField (XX11, 0x02, SMUF)
            //    CreateDWordField (XX11, 0x03, SMUD)
            //    CreateDWordField (XX11, 0x07, SMU2)
            //    Store (0x0B, SSZE)
            //    Store (0x56, P80H)
            //   Store (Arg0, SMUF)
            //    Store (Arg1, SMUD)
            //    Store (Arg2, SMU2)
            //    ALIB (0x0C, XX11)
            //}
            Method (_INI, 0, NotSerialized)
            {
                //Name (XX11, Buffer (0x07) {})
                //CreateWordField (XX11, Zero, SSZE)
                //CreateByteField (XX11, 0x02, SMUF)
                //CreateDWordField (XX11, 0x03, SMUD)
                //Store (0x07, SSZE)
                //Store (0x05, SMUF)
                //Store (0x61A8, SMUD)
                //ALIB (0x0C, XX11)
                //Store (0x07, SSZE)
                //Store (0x06, SMUF)
                //Store (0x61A8, SMUD)
                //ALIB (0x0C, XX11)
                //Store (0x07, SSZE)
                //Store (0x07, SMUF)
                //Store (0x61A8, SMUD)
                //ALIB (0x0C, XX11)
                //Store (0x07, SSZE)
                //Store (0x03, SMUF)
                //Store (0x55, SMUD)
                //ALIB (0x0C, XX11)
                If (LNotEqual (GPIC, Zero))
                {
                    DSPI ()
                    If (\NAPC)
                    {
                        NAPE ()
                    }
                }
                OSTP ()
            }
            Name (SUPP, Zero)
            Name (CTRL, Zero)
            Method (_OSC, 4, NotSerialized)
            {
                CreateDWordField (Arg3, Zero, CDW1)
                CreateDWordField (Arg3, 0x04, CDW2)
                CreateDWordField (Arg3, 0x08, CDW3)
                If (LEqual (Arg0, Buffer (0x10)
                        {
                            /* 0000 */   0x5B, 0x4D, 0xDB, 0x33, 0xF7, 0x1F, 0x1C, 0x40,
                            /* 0008 */   0x96, 0x57, 0x74, 0x41, 0xC0, 0x3D, 0xD7, 0x66
                        }))
                {
                    Store (CDW2, SUPP)
                    Store (CDW3, CTRL)
                    If (LNotEqual (And (SUPP, 0x16), 0x16))
                    {
                        And (CTRL, 0x1E, CTRL)
                    }
                    And (CTRL, 0x1D, CTRL)
                    If (Not (And (CDW1, One)))
                    {
                        If (And (CTRL, One)) {}
                        If (And (CTRL, 0x04)) {}
                        If (And (CTRL, 0x10)) {}
                    }
                    If (LNotEqual (Arg1, One))
                    {
                        Or (CDW1, 0x08, CDW1)
                    }
                    If (LNotEqual (CDW3, CTRL))
                    {
                        Or (CDW1, 0x10, CDW1)
                    }
                    Store (CTRL, CDW3)
                    Return (Arg3)
                }
                Else
                {
                    Or (CDW1, 0x04, CDW1)
                    Return (Arg3)
                }
            }
            Method (TOM, 0, NotSerialized)
            {
                Multiply (TOML, 0x00010000, Local0)
                Multiply (TOMH, 0x01000000, Local1)
                Add (Local0, Local1, Local0)
                Return (Local0)
            }
            Name (CRES, ResourceTemplate ()
            {
                WordBusNumber (ResourceProducer, MinFixed, MaxFixed, SubDecode,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x00FF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0100,             // Length
                    0x00,, )
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0000,             // Range Minimum
                    0x0CF7,             // Range Maximum
                    0x0000,             // Translation Offset
                    0x0CF8,             // Length
                    0x00,, , TypeStatic)
                WordIO (ResourceProducer, MinFixed, MaxFixed, PosDecode, EntireRange,
                    0x0000,             // Granularity
                    0x0D00,             // Range Minimum
                    0xFFFF,             // Range Maximum
                    0x0000,             // Translation Offset
                    0xF300,             // Length
                    ,, , TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000A0000,         // Range Minimum
                    0x000BFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00020000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,
                    0x00000000,         // Granularity
                    0x000C0000,         // Range Minimum
                    0x000C3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadOnly,
                    0x00000000,         // Granularity
                    0x000C4000,         // Range Minimum
                    0x000C7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadOnly,
                    0x00000000,         // Granularity
                    0x000C8000,         // Range Minimum
                    0x000CBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadOnly,
                    0x00000000,         // Granularity
                    0x000CC000,         // Range Minimum
                    0x000CFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D0000,         // Range Minimum
                    0x000D3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D4000,         // Range Minimum
                    0x000D7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000D8000,         // Range Minimum
                    0x000DBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000DC000,         // Range Minimum
                    0x000DFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E0000,         // Range Minimum
                    0x000E3FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E4000,         // Range Minimum
                    0x000E7FFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000E8000,         // Range Minimum
                    0x000EBFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, Cacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x000EC000,         // Range Minimum
                    0x000EFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x00004000,         // Length
                    0x00,, , AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0x80000000,         // Range Minimum
                    0xF7FFFFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x78000000,         // Length
                    0x00,, _Y00, AddressRangeMemory, TypeStatic)
                DWordMemory (ResourceProducer, SubDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x00000000,         // Granularity
                    0xFC000000,         // Range Minimum
                    0xFED3FFFF,         // Range Maximum
                    0x00000000,         // Translation Offset
                    0x02D40000,         // Length
                    0x00,, _Y01, AddressRangeMemory, TypeStatic)
                IO (Decode16,
                    0x0CF8,             // Range Minimum
                    0x0CF8,             // Range Maximum
                    0x01,               // Alignment
                    0x08,               // Length
                    )
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000000, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000000, // Length
                    ,, _Y02, AddressRangeMemory, TypeStatic)
                QWordMemory (ResourceProducer, PosDecode, MinFixed, MaxFixed, NonCacheable, ReadWrite,
                    0x0000000000000000, // Granularity
                    0x0000000000000000, // Range Minimum
                    0x0000000000000000, // Range Maximum
                    0x0000000000000000, // Translation Offset
                    0x0000000000000000, // Length
                    ,, _Y03, AddressRangeMemory, TypeStatic)
            })
            Method (_CRS, 0, NotSerialized)
            {
                CreateDWordField (CRES, \_SB.PCI0._Y00._MIN, BTMN)
                CreateDWordField (CRES, \_SB.PCI0._Y00._MAX, BTMX)
                CreateDWordField (CRES, \_SB.PCI0._Y00._LEN, BTLN)
                CreateDWordField (CRES, \_SB.PCI0._Y01._MIN, BTN1)
                CreateDWordField (CRES, \_SB.PCI0._Y01._MAX, BTX1)
                CreateDWordField (CRES, \_SB.PCI0._Y01._LEN, BTL1)
                Store (TOM (), BTMN)
                Subtract (PCBA, One, BTMX)
                Subtract (PCBA, BTMN, BTLN)
                Add (PCBL, One, BTN1)
                Subtract (BTX1, BTN1, BTL1)
                Add (BTL1, One, BTL1)
                If (LEqual (MM64, One))
                {
                    CreateQWordField (CRES, \_SB.PCI0._Y02._MIN, M1MN)
                    CreateQWordField (CRES, \_SB.PCI0._Y02._MAX, M1MX)
                    CreateQWordField (CRES, \_SB.PCI0._Y02._LEN, M1LN)
                    Store (HMB1, M1MN)
                    Store (HMM1, M1MX)
                    Store (HML1, M1LN)
                    CreateQWordField (CRES, \_SB.PCI0._Y03._MIN, M2MN)
                    CreateQWordField (CRES, \_SB.PCI0._Y03._MAX, M2MX)
                    CreateQWordField (CRES, \_SB.PCI0._Y03._LEN, M2LN)
                    Store (HMB2, M2MN)
                    Store (HMM2, M2MX)
                    Store (HML2, M2LN)
                }
                Return (CRES)
            }
            Device (MEMR)
            {
                Name (_HID, EisaId ("PNP0C02"))
                Name (BAR3, 0xFD300000)
                Name (MEM1, ResourceTemplate ()
                {
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y04)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y05)
                    Memory32Fixed (ReadWrite,
                        0x00000000,         // Address Base
                        0x00000000,         // Address Length
                        _Y06)
                })
                Method (_CRS, 0, NotSerialized)
                {
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y04._BAS, MB01)
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y04._LEN, ML01)
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y05._BAS, MB02)
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y05._LEN, ML02)
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y06._BAS, MB03)
                    CreateDWordField (MEM1, \_SB.PCI0.MEMR._Y06._LEN, ML03)
                    If (GPIC)
                    {
                        Store (0xFEC00000, MB01)
                        Store (0xFEE00000, MB02)
                        Store (0x1000, ML01)
                        If (\NAPC)
                        {
                            Add (ML01, 0x1000, ML01)
                        }
                        Store (0x1000, ML02)
                    }
                    If (LNotEqual (BAR3, 0xFFF00000))
                    {
                        Store (BAR3, MB03)
                        Store (0x00100000, ML03)
                    }
                    Return (MEM1)
                }
            }
            OperationRegion (NAPC, PCI_Config, 0xB8, 0x08)
            Field (NAPC, DWordAcc, NoLock, Preserve)
            {
                NAPX,   32, 
                NAPD,   32
            }
            Mutex (NAPM, 0x00)
            Method (NAPE, 0, NotSerialized)
            {
                Acquire (NAPM, 0xFFFF)
                Store (0x14300000, NAPX)
                Store (NAPD, Local0)
                And (Local0, 0xFFFFFFEF, Local0)
                Store (Local0, NAPD)
                Release (NAPM)
            }
            Name (PR00, Package (0x0A)
            {
                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 
                Package (0x04)
                {
                    0x0001FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 
                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 
                Package (0x04)
                {
                    0x0001FFFF, 
                    0x03, 
                    LNKD, 
                    Zero
                }, 
                Package (0x04)
                {
                    0x0008FFFF, 
                    Zero, 
                    LNKD, 
                    Zero
                }, 
                Package (0x04)
                {
                    0x0008FFFF, 
                    One, 
                    LNKE, 
                    Zero
                }, 
                Package (0x04)
                {
                    0x0014FFFF, 
                    Zero, 
                    LNKA, 
                    Zero
                }, 
                Package (0x04)
                {
                    0x0014FFFF, 
                    One, 
                    LNKB, 
                    Zero
                }, 
                Package (0x04)
                {
                    0x0014FFFF, 
                    0x02, 
                    LNKC, 
                    Zero
                }, 
                Package (0x04)
                {
                    0x0014FFFF, 
                    0x03, 
                    LNKD, 
                    Zero
                }
            })
            Name (AR00, Package (0x0A)
            {
                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 
                Package (0x04)
                {
                    0x0001FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 
                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 
                Package (0x04)
                {
                    0x0001FFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }, 
                Package (0x04)
                {
                    0x0008FFFF, 
                    Zero, 
                    Zero, 
                    0x13
                }, 
                Package (0x04)
                {
                    0x0008FFFF, 
                    One, 
                    Zero, 
                    0x14
                }, 
                Package (0x04)
                {
                    0x0014FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 
                Package (0x04)
                {
                    0x0014FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 
                Package (0x04)
                {
                    0x0014FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 
                Package (0x04)
                {
                    0x0014FFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }
            })
            Name (NR00, Package (0x0A)
            {
                Package (0x04)
                {
                    0x0001FFFF, 
                    Zero, 
                    Zero, 
                    0x28
                }, 
                Package (0x04)
                {
                    0x0001FFFF, 
                    One, 
                    Zero, 
                    0x29
                }, 
                Package (0x04)
                {
                    0x0001FFFF, 
                    0x02, 
                    Zero, 
                    0x2A
                }, 
                Package (0x04)
                {
                    0x0001FFFF, 
                    0x03, 
                    Zero, 
                    0x2B
                }, 
                Package (0x04)
                {
                    0x0008FFFF, 
                    Zero, 
                    Zero, 
                    0x2B
                }, 
                Package (0x04)
                {
                    0x0008FFFF, 
                    One, 
                    Zero, 
                    0x24
                }, 
                Package (0x04)
                {
                    0x0014FFFF, 
                    Zero, 
                    Zero, 
                    0x10
                }, 
                Package (0x04)
                {
                    0x0014FFFF, 
                    One, 
                    Zero, 
                    0x11
                }, 
                Package (0x04)
                {
                    0x0014FFFF, 
                    0x02, 
                    Zero, 
                    0x12
                }, 
                Package (0x04)
                {
                    0x0014FFFF, 
                    0x03, 
                    Zero, 
                    0x13
                }
            })
            Method (_PRT, 0, NotSerialized)
            {
                If (PICM)
                {
                    If (\NAPC)
                    {
                        Return (NR00)
                    }
                    Else
                    {
                        Return (AR00)
                    }
                }
                Else
                {
                    Return (PR00)
                }
            }
            Device (GPP0)
            {
                Name (_ADR, 0x00010001)
                Method (_PRW, 0, NotSerialized)
                {
                    If (LEqual (WKPM, One))
                    {
                        Return (GPRW (0x08, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }
                Name (PR01, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }
                })
                Name (AR01, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Name (NR01, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x18
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x19
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x1A
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x1B
                    }
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        If (\NAPC)
                        {
                            Return (NR01)
                        }
                        Else
                        {
                            Return (AR01)
                        }
                    }
                    Else
                    {
                        Return (PR01)
                    }
                }
                Device (VGA)
                {
                    Name (_ADR, Zero)
                    Name (DOSA, Zero)
                    Method (_DOS, 1, NotSerialized)
                    {
                        Store (Arg0, DOSA)
                    }
                    Method (_DOD, 0, NotSerialized)
                    {
                        Return (Package (0x05)
                        {
                            0x00010110, 
                            0x00010210, 
                            0x00010220, 
                            0x00010230, 
                            0x00010240
                        })
                    }
                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)
                        Name (BCLB, Package (0x34)
                        {
                            0x5A, 
                            0x3C, 
                            0x02, 
                            0x04, 
                            0x06, 
                            0x08, 
                            0x0A, 
                            0x0C, 
                            0x0E, 
                            0x10, 
                            0x12, 
                            0x14, 
                            0x16, 
                            0x18, 
                            0x1A, 
                            0x1C, 
                            0x1E, 
                            0x20, 
                            0x22, 
                            0x24, 
                            0x26, 
                            0x28, 
                            0x2A, 
                            0x2C, 
                            0x2E, 
                            0x30, 
                            0x32, 
                            0x34, 
                            0x36, 
                            0x38, 
                            0x3A, 
                            0x3C, 
                            0x3E, 
                            0x40, 
                            0x42, 
                            0x44, 
                            0x46, 
                            0x48, 
                            0x4A, 
                            0x4C, 
                            0x4E, 
                            0x50, 
                            0x52, 
                            0x54, 
                            0x56, 
                            0x58, 
                            0x5A, 
                            0x5C, 
                            0x5E, 
                            0x60, 
                            0x62, 
                            0x64
                        })
                        Name (UBBL, Package (0x29)
                        {
                            Package (0x0B)
                            {
                                0x07, 
                                0x0B, 
                                0x0F, 
                                0x14, 
                                0x1D, 
                                0x28, 
                                0x32, 
                                0x3D, 
                                0x45, 
                                0x57, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x07, 
                                0x0B, 
                                0x0F, 
                                0x14, 
                                0x1D, 
                                0x28, 
                                0x32, 
                                0x3D, 
                                0x48, 
                                0x57, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x06, 
                                0x0A, 
                                0x0E, 
                                0x12, 
                                0x19, 
                                0x23, 
                                0x2D, 
                                0x37, 
                                0x3F, 
                                0x4F, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x06, 
                                0x0A, 
                                0x0E, 
                                0x12, 
                                0x19, 
                                0x23, 
                                0x2D, 
                                0x37, 
                                0x40, 
                                0x4F, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x06, 
                                0x0A, 
                                0x0E, 
                                0x12, 
                                0x17, 
                                0x1F, 
                                0x28, 
                                0x30, 
                                0x37, 
                                0x3F, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x05, 
                                0x09, 
                                0x0D, 
                                0x11, 
                                0x16, 
                                0x1F, 
                                0x27, 
                                0x30, 
                                0x36, 
                                0x44, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x06, 
                                0x0A, 
                                0x0E, 
                                0x12, 
                                0x1A, 
                                0x23, 
                                0x2D, 
                                0x35, 
                                0x3E, 
                                0x4E, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x05, 
                                0x09, 
                                0x0D, 
                                0x11, 
                                0x17, 
                                0x20, 
                                0x29, 
                                0x32, 
                                0x38, 
                                0x47, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x05, 
                                0x09, 
                                0x0D, 
                                0x12, 
                                0x1A, 
                                0x24, 
                                0x2E, 
                                0x37, 
                                0x40, 
                                0x4F, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x06, 
                                0x0A, 
                                0x0E, 
                                0x13, 
                                0x1A, 
                                0x24, 
                                0x2E, 
                                0x39, 
                                0x43, 
                                0x52, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x06, 
                                0x0A, 
                                0x0E, 
                                0x13, 
                                0x1A, 
                                0x24, 
                                0x2E, 
                                0x39, 
                                0x43, 
                                0x52, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x06, 
                                0x0A, 
                                0x0E, 
                                0x12, 
                                0x1A, 
                                0x22, 
                                0x2D, 
                                0x37, 
                                0x3D, 
                                0x4D, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x05, 
                                0x09, 
                                0x0D, 
                                0x11, 
                                0x17, 
                                0x1F, 
                                0x28, 
                                0x30, 
                                0x37, 
                                0x45, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x07, 
                                0x0B, 
                                0x0F, 
                                0x13, 
                                0x1B, 
                                0x25, 
                                0x2F, 
                                0x3A, 
                                0x44, 
                                0x53, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x06, 
                                0x0A, 
                                0x0E, 
                                0x12, 
                                0x17, 
                                0x1F, 
                                0x27, 
                                0x2F, 
                                0x37, 
                                0x3F, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x06, 
                                0x0A, 
                                0x0E, 
                                0x12, 
                                0x19, 
                                0x23, 
                                0x2D, 
                                0x37, 
                                0x3F, 
                                0x4C, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x05, 
                                0x0A, 
                                0x0C, 
                                0x11, 
                                0x18, 
                                0x21, 
                                0x2A, 
                                0x33, 
                                0x3C, 
                                0x48, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x06, 
                                0x08, 
                                0x0B, 
                                0x10, 
                                0x17, 
                                0x20, 
                                0x29, 
                                0x31, 
                                0x3A, 
                                0x46, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x05, 
                                0x07, 
                                0x0A, 
                                0x0E, 
                                0x15, 
                                0x1D, 
                                0x25, 
                                0x2D, 
                                0x35, 
                                0x41, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x08, 
                                0x0C, 
                                0x10, 
                                0x14, 
                                0x1D, 
                                0x29, 
                                0x34, 
                                0x3F, 
                                0x4B, 
                                0x5B, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x04, 
                                0x06, 
                                0x09, 
                                0x0D, 
                                0x13, 
                                0x1A, 
                                0x21, 
                                0x28, 
                                0x2F, 
                                0x3A, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x07, 
                                0x0B, 
                                0x0F, 
                                0x13, 
                                0x1A, 
                                0x23, 
                                0x2D, 
                                0x36, 
                                0x41, 
                                0x4F, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x06, 
                                0x08, 
                                0x0C, 
                                0x11, 
                                0x18, 
                                0x21, 
                                0x2A, 
                                0x33, 
                                0x3C, 
                                0x48, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x07, 
                                0x0B, 
                                0x0F, 
                                0x13, 
                                0x19, 
                                0x23, 
                                0x2C, 
                                0x36, 
                                0x3F, 
                                0x4D, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x08, 
                                0x0C, 
                                0x10, 
                                0x14, 
                                0x1D, 
                                0x27, 
                                0x31, 
                                0x3C, 
                                0x46, 
                                0x55, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x06, 
                                0x0A, 
                                0x0E, 
                                0x12, 
                                0x17, 
                                0x20, 
                                0x29, 
                                0x31, 
                                0x39, 
                                0x48, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x05, 
                                0x09, 
                                0x0D, 
                                0x12, 
                                0x1A, 
                                0x24, 
                                0x2E, 
                                0x37, 
                                0x41, 
                                0x4F, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x06, 
                                0x0A, 
                                0x0E, 
                                0x12, 
                                0x17, 
                                0x1F, 
                                0x28, 
                                0x30, 
                                0x39, 
                                0x3F, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x07, 
                                0x0B, 
                                0x0F, 
                                0x13, 
                                0x1B, 
                                0x26, 
                                0x30, 
                                0x3A, 
                                0x44, 
                                0x53, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x06, 
                                0x0A, 
                                0x0E, 
                                0x12, 
                                0x1A, 
                                0x23, 
                                0x2D, 
                                0x37, 
                                0x41, 
                                0x4E, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x07, 
                                0x0B, 
                                0x0F, 
                                0x13, 
                                0x1B, 
                                0x25, 
                                0x2F, 
                                0x39, 
                                0x43, 
                                0x52, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x06, 
                                0x0A, 
                                0x0E, 
                                0x13, 
                                0x19, 
                                0x23, 
                                0x2C, 
                                0x36, 
                                0x40, 
                                0x4E, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x07, 
                                0x0B, 
                                0x0F, 
                                0x13, 
                                0x1A, 
                                0x23, 
                                0x2D, 
                                0x36, 
                                0x41, 
                                0x4F, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x06, 
                                0x0A, 
                                0x0E, 
                                0x12, 
                                0x17, 
                                0x20, 
                                0x2A, 
                                0x33, 
                                0x3C, 
                                0x49, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x06, 
                                0x0A, 
                                0x0E, 
                                0x12, 
                                0x1A, 
                                0x23, 
                                0x2D, 
                                0x36, 
                                0x40, 
                                0x4E, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x07, 
                                0x0B, 
                                0x0F, 
                                0x13, 
                                0x19, 
                                0x24, 
                                0x2E, 
                                0x37, 
                                0x41, 
                                0x4E, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x06, 
                                0x0A, 
                                0x0E, 
                                0x12, 
                                0x1A, 
                                0x24, 
                                0x2E, 
                                0x38, 
                                0x42, 
                                0x50, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x07, 
                                0x0B, 
                                0x0F, 
                                0x13, 
                                0x19, 
                                0x23, 
                                0x2C, 
                                0x36, 
                                0x3F, 
                                0x4D, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x06, 
                                0x0A, 
                                0x0E, 
                                0x12, 
                                0x17, 
                                0x20, 
                                0x2A, 
                                0x33, 
                                0x3C, 
                                0x49, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x06, 
                                0x0A, 
                                0x0E, 
                                0x12, 
                                0x1A, 
                                0x24, 
                                0x2E, 
                                0x38, 
                                0x42, 
                                0x50, 
                                0x64
                            }, 
                            Package (0x0B)
                            {
                                0x07, 
                                0x0B, 
                                0x0F, 
                                0x13, 
                                0x18, 
                                0x22, 
                                0x2B, 
                                0x34, 
                                0x3D, 
                                0x4A, 
                                0x64
                            }
                        })
                        Method (_BCL, 0, NotSerialized)
                        {
                            Return (BCLB)
                        }
                        Method (_BCM, 1, NotSerialized)
                        {
                            Store (Arg0, BRTL)
                            Divide (Arg0, 0x0A, Local0, Local1)
                            If (LEqual (IDPC, 0x0614))
                            {
                                Store (DerefOf (Index (UBBL, Zero)), Local2)
                            }
                            Else
                            {
                                If (LEqual (IDPC, 0x063B))
                                {
                                    Store (DerefOf (Index (UBBL, One)), Local2)
                                }
                                Else
                                {
                                    If (LEqual (IDPC, 0x4E51))
                                    {
                                        Store (DerefOf (Index (UBBL, 0x02)), Local2)
                                    }
                                    Else
                                    {
                                        If (LEqual (IDPC, 0x4C51))
                                        {
                                            Store (DerefOf (Index (UBBL, 0x03)), Local2)
                                        }
                                        Else
                                        {
                                            If (LEqual (IDPC, 0x46EC))
                                            {
                                                Store (DerefOf (Index (UBBL, 0x04)), Local2)
                                            }
                                            Else
                                            {
                                                If (LEqual (IDPC, 0x45EC))
                                                {
                                                    Store (DerefOf (Index (UBBL, 0x05)), Local2)
                                                }
                                                Else
                                                {
                                                    If (LEqual (IDPC, 0x15C9))
                                                    {
                                                        Store (DerefOf (Index (UBBL, 0x06)), Local2)
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (IDPC, 0x15BE))
                                                        {
                                                            Store (DerefOf (Index (UBBL, 0x07)), Local2)
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (IDPC, 0x0465))
                                                            {
                                                                Store (DerefOf (Index (UBBL, 0x08)), Local2)
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (IDPC, 0x0493))
                                                                {
                                                                    Store (DerefOf (Index (UBBL, 0x09)), Local2)
                                                                }
                                                                Else
                                                                {
                                                                    If (LEqual (IDPC, 0x0468))
                                                                    {
                                                                        Store (DerefOf (Index (UBBL, 0x0A)), Local2)
                                                                    }
                                                                    Else
                                                                    {
                                                                        If (LEqual (IDPC, 0x15CA))
                                                                        {
                                                                            Store (DerefOf (Index (UBBL, 0x0B)), Local2)
                                                                        }
                                                                        Else
                                                                        {
                                                                            If (LEqual (IDPC, 0x15BF))
                                                                            {
                                                                                Store (DerefOf (Index (UBBL, 0x0C)), Local2)
                                                                            }
                                                                            Else
                                                                            {
                                                                                If (LEqual (IDPC, 0x10EC))
                                                                                {
                                                                                    Store (DerefOf (Index (UBBL, 0x0D)), Local2)
                                                                                }
                                                                                Else
                                                                                {
                                                                                    If (LEqual (IDPC, 0x15CC))
                                                                                    {
                                                                                        Store (DerefOf (Index (UBBL, 0x0E)), Local2)
                                                                                    }
                                                                                    Else
                                                                                    {
                                                                                        If (LEqual (IDPC, 0x5151))
                                                                                        {
                                                                                            Store (DerefOf (Index (UBBL, 0x0F)), Local2)
                                                                                        }
                                                                                        Else
                                                                                        {
                                                                                            If (LEqual (IDPC, 0x15C6))
                                                                                            {
                                                                                                Store (DerefOf (Index (UBBL, 0x10)), Local2)
                                                                                            }
                                                                                            Else
                                                                                            {
                                                                                                If (LEqual (IDPC, 0x0665))
                                                                                                {
                                                                                                    Store (DerefOf (Index (UBBL, 0x11)), Local2)
                                                                                                }
                                                                                                Else
                                                                                                {
                                                                                                    If (LEqual (IDPC, 0x0503))
                                                                                                    {
                                                                                                        Store (DerefOf (Index (UBBL, 0x12)), Local2)
                                                                                                    }
                                                                                                    Else
                                                                                                    {
                                                                                                        If (LEqual (IDPC, 0x71EC))
                                                                                                        {
                                                                                                            Store (DerefOf (Index (UBBL, 0x13)), Local2)
                                                                                                        }
                                                                                                        Else
                                                                                                        {
                                                                                                            If (LEqual (IDPC, 0x0496))
                                                                                                            {
                                                                                                                Store (DerefOf (Index (UBBL, 0x14)), Local2)
                                                                                                            }
                                                                                                            Else
                                                                                                            {
                                                                                                                If (LEqual (IDPC, 0x06A5))
                                                                                                                {
                                                                                                                    Store (DerefOf (Index (UBBL, 0x15)), Local2)
                                                                                                                }
                                                                                                                Else
                                                                                                                {
                                                                                                                    If (LEqual (IDPC, 0x15C5))
                                                                                                                    {
                                                                                                                        Store (DerefOf (Index (UBBL, 0x16)), Local2)
                                                                                                                    }
                                                                                                                    Else
                                                                                                                    {
                                                                                                                        If (LEqual (IDPC, 0x38ED))
                                                                                                                        {
                                                                                                                            Store (DerefOf (Index (UBBL, 0x17)), Local2)
                                                                                                                        }
                                                                                                                        Else
                                                                                                                        {
                                                                                                                            If (LEqual (IDPC, 0x0687))
                                                                                                                            {
                                                                                                                                Store (DerefOf (Index (UBBL, 0x18)), Local2)
                                                                                                                            }
                                                                                                                            Else
                                                                                                                            {
                                                                                                                                If (LEqual (IDPC, 0x36ED))
                                                                                                                                {
                                                                                                                                    Store (DerefOf (Index (UBBL, 0x19)), Local2)
                                                                                                                                }
                                                                                                                                Else
                                                                                                                                {
                                                                                                                                    If (LEqual (IDPC, 0x052F))
                                                                                                                                    {
                                                                                                                                        Store (DerefOf (Index (UBBL, 0x1A)), Local2)
                                                                                                                                    }
                                                                                                                                    Else
                                                                                                                                    {
                                                                                                                                        If (LEqual (IDPC, 0x41ED))
                                                                                                                                        {
                                                                                                                                            Store (DerefOf (Index (UBBL, 0x1B)), Local2)
                                                                                                                                        }
                                                                                                                                        Else
                                                                                                                                        {
                                                                                                                                            If (LEqual (IDPC, 0x70EC))
                                                                                                                                            {
                                                                                                                                                Store (DerefOf (Index (UBBL, 0x1C)), Local2)
                                                                                                                                            }
                                                                                                                                            Else
                                                                                                                                            {
                                                                                                                                                If (LEqual (IDPC, 0x0546))
                                                                                                                                                {
                                                                                                                                                    Store (DerefOf (Index (UBBL, 0x1D)), Local2)
                                                                                                                                                }
                                                                                                                                                Else
                                                                                                                                                {
                                                                                                                                                    If (LEqual (IDPC, 0x15E3))
                                                                                                                                                    {
                                                                                                                                                        Store (DerefOf (Index (UBBL, 0x1E)), Local2)
                                                                                                                                                    }
                                                                                                                                                    Else
                                                                                                                                                    {
                                                                                                                                                        If (LEqual (IDPC, 0x15DB))
                                                                                                                                                        {
                                                                                                                                                            Store (DerefOf (Index (UBBL, 0x1F)), Local2)
                                                                                                                                                        }
                                                                                                                                                        Else
                                                                                                                                                        {
                                                                                                                                                            If (LEqual (IDPC, 0x06A4))
                                                                                                                                                            {
                                                                                                                                                                Store (DerefOf (Index (UBBL, 0x20)), Local2)
                                                                                                                                                            }
                                                                                                                                                            Else
                                                                                                                                                            {
                                                                                                                                                                If (LEqual (IDPC, 0x15DC))
                                                                                                                                                                {
                                                                                                                                                                    Store (DerefOf (Index (UBBL, 0x21)), Local2)
                                                                                                                                                                }
                                                                                                                                                                Else
                                                                                                                                                                {
                                                                                                                                                                    If (LEqual (IDPC, 0x06F0))
                                                                                                                                                                    {
                                                                                                                                                                        Store (DerefOf (Index (UBBL, 0x22)), Local2)
                                                                                                                                                                    }
                                                                                                                                                                    Else
                                                                                                                                                                    {
                                                                                                                                                                        If (LEqual (IDPC, 0x06F9))
                                                                                                                                                                        {
                                                                                                                                                                            Store (DerefOf (Index (UBBL, 0x23)), Local2)
                                                                                                                                                                        }
                                                                                                                                                                        Else
                                                                                                                                                                        {
                                                                                                                                                                            If (LEqual (IDPC, 0x15E7))
                                                                                                                                                                            {
                                                                                                                                                                                Store (DerefOf (Index (UBBL, 0x24)), Local2)
                                                                                                                                                                            }
                                                                                                                                                                            Else
                                                                                                                                                                            {
                                                                                                                                                                                If (LEqual (IDPC, 0x38EA))
                                                                                                                                                                                {
                                                                                                                                                                                    Store (DerefOf (Index (UBBL, 0x25)), Local2)
                                                                                                                                                                                }
                                                                                                                                                                                Else
                                                                                                                                                                                {
                                                                                                                                                                                    If (LEqual (IDPC, 0x23ED))
                                                                                                                                                                                    {
                                                                                                                                                                                        Store (DerefOf (Index (UBBL, 0x26)), Local2)
                                                                                                                                                                                    }
                                                                                                                                                                                    Else
                                                                                                                                                                                    {
                                                                                                                                                                                        If (LEqual (IDPC, 0x15FE))
                                                                                                                                                                                        {
                                                                                                                                                                                            Store (DerefOf (Index (UBBL, 0x27)), Local2)
                                                                                                                                                                                        }
                                                                                                                                                                                        Else
                                                                                                                                                                                        {
                                                                                                                                                                                            If (LEqual (IDPC, 0x056E))
                                                                                                                                                                                            {
                                                                                                                                                                                                Store (DerefOf (Index (UBBL, 0x28)), Local2)
                                                                                                                                                                                            }
                                                                                                                                                                                            Else
                                                                                                                                                                                            {
                                                                                                                                                                                                Store (Package (0x0B)
                                                                                                                                                                                                    {
                                                                                                                                                                                                        0x06, 
                                                                                                                                                                                                        0x0A, 
                                                                                                                                                                                                        0x14, 
                                                                                                                                                                                                        0x1E, 
                                                                                                                                                                                                        0x28, 
                                                                                                                                                                                                        0x32, 
                                                                                                                                                                                                        0x3C, 
                                                                                                                                                                                                        0x46, 
                                                                                                                                                                                                        0x50, 
                                                                                                                                                                                                        0x5A, 
                                                                                                                                                                                                        0x62
                                                                                                                                                                                                    }, Local2)
                                                                                                                                                                                            }
                                                                                                                                                                                        }
                                                                                                                                                                                    }
                                                                                                                                                                                }
                                                                                                                                                                            }
                                                                                                                                                                        }
                                                                                                                                                                    }
                                                                                                                                                                }
                                                                                                                                                            }
                                                                                                                                                        }
                                                                                                                                                    }
                                                                                                                                                }
                                                                                                                                            }
                                                                                                                                        }
                                                                                                                                    }
                                                                                                                                }
                                                                                                                            }
                                                                                                                        }
                                                                                                                    }
                                                                                                                }
                                                                                                            }
                                                                                                        }
                                                                                                    }
                                                                                                }
                                                                                            }
                                                                                        }
                                                                                    }
                                                                                }
                                                                            }
                                                                        }
                                                                    }
                                                                }
                                                            }
                                                        }
                                                    }
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                            Store (DerefOf (Index (Local2, Local1)), Local0)
                            Divide (Multiply (Arg0, 0xFF), 0x64, Local1, Local0)
                            AFN7 (Local0)
                            Store (Arg0, BRTL)
                        }
                    }
                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (Zero)
                    }
                }
                Device (HDAU)
                {
                    Name (_ADR, One)
                    Method (_RMV, 0, NotSerialized)
                    {
                        Return (Zero)
                    }
                }
            }
            Device (GPP1)
            {
                Name (_ADR, 0x00010002)
                Name (PR02, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKE, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKF, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKG, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKH, 
                        Zero
                    }
                })
                Name (AR02, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x14
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x15
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x16
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x17
                    }
                })
                Name (NR02, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x1C
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x1D
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x1E
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x1F
                    }
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        If (\NAPC)
                        {
                            Return (NR02)
                        }
                        Else
                        {
                            Return (AR02)
                        }
                    }
                    Else
                    {
                        Return (PR02)
                    }
                }
                Device (XPDV)
                {
                    Name (_ADR, Zero)
                    Name (LANS, Zero)
                    Method (_PRW, 0, NotSerialized)
                    {
                        Return (GPRW (0x08, 0x05))
                    }
                    Method (_PSW, 1, NotSerialized)
                    {
                        If (Arg0)
                        {
                            Store (One, LANS)
                            Store (One, ^^^LPC0.EC0.LWAK)
                        }
                        Else
                        {
                            Store (Zero, LANS)
                            Store (Zero, ^^^LPC0.EC0.LWAK)
                        }
                    }
                }
            }
            Device (GPP2)
            {
                Name (_ADR, 0x00010003)
                Method (_PRW, 0, NotSerialized)
                {
                    If (LEqual (WKPM, One))
                    {
                        Return (GPRW (0x08, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }
                Name (PR03, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }
                })
                Name (AR03, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Name (NR03, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x20
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x21
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x22
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x23
                    }
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        If (\NAPC)
                        {
                            Return (NR03)
                        }
                        Else
                        {
                            Return (AR03)
                        }
                    }
                    Else
                    {
                        Return (PR03)
                    }
                }
            }
            Device (GPP3)
            {
                Name (_ADR, 0x00010004)
                Method (_PRW, 0, NotSerialized)
                {
                    If (LEqual (WKPM, One))
                    {
                        Return (GPRW (0x08, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }
                Name (PR04, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKE, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKF, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKG, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKH, 
                        Zero
                    }
                })
                Name (AR04, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x14
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x15
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x16
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x17
                    }
                })
                Name (NR04, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x24
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x25
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x26
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x27
                    }
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        If (\NAPC)
                        {
                            Return (NR04)
                        }
                        Else
                        {
                            Return (AR04)
                        }
                    }
                    Else
                    {
                        Return (PR04)
                    }
                }
            }
            Device (GPP4)
            {
                Name (_ADR, 0x00010005)
                Method (_PRW, 0, NotSerialized)
                {
                    If (LEqual (WKPM, One))
                    {
                        Return (GPRW (0x08, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }
                Name (PR05, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }
                })
                Name (AR05, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Name (NR05, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x28
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x29
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x2A
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x2B
                    }
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        If (\NAPC)
                        {
                            Return (NR05)
                        }
                        Else
                        {
                            Return (AR05)
                        }
                    }
                    Else
                    {
                        Return (PR05)
                    }
                }
            }
            Device (GPP5)
            {
                Name (_ADR, 0x00010006)
                Method (_PRW, 0, NotSerialized)
                {
                    If (LEqual (WKPM, One))
                    {
                        Return (GPRW (0x08, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }
                Name (PR06, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKE, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKF, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKG, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKH, 
                        Zero
                    }
                })
                Name (AR06, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x14
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x15
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x16
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x17
                    }
                })
                Name (NR06, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x2C
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x2D
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x2E
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x2F
                    }
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        If (\NAPC)
                        {
                            Return (NR06)
                        }
                        Else
                        {
                            Return (AR06)
                        }
                    }
                    Else
                    {
                        Return (PR06)
                    }
                }
            }
            Device (GPP6)
            {
                Name (_ADR, 0x00010007)
                Method (_PRW, 0, NotSerialized)
                {
                    If (LEqual (WKPM, One))
                    {
                        Return (GPRW (0x08, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }
                Name (PR07, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKA, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKB, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKC, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKD, 
                        Zero
                    }
                })
                Name (AR07, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x10
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x11
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x12
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x13
                    }
                })
                Name (NR07, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x30
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x31
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x32
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x33
                    }
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        If (\NAPC)
                        {
                            Return (NR07)
                        }
                        Else
                        {
                            Return (AR07)
                        }
                    }
                    Else
                    {
                        Return (PR07)
                    }
                }
            }
            Device (GP17)
            {
                Name (_ADR, 0x00080001)
                Method (_PRW, 0, NotSerialized)
                {
                    If (LEqual (WKPM, One))
                    {
                        Return (GPRW (0x19, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x19, Zero))
                    }
                }
                Name (PR17, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKE, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKF, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKG, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKH, 
                        Zero
                    }
                })
                Name (AR17, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x14
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x15
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x16
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x17
                    }
                })
                Name (NR17, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x34
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x35
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x36
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x37
                    }
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        If (\NAPC)
                        {
                            Return (NR17)
                        }
                        Else
                        {
                            Return (AR17)
                        }
                    }
                    Else
                    {
                        Return (PR17)
                    }
                }
                Device (VGA)
                {
                    Name (_ADR, Zero)
                    Method (_STA, 0, NotSerialized)
                    {
                        Return (0x0F)
                    }
                    Name (DOSA, Zero)
                    Method (_DOS, 1, NotSerialized)
                    {
                        Store (Arg0, DOSA)
                    }
                    Method (_DOD, 0, NotSerialized)
                    {
                        Return (Package (0x07)
                        {
                            0x00010110, 
                            0x00010210, 
                            0x00010220, 
                            0x00010230, 
                            0x00010240, 
                            0x00031000, 
                            0x00032000
                        })
                    }
                    Device (LCD)
                    {
                        Name (_ADR, 0x0110)
                        Name (BCLB, Package (0x34)
                        {
                            0x5A, 
                            0x3C, 
                            0x02, 
                            0x04, 
                            0x06, 
                            0x08, 
                            0x0A, 
                            0x0C, 
                            0x0E, 
                            0x10, 
                            0x12, 
                            0x14, 
                            0x16, 
                            0x18, 
                            0x1A, 
                            0x1C, 
                            0x1E, 
                            0x20, 
                            0x22, 
                            0x24, 
                            0x26, 
                            0x28, 
                            0x2A, 
                            0x2C, 
                            0x2E, 
                            0x30, 
                            0x32, 
                            0x34, 
                            0x36, 
                            0x38, 
                            0x3A, 
                            0x3C, 
                            0x3E, 
                            0x40, 
                            0x42, 
                            0x44, 
                            0x46, 
                            0x48, 
                            0x4A, 
                            0x4C, 
                            0x4E, 
                            0x50, 
                            0x52, 
                            0x54, 
                            0x56, 
                            0x58, 
                            0x5A, 
                            0x5C, 
                            0x5E, 
                            0x60, 
                            0x62, 
                            0x64
                        })
                        Method (_BCL, 0, NotSerialized)
                        {
                            Return (BCLB)
                        }
                        Method (_BCM, 1, NotSerialized)
                        {
                            Divide (Multiply (Arg0, 0xFF), 0x64, Local1, Local0)
                            AFN7 (Local0)
                            Store (Arg0, BRTL)
                        }
                    }
                }
                Device (PSP)
                {
                    Name (_ADR, 0x02)
                }
                Device (ACP)
                {
                    Name (_ADR, 0x05)
                }
                Device (AZAL)
                {
                    Name (_ADR, 0x06)
                }
                Name (XUPC, Package (0x04)
                {
                    0xFF, 
                    0xFF, 
                    Zero, 
                    Zero
                })
                Name (XUP1, Package (0x04)
                {
                    Zero, 
                    0xFF, 
                    Zero, 
                    Zero
                })
                Name (XPLD, Buffer (0x10)
                {
                    /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                    /* 0008 */   0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                })
                Device (XHC0)
                {
                    Name (_ADR, 0x03)
                    Method (_PRW, 0, NotSerialized)
                    {
                        Return (GPRW (0x19, 0x03))
                    }
                    Method (_PSW, 1, NotSerialized)
                    {
                        If (Arg0)
                        {
                            Store (One, ^^^LPC0.EC0.UWAK)
                        }
                        Else
                        {
                            Store (Zero, ^^^LPC0.EC0.UWAK)
                        }
                    }
                    Method (_S0W, 0, NotSerialized)
                    {
                        Return (Zero)
                    }
                    Device (RHUB)
                    {
                        Method (GPLD, 2, Serialized)
                        {
                            Name (PCKG, Package (0x01)
                            {
                                Buffer (0x10) {}
                            })
                            CreateField (DerefOf (Index (PCKG, Zero)), Zero, 0x07, REV)
                            Store (One, REV)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x40, One, VISI)
                            Store (Arg0, VISI)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x57, 0x08, GPOS)
                            Store (Arg1, GPOS)
                            Return (PCKG)
                        }
                        Method (GUPC, 1, Serialized)
                        {
                            Name (PCKG, Package (0x04)
                            {
                                Zero, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Store (Arg0, Index (PCKG, Zero))
                            Return (PCKG)
                        }
                        Name (_ADR, Zero)
                        Device (PRT1)
                        {
                            Name (_ADR, One)
                            Name (_UPC, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x91, 0x1C, 0x80, 0x02, 0x01, 0x00, 0x00, 0x00,
                                    /* 0010 */   0xFF, 0xFF, 0xFF, 0xFF
                                }
                            })
                        }
                        Device (PRT2)
                        {
                            Name (_ADR, 0x02)
                            Name (_UPC, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x91, 0x1C, 0x00, 0x03, 0x01, 0x00, 0x00, 0x00,
                                    /* 0010 */   0xFF, 0xFF, 0xFF, 0xFF
                                }
                            })
                        }
                        Device (PRT3)
                        {
                            Name (_ADR, 0x03)
                            Name (_UPC, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x91, 0x1C, 0x80, 0x03, 0x01, 0x00, 0x00, 0x00,
                                    /* 0010 */   0xFF, 0xFF, 0xFF, 0xFF
                                }
                            })
                        }
                        Device (PRT4)
                        {
                            Name (_ADR, 0x04)
                            Name (_UPC, Package (0x04)
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x50, 0x1C, 0x00, 0x04, 0x00, 0x00, 0x00, 0x00,
                                    /* 0010 */   0xFF, 0xFF, 0xFF, 0xFF
                                }
                            })
                        }
                        Device (PRT5)
                        {
                            Name (_ADR, 0x05)
                            Name (_UPC, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x91, 0x1C, 0x80, 0x02, 0x01, 0x00, 0x00, 0x00,
                                    /* 0010 */   0xFF, 0xFF, 0xFF, 0xFF
                                }
                            })
                        }
                        Device (PRT6)
                        {
                            Name (_ADR, 0x06)
                            Name (_UPC, Package (0x04)
                            {
                                0xFF, 
                                0x03, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x91, 0x1C, 0x00, 0x03, 0x01, 0x00, 0x00, 0x00,
                                    /* 0010 */   0xFF, 0xFF, 0xFF, 0xFF
                                }
                            })
                        }
                        Device (PRT7)
                        {
                            Name (_ADR, 0x07)
                            Method (_UPC, 0, NotSerialized)
                            {
                                Return (GUPC (Zero))
                            }
                            Method (_PLD, 0, NotSerialized)
                            {
                                Return (GPLD (Zero, Zero))
                            }
                        }
                        Device (PRT8)
                        {
                            Name (_ADR, 0x08)
                            Method (_UPC, 0, NotSerialized)
                            {
                                Return (GUPC (Zero))
                            }
                            Method (_PLD, 0, NotSerialized)
                            {
                                Return (GPLD (Zero, Zero))
                            }
                        }
                    }
                }
                Device (XHC1)
                {
                    Name (_ADR, 0x04)
                    Method (_PRW, 0, NotSerialized)
                    {
                        Return (GPRW (0x19, 0x04))
                    }
                    Method (_S0W, 0, NotSerialized)
                    {
                        Return (Zero)
                    }
                    Device (RHUB)
                    {
                        Method (GPLD, 2, Serialized)
                        {
                            Name (PCKG, Package (0x01)
                            {
                                Buffer (0x10) {}
                            })
                            CreateField (DerefOf (Index (PCKG, Zero)), Zero, 0x07, REV)
                            Store (One, REV)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x40, One, VISI)
                            Store (Arg0, VISI)
                            CreateField (DerefOf (Index (PCKG, Zero)), 0x57, 0x08, GPOS)
                            Store (Arg1, GPOS)
                            Return (PCKG)
                        }
                        Method (GUPC, 1, Serialized)
                        {
                            Name (PCKG, Package (0x04)
                            {
                                Zero, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Store (Arg0, Index (PCKG, Zero))
                            Return (PCKG)
                        }
                        Name (_ADR, Zero)
                        Device (PRT1)
                        {
                            Name (_ADR, One)
                            Name (_UPC, Package (0x04)
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)
                            {
                                Buffer (0x14)
                                {
                                    /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x50, 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,
                                    /* 0010 */   0xFF, 0xFF, 0xFF, 0xFF
                                }
                            })
                        }
                        Device (GHUB)
                        {
                            Name (_ADR, 0x02)
                            Name (_UPC, Package (0x04)
                            {
                                0xFF, 
                                0xFF, 
                                Zero, 
                                Zero
                            })
                            Name (_PLD, Package (0x01)
                            {
                                Buffer (0x10)
                                {
                                    /* 0000 */   0x81, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                    /* 0008 */   0x30, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00
                                }
                            })
                            Device (PRT1)
                            {
                                Name (_ADR, One)
                                Name (_UPC, Package (0x04)
                                {
                                    0xFF, 
                                    0x03, 
                                    Zero, 
                                    Zero
                                })
                                Name (_PLD, Package (0x01)
                                {
                                    Buffer (0x14)
                                    {
                                        /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                        /* 0008 */   0x10, 0x0C, 0x80, 0x00, 0x01, 0x00, 0x00, 0x00,
                                        /* 0010 */   0xFF, 0xFF, 0xFF, 0xFF
                                    }
                                })
                                Device (FCAM)
                                {
                                    Name (_ADR, One)
                                    Name (_UPC, Package (0x04)
                                    {
                                        0xFF, 
                                        0xFF, 
                                        Zero, 
                                        Zero
                                    })
                                    Name (_PLD, Package (0x01)
                                    {
                                        Buffer (0x14)
                                        {
                                            /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x05, 0x00, 0x05, 0x00,
                                            /* 0008 */   0x24, 0x09, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00,
                                            /* 0010 */   0x2C, 0x01, 0xBE, 0xFF
                                        }
                                    })
                                }
                            }
                            Device (PRT2)
                            {
                                Name (_ADR, 0x02)
                                Name (_UPC, Package (0x04)
                                {
                                    0xFF, 
                                    0xFF, 
                                    Zero, 
                                    Zero
                                })
                                Name (_PLD, Package (0x01)
                                {
                                    Buffer (0x14)
                                    {
                                        /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                        /* 0008 */   0x50, 0x1C, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,
                                        /* 0010 */   0xFF, 0xFF, 0xFF, 0xFF
                                    }
                                })
                            }
                            Device (PRT3)
                            {
                                Name (_ADR, 0x03)
                                Name (_UPC, Package (0x04)
                                {
                                    0xFF, 
                                    0xFF, 
                                    Zero, 
                                    Zero
                                })
                                Name (_PLD, Package (0x01)
                                {
                                    Buffer (0x14)
                                    {
                                        /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                        /* 0008 */   0x10, 0x0C, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00,
                                        /* 0010 */   0xFF, 0xFF, 0xFF, 0xFF
                                    }
                                })
                            }
                        }
                        Device (PRT3)
                        {
                            Name (_ADR, 0x03)
                            Method (_UPC, 0, NotSerialized)
                            {
                                Return (GUPC (Zero))
                            }
                            Method (_PLD, 0, NotSerialized)
                            {
                                Return (GPLD (Zero, Zero))
                            }
                        }
                    }
                }
                Device (MP2C)
                {
                    Name (_ADR, 0x07)
                }
            }
            Device (GP18)
            {
                Name (_ADR, 0x00080002)
                Method (_PRW, 0, NotSerialized)
                {
                    If (LEqual (WKPM, One))
                    {
                        Return (GPRW (0x08, 0x04))
                    }
                    Else
                    {
                        Return (GPRW (0x08, Zero))
                    }
                }
                Name (PR18, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        LNKG, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        LNKH, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        LNKE, 
                        Zero
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        LNKF, 
                        Zero
                    }
                })
                Name (AR18, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x16
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x17
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x14
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x15
                    }
                })
                Name (NR18, Package (0x04)
                {
                    Package (0x04)
                    {
                        0xFFFF, 
                        Zero, 
                        Zero, 
                        0x36
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        One, 
                        Zero, 
                        0x37
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x02, 
                        Zero, 
                        0x34
                    }, 
                    Package (0x04)
                    {
                        0xFFFF, 
                        0x03, 
                        Zero, 
                        0x35
                    }
                })
                Method (_PRT, 0, NotSerialized)
                {
                    If (PICM)
                    {
                        If (\NAPC)
                        {
                            Return (NR18)
                        }
                        Else
                        {
                            Return (AR18)
                        }
                    }
                    Else
                    {
                        Return (PR18)
                    }
                }
                Device (SATA)
                {
                    Name (_ADR, Zero)
                }
            }
            Device (HPET)
            {
                Name (_HID, EisaId ("PNP0103"))
                Method (_STA, 0, NotSerialized)
                {
                    If (LEqual (HPEN, One))
                    {
                        If (LGreaterEqual (OSTB, 0x40))
                        {
                            Return (0x0F)
                        }
                        Store (Zero, HPEN)
                        Return (One)
                    }
                    Return (One)
                }
                Method (_CRS, 0, NotSerialized)
                {
                    Name (BUF0, ResourceTemplate ()
                    {
                        IRQNoFlags ()
                            {0}
                        IRQNoFlags ()
                            {8}
                        Memory32Fixed (ReadOnly,
                            0xFED00000,         // Address Base
                            0x00000400,         // Address Length
                            _Y07)
                    })
                    CreateDWordField (BUF0, \_SB.PCI0.HPET._CRS._Y07._BAS, HPEB)
                    Store (0xFED00000, Local0)
                    And (Local0, 0xFFFFFC00, HPEB)
                    Return (BUF0)
                }
            }
            Device (SMBS)
            {
                Name (_ADR, 0x00140000)
            }
            Device (MSSE)
            {
                Name (_HID, "SMB0001")
                Name (_CRS, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x0B20,             // Range Minimum
                        0x0B20,             // Range Maximum
                        0x20,               // Alignment
                        0x20,               // Length
                        )
                    IRQ (Level, ActiveLow, Shared, )
                        {10}
                })
                Method (_STA, 0, NotSerialized)
                {
                    Return (0x0F)
                }
            }
            Device (LPC0)
            {
                Name (_ADR, 0x00140003)
                Device (DMAC)
                {
                    Name (_HID, EisaId ("PNP0200"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0000,             // Range Minimum
                            0x0000,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0081,             // Range Minimum
                            0x0081,             // Range Maximum
                            0x01,               // Alignment
                            0x0F,               // Length
                            )
                        IO (Decode16,
                            0x00C0,             // Range Minimum
                            0x00C0,             // Range Maximum
                            0x01,               // Alignment
                            0x20,               // Length
                            )
                        DMA (Compatibility, NotBusMaster, Transfer8_16, )
                            {4}
                    })
                }
                Device (COPR)
                {
                    Name (_HID, EisaId ("PNP0C04"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x00F0,             // Range Minimum
                            0x00F0,             // Range Maximum
                            0x01,               // Alignment
                            0x0F,               // Length
                            )
                        IRQNoFlags ()
                            {13}
                    })
                }
                Device (PIC)
                {
                    Name (_HID, EisaId ("PNP0000"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0020,             // Range Minimum
                            0x0020,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x00A0,             // Range Minimum
                            0x00A0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IRQNoFlags ()
                            {2}
                    })
                }
                Device (RTC)
                {
                    Name (_HID, EisaId ("PNP0B00"))
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0070,             // Range Minimum
                            0x0070,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        If (LEqual (HPEN, One))
                        {
                            Return (BUF0)
                        }
                        Return (BUF1)
                    }
                }
                Device (SPKR)
                {
                    Name (_HID, EisaId ("PNP0800"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0061,             // Range Minimum
                            0x0061,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                    })
                }
                Device (TMR)
                {
                    Name (_HID, EisaId ("PNP0100"))
                    Name (BUF0, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                    })
                    Name (BUF1, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0040,             // Range Minimum
                            0x0040,             // Range Maximum
                            0x01,               // Alignment
                            0x04,               // Length
                            )
                        IRQNoFlags ()
                            {0}
                    })
                    Method (_CRS, 0, Serialized)
                    {
                        If (LEqual (HPEN, One))
                        {
                            Return (BUF0)
                        }
                        Return (BUF1)
                    }
                }
                Device (KBC0)
                {
                    Name (_HID, EisaId ("HPQ8001"))
                    Name (_CID, EisaId ("PNP0303"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {1}
                    })
                }
                Device (PS2M)
                {
                    Name (_HID, EisaId ("SYN327B"))
                    Name (_CID, EisaId ("PNP0F13"))
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0060,             // Range Minimum
                            0x0060,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0064,             // Range Minimum
                            0x0064,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IRQNoFlags ()
                            {12}
                    })
                }
                Device (SYSR)
                {
                    Name (_HID, EisaId ("PNP0C02"))
                    Name (_UID, One)
                    Name (_CRS, ResourceTemplate ()
                    {
                        IO (Decode16,
                            0x0010,             // Range Minimum
                            0x0010,             // Range Maximum
                            0x01,               // Alignment
                            0x10,               // Length
                            )
                        IO (Decode16,
                            0x0072,             // Range Minimum
                            0x0072,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0080,             // Range Minimum
                            0x0080,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x00B0,             // Range Minimum
                            0x00B0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0092,             // Range Minimum
                            0x0092,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0400,             // Range Minimum
                            0x0400,             // Range Maximum
                            0x01,               // Alignment
                            0xD0,               // Length
                            )
                        IO (Decode16,
                            0x04D0,             // Range Minimum
                            0x04D0,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x04D6,             // Range Minimum
                            0x04D6,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C00,             // Range Minimum
                            0x0C00,             // Range Maximum
                            0x01,               // Alignment
                            0x02,               // Length
                            )
                        IO (Decode16,
                            0x0C14,             // Range Minimum
                            0x0C14,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C50,             // Range Minimum
                            0x0C50,             // Range Maximum
                            0x01,               // Alignment
                            0x03,               // Length
                            )
                        IO (Decode16,
                            0x0C6C,             // Range Minimum
                            0x0C6C,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0C6F,             // Range Minimum
                            0x0C6F,             // Range Maximum
                            0x01,               // Alignment
                            0x01,               // Length
                            )
                        IO (Decode16,
                            0x0CD0,             // Range Minimum
                            0x0CD0,             // Range Maximum
                            0x01,               // Alignment
                            0x0C,               // Length
                            )
                    })
                }
                Device (MEM)
                {
                    Name (_HID, EisaId ("PNP0C01"))
                    Name (MSRC, ResourceTemplate ()
                    {
                        Memory32Fixed (ReadOnly,
                            0x000E0000,         // Address Base
                            0x00020000,         // Address Length
                            )
                        Memory32Fixed (ReadWrite,
                            0xFFF00000,         // Address Base
                            0x00100000,         // Address Length
                            _Y08)
                    })
                    Method (_CRS, 0, NotSerialized)
                    {
                        CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y08._LEN, PSIZ)
                        CreateDWordField (MSRC, \_SB.PCI0.LPC0.MEM._Y08._BAS, PBAS)
                        Store (ROMS, PSIZ)
                        Subtract (ROMS, One, Local0)
                        Subtract (Ones, Local0, PBAS)
                        Return (MSRC)
                    }
                }
                Mutex (PSMX, 0x00)
            }
        }
        OperationRegion (PIRQ, SystemIO, 0x0C00, 0x02)
        Field (PIRQ, ByteAcc, NoLock, Preserve)
        {
            PIDX,   8, 
            PDAT,   8
        }
        IndexField (PIDX, PDAT, ByteAcc, NoLock, Preserve)
        {
            PIRA,   8, 
            PIRB,   8, 
            PIRC,   8, 
            PIRD,   8, 
            PIRE,   8, 
            PIRF,   8, 
            PIRG,   8, 
            PIRH,   8, 
            Offset (0x0C), 
            SIRA,   8, 
            SIRB,   8, 
            SIRC,   8, 
            SIRD,   8, 
            PIRS,   8, 
            Offset (0x13), 
            HDAD,   8, 
            Offset (0x17), 
            SDCL,   8, 
            Offset (0x1A), 
            SDIO,   8, 
            Offset (0x30), 
            USB1,   8, 
            Offset (0x34), 
            USB3,   8, 
            Offset (0x41), 
            SATA,   8, 
            Offset (0x62), 
            GIOC,   8, 
            Offset (0x70), 
            I2C0,   8, 
            I2C1,   8, 
            I2C2,   8, 
            I2C3,   8, 
            URT0,   8, 
            URT1,   8
        }
        OperationRegion (KBDD, SystemIO, 0x64, One)
        Field (KBDD, ByteAcc, NoLock, Preserve)
        {
            PD64,   8
        }
        Method (DSPI, 0, NotSerialized)
        {
            INTA (0x1F)
            INTB (0x1F)
            INTC (0x1F)
            INTD (0x1F)
            Store (PD64, Local1)
            Store (0x1F, PIRE)
            Store (0x1F, PIRF)
            Store (0x1F, PIRG)
            Store (0x1F, PIRH)
        }
        Method (INTA, 1, NotSerialized)
        {
            Store (Arg0, PIRA)
            If (PICM)
            {
                Store (Arg0, HDAD)
                Store (Arg0, SDCL)
            }
        }
        Method (INTB, 1, NotSerialized)
        {
            Store (Arg0, PIRB)
        }
        Method (INTC, 1, NotSerialized)
        {
            Store (Arg0, PIRC)
            If (PICM)
            {
                Store (Arg0, USB1)
                Store (Arg0, USB3)
            }
        }
        Method (INTD, 1, NotSerialized)
        {
            Store (Arg0, PIRD)
            If (PICM)
            {
                Store (Arg0, SATA)
            }
        }
        Name (PRS1, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {3,5,6,10,11}
        })
        Name (BUFA, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {15}
        })
        Device (LNKA)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, One)
            Method (_STA, 0, NotSerialized)
            {
                If (LAnd (PIRA, LNotEqual (PIRA, 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }
            Method (_PRS, 0, NotSerialized)
            {
                Return (PRS1)
            }
            Method (_DIS, 0, NotSerialized)
            {
                INTA (0x1F)
            }
            Method (_CRS, 0, NotSerialized)
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRA, IRQX)
                Return (BUFA)
            }
            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRA)
            }
        }
        Device (LNKB)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x02)
            Method (_STA, 0, NotSerialized)
            {
                If (LAnd (PIRB, LNotEqual (PIRB, 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }
            Method (_PRS, 0, NotSerialized)
            {
                Return (PRS1)
            }
            Method (_DIS, 0, NotSerialized)
            {
                INTB (0x1F)
            }
            Method (_CRS, 0, NotSerialized)
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRB, IRQX)
                Return (BUFA)
            }
            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRB)
            }
        }
        Device (LNKC)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x03)
            Method (_STA, 0, NotSerialized)
            {
                If (LAnd (PIRC, LNotEqual (PIRC, 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }
            Method (_PRS, 0, NotSerialized)
            {
                Return (PRS1)
            }
            Method (_DIS, 0, NotSerialized)
            {
                INTC (0x1F)
            }
            Method (_CRS, 0, NotSerialized)
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRC, IRQX)
                Return (BUFA)
            }
            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRC)
            }
        }
        Device (LNKD)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x04)
            Method (_STA, 0, NotSerialized)
            {
                If (LAnd (PIRD, LNotEqual (PIRD, 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }
            Method (_PRS, 0, NotSerialized)
            {
                Return (PRS1)
            }
            Method (_DIS, 0, NotSerialized)
            {
                INTD (0x1F)
            }
            Method (_CRS, 0, NotSerialized)
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRD, IRQX)
                Return (BUFA)
            }
            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRD)
            }
        }
        Device (LNKE)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x05)
            Method (_STA, 0, NotSerialized)
            {
                If (LAnd (PIRE, LNotEqual (PIRE, 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }
            Method (_PRS, 0, NotSerialized)
            {
                Return (PRS1)
            }
            Method (_DIS, 0, NotSerialized)
            {
                Store (0x1F, PIRE)
            }
            Method (_CRS, 0, NotSerialized)
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRE, IRQX)
                Return (BUFA)
            }
            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRE)
            }
        }
        Device (LNKF)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x06)
            Method (_STA, 0, NotSerialized)
            {
                If (LAnd (PIRF, LNotEqual (PIRF, 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }
            Method (_PRS, 0, NotSerialized)
            {
                Return (PRS1)
            }
            Method (_DIS, 0, NotSerialized)
            {
                Store (0x1F, PIRF)
            }
            Method (_CRS, 0, NotSerialized)
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRF, IRQX)
                Return (BUFA)
            }
            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRF)
            }
        }
        Device (LNKG)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x07)
            Method (_STA, 0, NotSerialized)
            {
                If (LAnd (PIRG, LNotEqual (PIRG, 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }
            Method (_PRS, 0, NotSerialized)
            {
                Return (PRS1)
            }
            Method (_DIS, 0, NotSerialized)
            {
                Store (0x1F, PIRG)
            }
            Method (_CRS, 0, NotSerialized)
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRG, IRQX)
                Return (BUFA)
            }
            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRG)
            }
        }
        Device (LNKH)
        {
            Name (_HID, EisaId ("PNP0C0F"))
            Name (_UID, 0x08)
            Method (_STA, 0, NotSerialized)
            {
                If (LAnd (PIRH, LNotEqual (PIRH, 0x1F)))
                {
                    Return (0x0B)
                }
                Else
                {
                    Return (0x09)
                }
            }
            Method (_PRS, 0, NotSerialized)
            {
                Return (PRS1)
            }
            Method (_DIS, 0, NotSerialized)
            {
                Store (0x1F, PIRH)
            }
            Method (_CRS, 0, NotSerialized)
            {
                CreateWordField (BUFA, One, IRQX)
                ShiftLeft (One, PIRH, IRQX)
                Return (BUFA)
            }
            Method (_SRS, 1, NotSerialized)
            {
                CreateWordField (Arg0, One, IRA)
                FindSetRightBit (IRA, Local0)
                Decrement (Local0)
                Store (Local0, PIRH)
            }
        }
        Method (GSMI, 1, NotSerialized)
        {
            Store (Arg0, APMD)
            Store (0xE4, APMC)
            Sleep (0x02)
        }
        Method (S80H, 1, NotSerialized)
        {
            Store (Arg0, P80H)
        }
        Method (BSMI, 1, NotSerialized)
        {
            Store (Arg0, APMD)
            Store (0xBE, APMC)
            Sleep (One)
        }
        Device (WLBU)
        {
            Name (_HID, EisaId ("HPQ6001"))
            Name (WLDP, 0xFF)
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (WLDP, 0xFF))
                {
                    Store (Zero, Local0)
                    OSTP ()
                    If (LOr (LOr (LEqual (OSYS, 0x07DC), LEqual (OSYS, 0x07DD)), LEqual (
                        OSYS, 0x07DF)))
                    {
                        If (LAnd (LNotEqual (WLVD, Zero), LNotEqual (WLVD, 0xFFFF)))
                        {
                            Store (0x0F, Local0)
                        }
                    }
                    Store (Local0, WLDP)
                }
                Return (WLDP)
            }
        }
        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }
            Method (_LID, 0, NotSerialized)
            {
                Store (^^PCI0.LPC0.EC0.LIDF, LID1)
                Store (^^PCI0.LPC0.EC0.LIDF, Local0)
                Store (Local0, LID2)
                If (Local0)
                {
                    Store (Local0, LID3)
                    Return (Zero)
                }
                Return (One)
            }
        }
    }
    Name (TSOS, 0x75)
    If (CondRefOf (\_OSI))
    {
        If (_OSI ("Windows 2009"))
        {
            Store (0x50, TSOS)
        }
        If (_OSI ("Windows 2015"))
        {
            Store (0x70, TSOS)
        }
        If (_OSI ("Linux"))
        {
            Store (0x80, TSOS)
        }
    }
    Scope (_SB)
    {
        OperationRegion (SMIC, SystemMemory, 0xFED80000, 0x00800000)
        Field (SMIC, ByteAcc, NoLock, Preserve)
        {
            Offset (0x36A), 
            SMIB,   8
        }
        OperationRegion (SSMI, SystemIO, SMIB, 0x02)
        Field (SSMI, AnyAcc, NoLock, Preserve)
        {
            SMIW,   16
        }
        OperationRegion (ECMC, SystemIO, 0x72, 0x02)
        Field (ECMC, AnyAcc, NoLock, Preserve)
        {
            ECMI,   8, 
            ECMD,   8
        }
        IndexField (ECMI, ECMD, ByteAcc, NoLock, Preserve)
        {
            Offset (0x08), 
            FRTB,   32
        }
        OperationRegion (FRTP, SystemMemory, FRTB, 0x0100)
        Field (FRTP, AnyAcc, NoLock, Preserve)
        {
            PEBA,   32, 
                ,   4, 
            NI2C,   1, 
            IC0E,   1, 
            IC1E,   1, 
            IC2E,   1, 
            IC3E,   1, 
            IC4E,   1, 
            IC5E,   1, 
            UT0E,   1, 
            UT1E,   1, 
                ,   1, 
                ,   1, 
            ST_E,   1, 
            UT2E,   1, 
                ,   1, 
            EMMD,   2, 
                ,   3, 
            XHCE,   1, 
                ,   1, 
                ,   1, 
            UT3E,   1, 
            ESPI,   1, 
            EMME,   1, 
            Offset (0x08), 
            PCEF,   1, 
                ,   4, 
            IC0D,   1, 
            IC1D,   1, 
            IC2D,   1, 
            IC3D,   1, 
            IC4D,   1, 
            IC5D,   1, 
            UT0D,   1, 
            UT1D,   1, 
                ,   1, 
                ,   1, 
            ST_D,   1, 
            UT2D,   1, 
                ,   1, 
            EHCD,   1, 
                ,   4, 
            XHCD,   1, 
            SD_D,   1, 
                ,   1, 
            UT3D,   1, 
                ,   1, 
            EMD3,   1, 
                ,   2, 
            S03D,   1, 
            FW00,   16, 
            FW01,   32, 
            FW02,   16, 
            FW03,   32, 
            SDS0,   8, 
            SDS1,   8, 
            CZFG,   1, 
            Offset (0x20), 
            SD10,   32, 
            EH10,   32, 
            XH10,   32, 
            STBA,   32
        }
        OperationRegion (FCFG, SystemMemory, PEBA, 0x01000000)
        Field (FCFG, DWordAcc, NoLock, Preserve)
        {
            Offset (0xA3044), 
            IPDE,   32, 
            IMPE,   32, 
            Offset (0xA3078), 
                ,   2, 
            LDQ0,   1, 
            Offset (0xA30CB), 
                ,   7, 
            AUSS,   1, 
            Offset (0xA30D0), 
                ,   13, 
            LCLK,   2
        }
        OperationRegion (IOMX, SystemMemory, 0xFED80D00, 0x0100)
        Field (IOMX, AnyAcc, NoLock, Preserve)
        {
            Offset (0x15), 
            IM15,   8, 
            IM16,   8, 
            Offset (0x1F), 
            IM1F,   8, 
            IM20,   8, 
            Offset (0x44), 
            IM44,   8, 
            Offset (0x46), 
            IM46,   8, 
            Offset (0x4A), 
            IM4A,   8, 
            IM4B,   8, 
            Offset (0x57), 
            IM57,   8, 
            IM58,   8, 
            Offset (0x68), 
            IM68,   8, 
            IM69,   8, 
            IM6A,   8, 
            IM6B,   8, 
            Offset (0x6D), 
            IM6D,   8
        }
        OperationRegion (FMIS, SystemMemory, 0xFED80E00, 0x0100)
        Field (FMIS, AnyAcc, NoLock, Preserve)
        {
            Offset (0x40), 
                ,   13, 
            I24M,   1
        }
        OperationRegion (FGIO, SystemMemory, 0xFED81500, 0x0300)
        Field (FGIO, AnyAcc, NoLock, Preserve)
        {
            Offset (0xA8), 
                ,   22, 
            O042,   1, 
            Offset (0x164), 
                ,   22, 
            O089,   1
        }
        OperationRegion (FACR, SystemMemory, 0xFED81E00, 0x0100)
        Field (FACR, AnyAcc, NoLock, Preserve)
        {
            Offset (0x80), 
                ,   28, 
            RD28,   1, 
                ,   1, 
            RQTY,   1, 
            Offset (0x84), 
                ,   28, 
            SD28,   1, 
                ,   1, 
            Offset (0xA0), 
            PG1A,   1
        }
        OperationRegion (EMMX, SystemMemory, 0xFEDD5800, 0x0130)
        Field (EMMX, AnyAcc, NoLock, Preserve)
        {
            Offset (0xD0), 
                ,   17, 
            FC18,   1, 
            FC33,   1, 
                ,   7, 
            CD_T,   1, 
            WP_T,   1
        }
        OperationRegion (EMMB, SystemMemory, 0xFEDD5800, 0x0130)
        Field (EMMB, AnyAcc, NoLock, Preserve)
        {
            Offset (0xA4), 
            E0A4,   32, 
            E0A8,   32, 
            Offset (0xB0), 
            E0B0,   32, 
            Offset (0xD0), 
            E0D0,   32, 
            Offset (0x116), 
            E116,   32
        }
        Name (SVBF, Buffer (0x0100)
        {
             0x00
        })
        CreateDWordField (SVBF, Zero, S0A4)
        CreateDWordField (SVBF, 0x04, S0A8)
        CreateDWordField (SVBF, 0x08, S0B0)
        CreateDWordField (SVBF, 0x0C, S0D0)
        CreateDWordField (SVBF, 0x10, S116)
        Method (SECR, 0, Serialized)
        {
            Store (E116, S116)
            Store (Zero, RQTY)
            Store (One, RD28)
            Store (SD28, Local0)
            While (Local0)
            {
                Store (SD28, Local0)
            }
        }
        Method (RECR, 0, Serialized)
        {
            Store (S116, E116)
        }
        OperationRegion (LUIE, SystemMemory, 0xFEDC0020, 0x04)
        Field (LUIE, AnyAcc, NoLock, Preserve)
        {
            IER0,   1, 
            IER1,   1, 
            IER2,   1, 
            IER3,   1, 
            UOL0,   1, 
            UOL1,   1, 
            UOL2,   1, 
            UOL3,   1, 
            WUR0,   2, 
            WUR1,   2, 
            WUR2,   2, 
            WUR3,   2
        }
        Method (FRUI, 1, Serialized)
        {
            If (LEqual (Arg0, Zero))
            {
                Return (IUA0)
            }
            If (LEqual (Arg0, One))
            {
                Return (IUA1)
            }
            If (LEqual (Arg0, 0x02))
            {
                Return (IUA2)
            }
            If (LEqual (Arg0, 0x03))
            {
                Return (IUA3)
            }
        }
        Method (SRAD, 2, Serialized)
        {
            ShiftLeft (Arg0, One, Local0)
            Add (Local0, 0xFED81E40, Local0)
            OperationRegion (ADCR, SystemMemory, Local0, 0x02)
            Field (ADCR, ByteAcc, NoLock, Preserve)
            {
                ADTD,   2, 
                ADPS,   1, 
                ADPD,   1, 
                ADSO,   1, 
                ADSC,   1, 
                ADSR,   1, 
                ADIS,   1, 
                ADDS,   3
            }
            Store (One, ADIS)
            Store (Zero, ADSR)
            Stall (Arg1)
            Store (One, ADSR)
            Store (Zero, ADIS)
            Stall (Arg1)
        }
        Method (DSAD, 2, Serialized)
        {
            ShiftLeft (Arg0, One, Local0)
            Add (Local0, 0xFED81E40, Local0)
            OperationRegion (ADCR, SystemMemory, Local0, 0x02)
            Field (ADCR, ByteAcc, NoLock, Preserve)
            {
                ADTD,   2, 
                ADPS,   1, 
                ADPD,   1, 
                ADSO,   1, 
                ADSC,   1, 
                ADSR,   1, 
                ADIS,   1, 
                ADDS,   3
            }
            If (LNotEqual (Arg1, ADTD))
            {
                If (LEqual (Arg1, Zero))
                {
                    Store (Zero, ADTD)
                    Store (One, ADPD)
                    Store (ADDS, Local0)
                    While (LNotEqual (Local0, 0x07))
                    {
                        Store (ADDS, Local0)
                    }
                }
                If (LEqual (Arg1, 0x03))
                {
                    Store (Zero, ADPD)
                    Store (ADDS, Local0)
                    While (LNotEqual (Local0, Zero))
                    {
                        Store (ADDS, Local0)
                    }
                    Store (0x03, ADTD)
                }
            }
        }
        Method (HSAD, 2, Serialized)
        {
            ShiftLeft (One, Arg0, Local3)
            ShiftLeft (Arg0, One, Local0)
            Add (Local0, 0xFED81E40, Local0)
            OperationRegion (ADCR, SystemMemory, Local0, 0x02)
            Field (ADCR, ByteAcc, NoLock, Preserve)
            {
                ADTD,   2, 
                ADPS,   1, 
                ADPD,   1, 
                ADSO,   1, 
                ADSC,   1, 
                ADSR,   1, 
                ADIS,   1, 
                ADDS,   3
            }
            If (LNotEqual (Arg1, ADTD))
            {
                If (LEqual (Arg1, Zero))
                {
                    Store (Zero, ADTD)
                    Store (One, ADPD)
                    Store (ADDS, Local0)
                    While (LNotEqual (Local0, 0x07))
                    {
                        Store (ADDS, Local0)
                    }
                    Store (One, RQTY)
                    Store (One, RD28)
                    Store (SD28, Local0)
                    While (LNot (Local0))
                    {
                        Store (SD28, Local0)
                    }
                }
                If (LEqual (Arg1, 0x03))
                {
                    Store (Zero, RQTY)
                    Store (One, RD28)
                    Store (SD28, Local0)
                    While (Local0)
                    {
                        Store (SD28, Local0)
                    }
                    Store (Zero, ADPD)
                    Store (ADDS, Local0)
                    While (LNotEqual (Local0, Zero))
                    {
                        Store (ADDS, Local0)
                    }
                    Store (0x03, ADTD)
                }
            }
        }
        OperationRegion (FPIC, SystemIO, 0x0C00, 0x02)
        Field (FPIC, AnyAcc, NoLock, Preserve)
        {
            FPII,   8, 
            FPID,   8
        }
        IndexField (FPII, FPID, ByteAcc, NoLock, Preserve)
        {
            Offset (0xF4), 
            IUA0,   8, 
            IUA1,   8, 
            Offset (0xF8), 
            IUA2,   8, 
            IUA3,   8
        }
        Device (GPIO)
        {
            Name (_HID, "AMDI0030")
            Name (_CID, "AMDI0030")
            Name (_UID, Zero)
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    Interrupt (ResourceConsumer, Level, ActiveLow, Shared, ,, )
                    {
                        0x00000007,
                    }
                    Memory32Fixed (ReadWrite,
                        0xFED81500,         // Address Base
                        0x00000400,         // Address Length
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LGreaterEqual (TSOS, 0x70))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (FUR0)
        {
            Name (_HID, "AMDI0020")
            Name (_UID, Zero)
            Name (_CRS, ResourceTemplate ()
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {3}
                Memory32Fixed (ReadWrite,
                    0xFEDC9000,         // Address Base
                    0x00001000,         // Address Length
                    )
                Memory32Fixed (ReadWrite,
                    0xFEDC7000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)
            {
                If (LGreaterEqual (TSOS, 0x70))
                {
                    If (LEqual (UT0E, One))
                    {
                        If (UOL0)
                        {
                            Return (Zero)
                        }
                        Return (0x0F)
                    }
                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Method (_S0W, 0, NotSerialized)
            {
                If (LAnd (UT0D, UT0E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Method (_PS0, 0, NotSerialized)
            {
                If (LAnd (UT0D, UT0E))
                {
                    DSAD (0x0B, Zero)
                }
            }
            Method (_PS3, 0, NotSerialized)
            {
                If (LAnd (UT0D, UT0E))
                {
                    DSAD (0x0B, 0x03)
                }
            }
        }
        Device (FUR1)
        {
            Name (_HID, "AMDI0020")
            Name (_UID, One)
            Name (_CRS, ResourceTemplate ()
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {4}
                Memory32Fixed (ReadWrite,
                    0xFEDCA000,         // Address Base
                    0x00001000,         // Address Length
                    )
                Memory32Fixed (ReadWrite,
                    0xFEDC8000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)
            {
                If (LGreaterEqual (TSOS, 0x70))
                {
                    If (LEqual (UT1E, One))
                    {
                        If (UOL1)
                        {
                            Return (Zero)
                        }
                        Return (0x0F)
                    }
                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Method (_S0W, 0, NotSerialized)
            {
                If (LAnd (UT1D, UT1E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Method (_PS0, 0, NotSerialized)
            {
                If (LAnd (UT1D, UT1E))
                {
                    DSAD (0x0C, Zero)
                }
            }
            Method (_PS3, 0, NotSerialized)
            {
                If (LAnd (UT1D, UT1E))
                {
                    DSAD (0x0C, 0x03)
                }
            }
        }
        Device (FUR2)
        {
            Name (_HID, "AMDI0020")
            Name (_UID, 0x02)
            Name (_CRS, ResourceTemplate ()
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {15}
                Memory32Fixed (ReadWrite,
                    0xFEDCE000,         // Address Base
                    0x00001000,         // Address Length
                    )
                Memory32Fixed (ReadWrite,
                    0xFEDCC000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)
            {
                If (LGreaterEqual (TSOS, 0x70))
                {
                    If (LEqual (UT2E, One))
                    {
                        If (UOL2)
                        {
                            Return (Zero)
                        }
                        Return (0x0F)
                    }
                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Method (_S0W, 0, NotSerialized)
            {
                If (LAnd (UT2D, UT2E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Method (_PS0, 0, NotSerialized)
            {
                If (LAnd (UT2D, UT2E))
                {
                    DSAD (0x10, Zero)
                }
            }
            Method (_PS3, 0, NotSerialized)
            {
                If (LAnd (UT2D, UT2E))
                {
                    DSAD (0x10, 0x03)
                }
            }
        }
        Device (FUR3)
        {
            Name (_HID, "AMDI0020")
            Name (_UID, 0x03)
            Name (_CRS, ResourceTemplate ()
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {5}
                Memory32Fixed (ReadWrite,
                    0xFEDCF000,         // Address Base
                    0x00001000,         // Address Length
                    )
                Memory32Fixed (ReadWrite,
                    0xFEDCD000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)
            {
                If (LGreaterEqual (TSOS, 0x70))
                {
                    If (LEqual (UT3E, One))
                    {
                        If (UOL3)
                        {
                            Return (Zero)
                        }
                        Return (0x0F)
                    }
                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Method (_S0W, 0, NotSerialized)
            {
                If (LAnd (UT3D, UT3E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Method (_PS0, 0, NotSerialized)
            {
                If (LAnd (UT3D, UT3E))
                {
                    DSAD (0x1A, Zero)
                }
            }
            Method (_PS3, 0, NotSerialized)
            {
                If (LAnd (UT3D, UT3E))
                {
                    DSAD (0x1A, 0x03)
                }
            }
        }
        Device (I2CA)
        {
            Name (_HID, "AMDI0011")
            Name (_UID, Zero)
            Name (_ADR, Zero)
            Name (_CRS, ResourceTemplate ()
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {10}
                Memory32Fixed (ReadWrite,
                    0xFEDC2000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Name (_DEP, Package (0x01)
            {
                ^PCI0.GP17.MP2C
            })
            Method (_STA, 0, NotSerialized)
            {
                If (LGreaterEqual (TSOS, 0x70))
                {
                    If (LEqual (IC0E, One))
                    {
                        If (LEqual (NI2C, Zero))
                        {
                            Return (0x0F)
                        }
                    }
                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x05, 0xC8)
            }
        }
        Device (I2CB)
        {
            Name (_HID, "AMDI0011")
            Name (_UID, One)
            Name (_ADR, One)
            Name (_CRS, ResourceTemplate ()
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {11}
                Memory32Fixed (ReadWrite,
                    0xFEDC3000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Name (_DEP, Package (0x01)
            {
                ^PCI0.GP17.MP2C
            })
            Method (_STA, 0, NotSerialized)
            {
                If (LGreaterEqual (TSOS, 0x70))
                {
                    If (LEqual (IC1E, One))
                    {
                        If (LEqual (NI2C, Zero))
                        {
                            Return (0x0F)
                        }
                    }
                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x06, 0xC8)
            }
        }
        Device (I2CC)
        {
            Name (_HID, "AMDI0010")
            Name (_UID, 0x02)
            Name (_CRS, ResourceTemplate ()
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {14}
                Memory32Fixed (ReadWrite,
                    0xFEDC4000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)
            {
                If (LGreaterEqual (TSOS, 0x70))
                {
                    If (LEqual (IC2E, One))
                    {
                        Return (0x0F)
                    }
                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x07, 0xC8)
            }
            Method (_S0W, 0, NotSerialized)
            {
                If (LAnd (IC2D, IC2E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Method (_PS0, 0, NotSerialized)
            {
                If (LAnd (IC2D, IC2E))
                {
                    DSAD (0x07, Zero)
                }
            }
            Method (_PS3, 0, NotSerialized)
            {
                If (LAnd (IC2D, IC2E))
                {
                    DSAD (0x07, 0x03)
                }
            }
        }
        Device (I2CD)
        {
            Name (_HID, "AMDI0010")
            Name (_UID, 0x03)
            Name (_CRS, ResourceTemplate ()
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {6}
                Memory32Fixed (ReadWrite,
                    0xFEDC5000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)
            {
                If (LGreaterEqual (TSOS, 0x70))
                {
                    If (LEqual (IC3E, One))
                    {
                        Return (0x0F)
                    }
                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x08, 0xC8)
            }
            Method (_S0W, 0, NotSerialized)
            {
                If (LAnd (IC3D, IC3E))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Method (_PS0, 0, NotSerialized)
            {
                If (LAnd (IC3D, IC3E))
                {
                    DSAD (0x08, Zero)
                }
            }
            Method (_PS3, 0, NotSerialized)
            {
                If (LAnd (IC3D, IC3E))
                {
                    DSAD (0x08, 0x03)
                }
            }
        }
        Device (I2CE)
        {
            Name (_HID, "AMDI0010")
            Name (_UID, Zero)
            Name (_CRS, ResourceTemplate ()
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {10}
                Memory32Fixed (ReadWrite,
                    0xFEDC2000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)
            {
                If (LGreaterEqual (TSOS, 0x70))
                {
                    If (LEqual (IC0E, One))
                    {
                        If (LEqual (NI2C, One))
                        {
                            Return (0x0F)
                        }
                    }
                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x09, 0xC8)
            }
        }
        Device (I2CF)
        {
            Name (_HID, "AMDI0010")
            Name (_UID, One)
            Name (_CRS, ResourceTemplate ()
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {11}
                Memory32Fixed (ReadWrite,
                    0xFEDC3000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)
            {
                If (LGreaterEqual (TSOS, 0x70))
                {
                    If (LEqual (IC1E, One))
                    {
                        If (LEqual (NI2C, One))
                        {
                            Return (0x0F)
                        }
                    }
                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Method (RSET, 0, NotSerialized)
            {
                SRAD (0x0A, 0xC8)
            }
        }
        Method (EPIN, 0, NotSerialized)
        {
            Store (Zero, IPDE)
            Store (0xFF00, IMPE)
            Store (One, IM15)
            Store (One, IM16)
            Store (One, IM20)
            Store (One, IM44)
            Store (One, IM46)
            Store (One, IM68)
            Store (One, IM69)
            Store (One, IM6A)
            Store (One, IM6B)
            Store (One, IM4A)
            Store (One, IM58)
            Store (One, IM4B)
            Store (One, IM57)
            Store (One, IM6D)
            Store (One, IM1F)
            SECR ()
        }
        Name (NCRS, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5}
            Memory32Fixed (ReadWrite,
                0xFEDD5000,         // Address Base
                0x00001000,         // Address Length
                )
        })
        Name (DCRS, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5}
            Memory32Fixed (ReadWrite,
                0xFEDD5000,         // Address Base
                0x00001000,         // Address Length
                )
            GpioInt (Edge, ActiveHigh, Shared, PullUp, 0x0BB8,
                "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                )
                {   
// Pin list
                    0x0044
                }
            GpioIo (Shared, PullUp, 0x0000, 0x0000, IoRestrictionNone,
                "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                )
                {   
// Pin list
                    0x0044
                }
        })
        Name (ECRS, ResourceTemplate ()
        {
            IRQ (Level, ActiveLow, Shared, )
                {5}
            Memory32Fixed (ReadWrite,
                0xFEDD5000,         // Address Base
                0x00001000,         // Address Length
                )
            GpioInt (Edge, ActiveLow, Shared, PullUp, 0x0BB8,
                "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                )
                {   
// Pin list
                    0x0044
                }
        })
        Name (AHID, "AMDI0040")
        Name (ACID, "AMDI0040")
        Name (MHID, "AMDI0041")
        Name (MCID, "AMDI0041")
        Name (SHID, 0x400DD041)
        Name (SCID, "PCICC_080501")
        Device (EMM0)
        {
            Method (_HID, 0, Serialized)
            {
                If (LEqual (EMMD, Zero))
                {
                    Return (AHID)
                }
                If (LEqual (EMMD, One))
                {
                    Return (SHID)
                }
                If (LEqual (EMMD, 0x02))
                {
                    Return (MHID)
                }
            }
            Method (_CID, 0, Serialized)
            {
                If (LEqual (EMMD, Zero))
                {
                    Return (ACID)
                }
                If (LEqual (EMMD, One))
                {
                    Return (SCID)
                }
                If (LEqual (EMMD, 0x02))
                {
                    Return (MCID)
                }
            }
            Name (_UID, Zero)
            Method (_CRS, 0, Serialized)
            {
                If (EMD3)
                {
                    If (LEqual (EMMD, One))
                    {
                        Return (DCRS)
                    }
                    Return (ECRS)
                }
                Else
                {
                    Return (NCRS)
                }
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LGreaterEqual (TSOS, 0x70))
                {
                    If (EMME)
                    {
                        Return (0x0F)
                    }
                    Return (Zero)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Method (_INI, 0, NotSerialized)
            {
                If (EMME)
                {
                    EPIN ()
                }
            }
            Method (_S0W, 0, NotSerialized)
            {
                If (LAnd (EMD3, EMME))
                {
                    Return (0x04)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Method (_PS0, 0, NotSerialized)
            {
                If (LAnd (EMD3, EMME))
                {
                    HSAD (0x1C, Zero)
                    RECR ()
                }
            }
            Method (_PS3, 0, NotSerialized)
            {
                If (LAnd (EMD3, EMME))
                {
                    HSAD (0x1C, 0x03)
                }
            }
            Device (CARD)
            {
                Name (_ADR, Zero)
                Method (_RMV, 0, NotSerialized)
                {
                    If (LEqual (EMMD, Zero))
                    {
                        Return (One)
                    }
                    Return (Zero)
                }
            }
        }
        Name (D0ST, One)
        Name (D3ST, One)
        PowerResource (P0ST, 0x00, 0x0000)
        {
            Method (_STA, 0, NotSerialized)
            {
                Return (D0ST)
            }
            Method (_ON, 0, NotSerialized)
            {
                Store (One, D0ST)
            }
            Method (_OFF, 0, NotSerialized)
            {
                Store (Zero, D0ST)
            }
        }
        PowerResource (P3ST, 0x00, 0x0000)
        {
            Method (_STA, 0, NotSerialized)
            {
                Return (D3ST)
            }
            Method (_ON, 0, NotSerialized)
            {
                Store (One, D3ST)
            }
            Method (_OFF, 0, NotSerialized)
            {
                Store (Zero, D3ST)
            }
        }
    }
    Scope (_SB.PCI0)
    {
        Device (UAR1)
        {
            Name (_HID, EisaId ("PNP0501"))
            Name (_DDN, "COM4")
            Name (_UID, 0x04)
            Method (_STA, 0, NotSerialized)
            {
                If (IER0)
                {
                    Return (0x0F)
                }
                Return (Zero)
            }
            Method (_CRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x02E8,             // Range Minimum
                        0x02E8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        _Y09)
                    IRQNoFlags (_Y0A)
                        {3}
                })
                CreateByteField (BUF0, \_SB.PCI0.UAR1._CRS._Y09._MIN, IOLO)
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, \_SB.PCI0.UAR1._CRS._Y09._MAX, IORL)
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, \_SB.PCI0.UAR1._CRS._Y0A._INT, IRQL)
                ShiftLeft (One, FRUI (WUR0), IRQL)
                Return (BUF0)
            }
        }
        Device (UAR2)
        {
            Name (_HID, EisaId ("PNP0501"))
            Name (_DDN, "COM2")
            Name (_UID, 0x02)
            Method (_STA, 0, NotSerialized)
            {
                If (IER1)
                {
                    Return (0x0F)
                }
                Return (Zero)
            }
            Method (_CRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x02F8,             // Range Minimum
                        0x02F8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        _Y0B)
                    IRQNoFlags (_Y0C)
                        {4}
                })
                CreateByteField (BUF0, \_SB.PCI0.UAR2._CRS._Y0B._MIN, IOLO)
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, \_SB.PCI0.UAR2._CRS._Y0B._MAX, IORL)
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, \_SB.PCI0.UAR2._CRS._Y0C._INT, IRQL)
                ShiftLeft (One, FRUI (WUR1), IRQL)
                Return (BUF0)
            }
        }
        Device (UAR3)
        {
            Name (_HID, EisaId ("PNP0501"))
            Name (_DDN, "COM3")
            Name (_UID, 0x03)
            Method (_STA, 0, NotSerialized)
            {
                If (IER2)
                {
                    Return (0x0F)
                }
                Return (Zero)
            }
            Method (_CRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x03E8,             // Range Minimum
                        0x03E8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        _Y0D)
                    IRQNoFlags (_Y0E)
                        {3}
                })
                CreateByteField (BUF0, \_SB.PCI0.UAR3._CRS._Y0D._MIN, IOLO)
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, \_SB.PCI0.UAR3._CRS._Y0D._MAX, IORL)
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, \_SB.PCI0.UAR3._CRS._Y0E._INT, IRQL)
                ShiftLeft (One, FRUI (WUR2), IRQL)
                Return (BUF0)
            }
        }
        Device (UAR4)
        {
            Name (_HID, EisaId ("PNP0501"))
            Name (_DDN, "COM1")
            Name (_UID, One)
            Method (_STA, 0, NotSerialized)
            {
                If (IER3)
                {
                    Return (0x0F)
                }
                Return (Zero)
            }
            Method (_CRS, 0, NotSerialized)
            {
                Name (BUF0, ResourceTemplate ()
                {
                    IO (Decode16,
                        0x03F8,             // Range Minimum
                        0x03F8,             // Range Maximum
                        0x01,               // Alignment
                        0x08,               // Length
                        _Y0F)
                    IRQNoFlags (_Y10)
                        {4}
                })
                CreateByteField (BUF0, \_SB.PCI0.UAR4._CRS._Y0F._MIN, IOLO)
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, \_SB.PCI0.UAR4._CRS._Y0F._MAX, IORL)
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, \_SB.PCI0.UAR4._CRS._Y10._INT, IRQL)
                ShiftLeft (One, FRUI (WUR3), IRQL)
                Return (BUF0)
            }
        }
    }
    Scope (_SB.PCI0.GP17.VGA)
    {
        Device (CAMF)
        {
            Name (_ADR, 0x1000)
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (O042, One))
                {
                    Return (0x0F)
                }
                Return (0x0B)
            }
            Method (_PS0, 0, NotSerialized)
            {
                Store (One, O042)
            }
            Method (_PS3, 0, NotSerialized)
            {
                Store (Zero, O042)
            }
        }
        Device (CAMR)
        {
            Name (_ADR, 0x2000)
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (O089, One))
                {
                    Return (0x0F)
                }
                Return (0x0B)
            }
            Method (_PS0, 0, NotSerialized)
            {
                Store (One, O089)
            }
            Method (_PS3, 0, NotSerialized)
            {
                Store (Zero, O089)
            }
        }
        Method (RCPU, 0, NotSerialized)
        {
            Store (One, O089)
        }
        Method (RCPD, 0, NotSerialized)
        {
            Store (Zero, O089)
        }
        Method (FCPU, 0, NotSerialized)
        {
            Store (One, O042)
        }
        Method (FCPD, 0, NotSerialized)
        {
            Store (Zero, O042)
        }
        Method (ICLE, 0, NotSerialized)
        {
            Store (Zero, I24M)
        }
        Method (ICLD, 0, NotSerialized)
        {
            Store (One, I24M)
        }
    }
    Scope (_SB.PCI0.GP18.SATA)
    {
        Name (_PR0, Package (0x01)
        {
            P0ST
        })
        Name (_PR3, Package (0x01)
        {
            P3ST
        })
        Method (_S0W, 0, NotSerialized)
        {
            If (LEqual (ST_D, One))
            {
                Return (0x04)
            }
            Else
            {
                Return (Zero)
            }
        }
        Method (_PS0, 0, NotSerialized)
        {
            If (LEqual (ST_D, One))
            {
                Store (0x88, IO80)
                Store (0xD6, SMIW)
            }
        }
        Method (_PS3, 0, NotSerialized)
        {
            If (LEqual (ST_D, One))
            {
                Store (0x77, IO80)
                Store (0xD5, SMIW)
            }
        }
    }
    Scope (_SB.FUR0)
    {
        Device (UART)
        {
            Name (_HID, "UTK0001")
            Name (_CID, "UARTTest")
            Name (_UID, Zero)
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    UartSerialBus (0x0001C200, DataBitsEight, StopBitsOne,
                        0xC0, LittleEndian, ParityTypeNone, FlowControlHardware,
                        0x0020, 0x0020, "\\_SB.FUR0",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
    Scope (_SB.FUR1)
    {
        Device (UART)
        {
            Name (_HID, "UTK0001")
            Name (_CID, "UARTTest")
            Name (_UID, One)
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    UartSerialBus (0x0001C200, DataBitsEight, StopBitsOne,
                        0xC0, LittleEndian, ParityTypeNone, FlowControlHardware,
                        0x0020, 0x0020, "\\_SB.FUR1",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
    Scope (_SB.I2CA)
    {
        Device (WTP1)
        {
            Name (_ADR, Zero)
            Name (_HID, "STK0001")
            Name (_CID, "SPBTestKMDF")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x007F, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB.I2CA",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (MTP1)
        {
            Name (_HID, "STK0001")
            Name (_CID, "WITTTest")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0011, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB_.I2CA",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (WTP2)
        {
            Name (_ADR, Zero)
            Name (_HID, "STK0002")
            Name (_CID, "SPBTestKMDF")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0011, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB.I2CA",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (MTP2)
        {
            Name (_HID, "STK0002")
            Name (_CID, "WITTTest")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0012, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB_.I2CA",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (WTP3)
        {
            Name (_ADR, Zero)
            Name (_HID, "STK0003")
            Name (_CID, "SPBTestKMDF")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0012, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2CA",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (MTP3)
        {
            Name (_HID, "STK0003")
            Name (_CID, "WITTTest")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0013, ControllerInitiated, 0x000F4240,
                        AddressingMode7Bit, "\\_SB_.I2CA",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (WTP4)
        {
            Name (_ADR, Zero)
            Name (_HID, "STK0004")
            Name (_CID, "SPBTestKMDF")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0013, ControllerInitiated, 0x000F4240,
                        AddressingMode7Bit, "\\_SB.I2CA",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (MTP4)
        {
            Name (_HID, "STK0004")
            Name (_CID, "WITTTest")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0014, ControllerInitiated, 0x000222E0,
                        AddressingMode7Bit, "\\_SB_.I2CA",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (MTP5)
        {
            Name (_HID, "STK0005")
            Name (_CID, "WITTTest")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0015, ControllerInitiated, 0x00053020,
                        AddressingMode7Bit, "\\_SB_.I2CA",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
    Scope (_SB.I2CB)
    {
        Device (WT21)
        {
            Name (_ADR, Zero)
            Name (_HID, "STK00012")
            Name (_CID, "SPBTestKMDF2")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x007F, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB.I2CB",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (MT21)
        {
            Name (_HID, "STK00012")
            Name (_CID, "WITTTest")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0011, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB_.I2CB",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (WT22)
        {
            Name (_ADR, Zero)
            Name (_HID, "STK00022")
            Name (_CID, "SPBTestKMDF2")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0011, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB.I2CB",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (MT22)
        {
            Name (_HID, "STK00022")
            Name (_CID, "WITTTest")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0012, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB_.I2CB",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (WT23)
        {
            Name (_ADR, Zero)
            Name (_HID, "STK00032")
            Name (_CID, "SPBTestKMDF2")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0012, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2CB",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (MT23)
        {
            Name (_HID, "STK00032")
            Name (_CID, "WITTTest")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0013, ControllerInitiated, 0x000F4240,
                        AddressingMode7Bit, "\\_SB_.I2CB",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (WT24)
        {
            Name (_ADR, Zero)
            Name (_HID, "STK00042")
            Name (_CID, "SPBTestKMDF2")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0013, ControllerInitiated, 0x000F4240,
                        AddressingMode7Bit, "\\_SB.I2CB",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (MT24)
        {
            Name (_HID, "STK00042")
            Name (_CID, "WITTTest")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0014, ControllerInitiated, 0x000222E0,
                        AddressingMode7Bit, "\\_SB_.I2CB",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (MT25)
        {
            Name (_HID, "STK00052")
            Name (_CID, "WITTTest")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0015, ControllerInitiated, 0x00053020,
                        AddressingMode7Bit, "\\_SB_.I2CB",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
    Scope (_SB.I2CC)
    {
        Device (WT31)
        {
            Name (_ADR, Zero)
            Name (_HID, "STK00013")
            Name (_CID, "SPBTestKMDF3")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x007F, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB.I2CC",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (MT31)
        {
            Name (_HID, "STK00013")
            Name (_CID, "WITTTest")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0011, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB_.I2CC",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (WT32)
        {
            Name (_ADR, Zero)
            Name (_HID, "STK00023")
            Name (_CID, "SPBTestKMDF3")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0011, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB.I2CC",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (MT32)
        {
            Name (_HID, "STK00023")
            Name (_CID, "WITTTest")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0012, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB_.I2CC",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (WT33)
        {
            Name (_ADR, Zero)
            Name (_HID, "STK00033")
            Name (_CID, "SPBTestKMDF3")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0012, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2CC",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (MT33)
        {
            Name (_HID, "STK00033")
            Name (_CID, "WITTTest")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0013, ControllerInitiated, 0x000F4240,
                        AddressingMode7Bit, "\\_SB_.I2CC",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (WT34)
        {
            Name (_ADR, Zero)
            Name (_HID, "STK00043")
            Name (_CID, "SPBTestKMDF3")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0013, ControllerInitiated, 0x000F4240,
                        AddressingMode7Bit, "\\_SB.I2CC",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (MT34)
        {
            Name (_HID, "STK00043")
            Name (_CID, "WITTTest")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0014, ControllerInitiated, 0x000222E0,
                        AddressingMode7Bit, "\\_SB_.I2CC",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (MT35)
        {
            Name (_HID, "STK00053")
            Name (_CID, "WITTTest")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0015, ControllerInitiated, 0x00053020,
                        AddressingMode7Bit, "\\_SB_.I2CC",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
    Scope (_SB.I2CD)
    {
        Device (WT41)
        {
            Name (_ADR, Zero)
            Name (_HID, "STK00014")
            Name (_CID, "SPBTestKMDF4")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x007F, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB.I2CD",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (MT41)
        {
            Name (_HID, "STK00014")
            Name (_CID, "WITTTest")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0011, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB_.I2CD",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (WT42)
        {
            Name (_ADR, Zero)
            Name (_HID, "STK00024")
            Name (_CID, "SPBTestKMDF4")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0011, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB.I2CD",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (MT42)
        {
            Name (_HID, "STK00024")
            Name (_CID, "WITTTest")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0012, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB_.I2CD",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (WT43)
        {
            Name (_ADR, Zero)
            Name (_HID, "STK00034")
            Name (_CID, "SPBTestKMDF4")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0012, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2CD",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (MT43)
        {
            Name (_HID, "STK00034")
            Name (_CID, "WITTTest")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0013, ControllerInitiated, 0x000F4240,
                        AddressingMode7Bit, "\\_SB_.I2CD",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (WT44)
        {
            Name (_ADR, Zero)
            Name (_HID, "STK00044")
            Name (_CID, "SPBTestKMDF4")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0013, ControllerInitiated, 0x000F4240,
                        AddressingMode7Bit, "\\_SB.I2CD",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, One))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (MT44)
        {
            Name (_HID, "STK00044")
            Name (_CID, "WITTTest")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0014, ControllerInitiated, 0x000222E0,
                        AddressingMode7Bit, "\\_SB_.I2CD",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
        Device (MT45)
        {
            Name (_HID, "STK00054")
            Name (_CID, "WITTTest")
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0015, ControllerInitiated, 0x00053020,
                        AddressingMode7Bit, "\\_SB_.I2CD",
                        0x00, ResourceConsumer, ,
                        )
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LEqual (MWTT, Zero))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
        }
    }
    Scope (\)
    {
        OperationRegion (COMP, SystemMemory, 0xBF77A418, 0x0200)
        Field (COMP, AnyAcc, Lock, Preserve)
        {
            IDMN,   16, 
            IDPC,   16, 
            BDDD,   8, 
            CPFB,   8, 
            PBTI,   8, 
            BRLV,   8, 
            CAVR,   8, 
            TJMA,   16, 
            CORE,   8, 
            CG12,   8, 
            CG13,   8, 
            CG14,   8, 
            CG15,   8, 
            CG16,   8, 
            CG17,   8, 
            CG18,   8, 
            CG19,   8, 
            CG20,   8, 
            CG21,   8, 
            CG22,   8, 
            CG23,   8, 
            CG24,   8, 
            CG25,   8, 
            CG26,   8, 
            CG27,   8, 
            CG28,   8, 
            CG29,   8, 
            CG30,   8, 
            CG31,   8, 
            SFNO,   16, 
            STDT,   16, 
            BFDT,   1024, 
            RSR1,   736, 
            IDFD,   1024, 
            MPMS,   8, 
            RSR2,   1016
        }
        OperationRegion (SMIO, SystemIO, 0xB0, 0x02)
        Field (SMIO, ByteAcc, NoLock, Preserve)
        {
            SMMC,   8, 
            SMMD,   8
        }
    }
    Scope (_SB.PCI0.LPC0)
    {
        Method (ECOK, 0, NotSerialized)
        {
            If (LEqual (^EC0.OKEC, One))
            {
                Return (One)
            }
            Else
            {
                Return (Zero)
            }
        }
        Device (EC0)
        {
            Name (_HID, EisaId ("PNP0C09"))
            Name (_GPE, 0x03)
            Name (OKEC, One)
            Name (_CRS, ResourceTemplate ()
            {
                IO (Decode16,
                    0x0062,             // Range Minimum
                    0x0062,             // Range Maximum
                    0x01,               // Alignment
                    0x01,               // Length
                    )
                IO (Decode16,
                    0x0066,             // Range Minimum
                    0x0066,             // Range Maximum
                    0x01,               // Alignment
                    0x01,               // Length
                    )
            })
            Method (_REG, 2, NotSerialized)
            {
                If (LEqual (Arg0, 0x03))
                {
                    Store (Arg1, OKEC)
                    Store (One, ECRD)
                    Store (0x03, NPST)
                    Store (PSSP, PSED)
                    Notify (LID, 0x80)
                }
            }
            Method (CMDW, 2, NotSerialized)
            {
                Name (TEMP, One)
                Name (RTEM, Zero)
                While (TEMP)
                {
                    Store (Zero, ECPC)
                    Store (ECPC, TEMP)
                }
                Store (One, ECPC)
                Store (Arg0, ECMB)
                Store (Arg1, EDTB)
                Store (One, ECST)
                Store (One, TEMP)
                While (TEMP)
                {
                    Store (ECST, TEMP)
                }
                Store (Zero, ECPC)
            }
            OperationRegion (ECMP, SystemMemory, 0xFE0B0000, 0x1000)
            Field (ECMP, AnyAcc, Lock, Preserve)
            {
                Offset (0x800), 
                REC1,   8, 
                REC2,   8, 
                WEC1,   8, 
                WEC2,   8, 
                WMIM,   8, 
                ACKM,   1, 
                Offset (0x806), 
                STMS,   2, 
                MBMS,   2, 
                ACLS,   1, 
                MBSS,   1, 
                CSHE,   1, 
                ACSP,   1, 
                PSAC,   1, 
                PSBC,   1, 
                PSED,   1, 
                Offset (0x808), 
                PSPD,   8, 
                BCPD,   8, 
                BSTH,   8, 
                PRDT,   8, 
                PSSE,   8, 
                CPTP,   8, 
                SAID,   8, 
                FANE,   1, 
                CPUO,   1, 
                M4GO,   1, 
                FNSW,   1, 
                SBTC,   1, 
                    ,   2, 
                OHP0,   1, 
                IBCL,   8, 
                FRPM,   8, 
                FNMX,   8, 
                FNMN,   8, 
                FWPM,   8, 
                RSTV,   8, 
                CPTV,   8, 
                GPTV,   8, 
                PHTV,   8, 
                FNTV,   8, 
                BTTV,   8, 
                HDTV,   8, 
                    ,   3, 
                SK6U,   1, 
                    ,   2, 
                FNHK,   1, 
                Offset (0x81D), 
                Offset (0x821), 
                BTNO,   8, 
                Offset (0x823), 
                DTCL,   3, 
                Offset (0x825), 
                CFBE,   1, 
                EPCF,   1, 
                Offset (0x82A), 
                PBSM,   2, 
                SBSM,   2, 
                Offset (0x82B), 
                Offset (0x82D), 
                BCTL,   128, 
                Offset (0x84D), 
                PENS,   120, 
                WACL,   1, 
                AADT,   1, 
                Offset (0x85D), 
                ENSI,   8, 
                ENSB,   8, 
                ENSD,   8, 
                SMBP,   8, 
                SMBS,   5, 
                    ,   1, 
                SMAL,   1, 
                SMDN,   1, 
                SMAR,   8, 
                SMCD,   8, 
                SMDA,   256, 
                SMBC,   8, 
                SALA,   8, 
                SAD0,   8, 
                SAD1,   8, 
                Offset (0x8AE), 
                CPTR,   8, 
                Offset (0x8B4), 
                GPTP,   8, 
                PHTP,   8, 
                Offset (0x8C1), 
                GBIS,   2, 
                Offset (0x8D7), 
                BTTP,   8, 
                Offset (0x8F2), 
                    ,   5, 
                SBIS,   1, 
                Offset (0xAC3), 
                    ,   3, 
                GBTC,   1, 
                Offset (0xBB0), 
                Offset (0xBBC), 
                CPUT,   8, 
                Offset (0xBC0), 
                Offset (0xBC2), 
                PRTM,   16, 
                Offset (0xD82), 
                ECPC,   1, 
                ECST,   1, 
                Offset (0xD8B), 
                ECMB,   8, 
                EDTB,   8, 
                Offset (0xD8E)
            }
            OperationRegion (ECMM, SystemMemory, 0xFE0B0000, 0x1000)
            Field (ECMM, AnyAcc, Lock, Preserve)
            {
                Offset (0x800), 
                Offset (0x827), 
                DGPW,   1, 
                Offset (0x82C), 
                IASF,   8, 
                Offset (0x845), 
                ATTE,   16, 
                RTTE,   16, 
                BTDC,   64, 
                MXER,   8, 
                ATTF,   16, 
                BTVI,   16, 
                IIWT,   16, 
                IIST,   16, 
                AASD,   8, 
                Offset (0x890), 
                BMFN,   72, 
                BATD,   56, 
                AATL,   1, 
                AACL,   1, 
                AAST,   1, 
                AARW,   1, 
                AAEN,   1, 
                    ,   1, 
                WKRN,   1, 
                Offset (0x8A1), 
                    ,   1, 
                VIDO,   1, 
                TOUP,   1, 
                Offset (0x8A2), 
                ODTS,   8, 
                OSTY,   4, 
                    ,   2, 
                ECRD,   1, 
                ADPT,   1, 
                PWAK,   1, 
                MDWK,   1, 
                LWAK,   1, 
                RWAK,   1, 
                WWAK,   1, 
                UWAK,   1, 
                KWAK,   1, 
                TPWK,   1, 
                CCAC,   1, 
                AOAC,   1, 
                BLAC,   1, 
                PSRC,   1, 
                BOAC,   1, 
                LCAC,   1, 
                AAAC,   1, 
                ACAC,   1, 
                S3ST,   1, 
                S3RM,   1, 
                S4ST,   1, 
                S4RM,   1, 
                S5ST,   1, 
                S5RM,   1, 
                CSST,   1, 
                CSRM,   1, 
                OSTT,   8, 
                OSST,   8, 
                THLT,   8, 
                TCNL,   8, 
                MODE,   1, 
                    ,   2, 
                INIT,   1, 
                FAN1,   1, 
                FAN2,   1, 
                FANT,   1, 
                SKNM,   1, 
                SDTM,   8, 
                FSSN,   4, 
                FANU,   4, 
                PCVL,   6, 
                SWTO,   1, 
                TTHR,   1, 
                TTHM,   1, 
                THTL,   1, 
                CTDP,   1, 
                NPST,   5, 
                CTMP,   8, 
                CTML,   8, 
                SKTA,   8, 
                SKTB,   8, 
                SKTC,   8, 
                Offset (0x8B6), 
                NTMP,   8, 
                APLE,   1, 
                    ,   1, 
                    ,   1, 
                    ,   1, 
                CTHL,   4, 
                    ,   1, 
                LIDF,   1, 
                PMEE,   1, 
                PWBE,   1, 
                RNGE,   1, 
                BTWE,   1, 
                Offset (0x8B9), 
                BRTS,   8, 
                S35M,   1, 
                S35S,   1, 
                    ,   2, 
                FFEN,   1, 
                FFST,   1, 
                Offset (0x8BB), 
                WLAT,   1, 
                BTAT,   1, 
                WLEX,   1, 
                BTEX,   1, 
                KLSW,   1, 
                WLOK,   1, 
                AT3G,   1, 
                EX3G,   1, 
                PJID,   8, 
                CPUJ,   3, 
                CPNM,   3, 
                GATY,   2, 
                BOL0,   1, 
                BOL1,   1, 
                    ,   2, 
                BCC0,   1, 
                BCC1,   1, 
                Offset (0x8BF), 
                BPU0,   1, 
                BPU1,   1, 
                    ,   2, 
                BOS0,   1, 
                BOS1,   1, 
                Offset (0x8C0), 
                BTY0,   1, 
                BAM0,   1, 
                BAL0,   1, 
                    ,   1, 
                BMF0,   4, 
                BST0,   8, 
                BRC0,   16, 
                BSN0,   16, 
                BPV0,   16, 
                BDV0,   16, 
                BDC0,   16, 
                BFC0,   16, 
                GAU0,   8, 
                CYC0,   8, 
                BPC0,   16, 
                BAC0,   16, 
                BTW0,   8, 
                BVL0,   8, 
                BTM0,   8, 
                BAT0,   8, 
                BCG0,   16, 
                BCT0,   8, 
                BCI0,   8, 
                BCM0,   8, 
                BOT0,   8, 
                BSSB,   16, 
                BOV0,   8, 
                BCF0,   8, 
                BAD0,   8, 
                BCV1,   16, 
                BCV2,   16, 
                BCV3,   16, 
                BCV4,   16, 
                Offset (0x8ED), 
                BFCB,   16, 
                Offset (0x8F1), 
                    ,   6, 
                ORRF,   1, 
                Offset (0x8F4), 
                BMD0,   16, 
                BACV,   16, 
                BDN0,   8, 
                BTPP,   16, 
                Offset (0x8FC)
            }
            OperationRegion (ERAM, EmbeddedControl, Zero, 0xFF)
            Field (ERAM, ByteAcc, Lock, Preserve)
            {
                Offset (0x01), 
                Offset (0x02), 
                Offset (0x03), 
                ENIB,   16, 
                ENDD,   8, 
                Offset (0x60), 
                SMPR,   8, 
                SMST,   8, 
                SMAD,   8, 
                SMCM,   8, 
                SMD0,   256, 
                BCNT,   8, 
                SMAA,   24, 
                SMBN,   8, 
                Offset (0x8A)
            }
            OperationRegion (ECPR, EmbeddedControl, Zero, 0xFF)
            Field (ECPR, ByteAcc, Lock, Preserve)
            {
                Offset (0x06), 
                    ,   4, 
                GSPN,   1, 
                Offset (0x0E), 
                SADP,   8, 
                Offset (0x10), 
                SAD2,   8, 
                Offset (0x1C), 
                CPBC,   8, 
                Offset (0x2A), 
                    ,   6, 
                BMNC,   1, 
                BCLC,   1, 
                Offset (0x2D), 
                Offset (0x5A), 
                BMN9,   16, 
                Offset (0x64), 
                SMDR,   8, 
                Offset (0x90), 
                BMNN,   72, 
                BDVN,   56, 
                Offset (0xEB), 
                MUAC,   16, 
                Offset (0xF1), 
                    ,   6, 
                OSRF,   1
            }
            OperationRegion (CCLK, SystemIO, 0x1810, 0x04)
            Field (CCLK, DWordAcc, NoLock, Preserve)
            {
                    ,   1, 
                DUTY,   3, 
                THEN,   1, 
                Offset (0x01), 
                FTT,    1, 
                    ,   8, 
                TSTS,   1
            }
            OperationRegion (ECRM, EmbeddedControl, Zero, 0xFF)
            Field (ECRM, ByteAcc, Lock, Preserve)
            {
                Offset (0x5D), 
                ERIB,   16, 
                ERBD,   8, 
                Offset (0xAA), 
                Offset (0xAB), 
                Offset (0xAD), 
                    ,   4, 
                Offset (0xAE), 
                PTVL,   4, 
                Offset (0xB0), 
                Offset (0xB1), 
                Offset (0xB2), 
                Offset (0xB3), 
                Offset (0xB4), 
                Offset (0xB5), 
                Offset (0xBC), 
                Offset (0xBD)
            }
            Mutex (FAMX, 0x00)
            Method (FANG, 1, NotSerialized)
            {
                Acquire (FAMX, 0xFFFF)
                Store (Arg0, ERIB)
                Store (ERBD, Local0)
                Release (FAMX)
                Return (Local0)
            }
            Method (FANW, 2, NotSerialized)
            {
                Acquire (FAMX, 0xFFFF)
                Store (Arg0, ERIB)
                Store (Arg1, ERBD)
                Release (FAMX)
                Return (Arg1)
            }
            Method (TUVR, 1, NotSerialized)
            {
                Return (0x04)
            }
            Method (THRO, 1, NotSerialized)
            {
                ATHR (Arg0)
            }
            Method (CLCK, 1, NotSerialized)
            {
                Return (Zero)
            }
            Method (PCLK, 0, NotSerialized)
            {
                APCL ()
            }
            Method (ATHR, 1, NotSerialized)
            {
                If (LEqual (Arg0, Zero))
                {
                    Return (0xFF)
                }
                Else
                {
                    If (LEqual (Arg0, One))
                    {
                        Return (\_PR.C000._PPC)
                    }
                    Else
                    {
                        If (LEqual (Arg0, 0x02))
                        {
                            Return (TTHR)
                        }
                        Else
                        {
                            Return (0xFF)
                        }
                    }
                }
            }
            Method (APCL, 0, NotSerialized)
            {
                Store (PCVL, Local0)
                If (CondRefOf (\_PR.C000))
                {
                    Store (Local0, \_PR.C000.PPCV)
                    Notify (\_PR.C000, 0x80)
                }
                If (CondRefOf (\_PR.C001))
                {
                    Store (Local0, \_PR.C001.PPCV)
                    Notify (\_PR.C001, 0x80)
                }
                If (CondRefOf (\_PR.C002))
                {
                    Store (Local0, \_PR.C002.PPCV)
                    Notify (\_PR.C002, 0x80)
                }
                If (CondRefOf (\_PR.C003))
                {
                    Store (Local0, \_PR.C003.PPCV)
                    Notify (\_PR.C003, 0x80)
                }
                If (CondRefOf (\_PR.C004))
                {
                    Store (Local0, \_PR.C004.PPCV)
                    Notify (\_PR.C004, 0x80)
                }
                If (CondRefOf (\_PR.C005))
                {
                    Store (Local0, \_PR.C005.PPCV)
                    Notify (\_PR.C005, 0x80)
                }
                If (CondRefOf (\_PR.C006))
                {
                    Store (Local0, \_PR.C006.PPCV)
                    Notify (\_PR.C006, 0x80)
                }
                If (CondRefOf (\_PR.C007))
                {
                    Store (Local0, \_PR.C007.PPCV)
                    Notify (\_PR.C007, 0x80)
                }
            }
            Name (CTSL, Package (0x10)
            {
                0x11, 
                0x12, 
                0x13, 
                0x14, 
                0x15, 
                0x16, 
                0x60, 
                0x61, 
                0x62, 
                0x63, 
                0x64, 
                0x20, 
                0x21, 
                0x22, 
                0x26, 
                0x17
            })
            Mutex (CFMX, 0x00)
            Method (CFUN, 4, Serialized)
            {
                Name (ESRC, 0x05)
                If (LNotEqual (Match (CTSL, MEQ, DerefOf (Index (Arg0, Zero
                    )), MTR, Zero, Zero), Ones))
                {
                    Acquire (CFMX, 0xFFFF)
                    Store (Arg0, SMMD)
                    Store (Arg1, SFNO)
                    Store (Arg2, BFDT)
                    Store (0xCE, SMMC)
                    Release (CFMX)
                }
                Else
                {
                    If (LEqual (DerefOf (Index (Arg0, Zero)), 0x10))
                    {
                        If (LEqual (DerefOf (Index (Arg1, Zero)), One))
                        {
                            CreateByteField (Arg2, Zero, CAPV)
                            Store (CAPV, CAVR)
                            Store (One, STDT)
                        }
                        Else
                        {
                            If (LEqual (DerefOf (Index (Arg1, Zero)), 0x02))
                            {
                                Store (Buffer (0x80) {}, Local0)
                                CreateByteField (Local0, Zero, BFD0)
                                Store (0x11, BFD0)
                                Store (One, STDT)
                                Store (Local0, BFDT)
                            }
                            Else
                            {
                                If (LEqual (DerefOf (Index (Arg1, Zero)), 0x04))
                                {
                                    Acquire (CFMX, 0xFFFF)
                                    Store (Arg0, SMMD)
                                    Store (Arg1, SFNO)
                                    Store (Arg2, BFDT)
                                    Store (0xCE, SMMC)
                                    Release (CFMX)
                                }
                                Else
                                {
                                    Store (Zero, STDT)
                                }
                            }
                        }
                    }
                    Else
                    {
                        If (LEqual (DerefOf (Index (Arg0, Zero)), 0x27))
                        {
                            If (LEqual (DerefOf (Index (Arg1, Zero)), One))
                            {
                                Store (Zero, STDT)
                                Store (Zero, BFDT)
                            }
                            Else
                            {
                                If (LEqual (DerefOf (Index (Arg1, Zero)), 0x02))
                                {
                                    Store (Zero, STDT)
                                    Store (Zero, BFDT)
                                    Store (Zero, BFDT)
                                    Store (One, STDT)
                                }
                                Else
                                {
                                    Store (Zero, STDT)
                                }
                            }
                        }
                        Else
                        {
                            If (LEqual (DerefOf (Index (Arg0, Zero)), 0x18))
                            {
                                Acquire (CFMX, 0xFFFF)
                                If (LEqual (DerefOf (Index (Arg1, Zero)), 0x02))
                                {
                                    Store (Zero, SMD0)
                                    Store (DerefOf (Index (Arg2, One)), SMAD)
                                    Store (DerefOf (Index (Arg2, 0x02)), SMCM)
                                    Store (DerefOf (Index (Arg2, Zero)), SMPR)
                                    While (LAnd (Not (LEqual (ESRC, Zero)), Not (LEqual (And (
                                        SMST, 0x80), 0x80))))
                                    {
                                        Sleep (0x14)
                                        Subtract (ESRC, One, ESRC)
                                    }
                                    Store (SMST, Local2)
                                    If (LEqual (And (Local2, 0x80), 0x80))
                                    {
                                        Store (Buffer (0x80) {}, Local1)
                                        Store (Local2, Index (Local1, Zero))
                                        If (LEqual (Local2, 0x80))
                                        {
                                            Store (0xC4, P80H)
                                            Store (BCNT, Index (Local1, One))
                                            Store (SMD0, Local3)
                                            Store (DerefOf (Index (Local3, Zero)), Index (Local1, 0x02))
                                            Store (DerefOf (Index (Local3, One)), Index (Local1, 0x03))
                                            Store (DerefOf (Index (Local3, 0x02)), Index (Local1, 0x04))
                                            Store (DerefOf (Index (Local3, 0x03)), Index (Local1, 0x05))
                                            Store (DerefOf (Index (Local3, 0x04)), Index (Local1, 0x06))
                                            Store (DerefOf (Index (Local3, 0x05)), Index (Local1, 0x07))
                                            Store (DerefOf (Index (Local3, 0x06)), Index (Local1, 0x08))
                                            Store (DerefOf (Index (Local3, 0x07)), Index (Local1, 0x09))
                                            Store (DerefOf (Index (Local3, 0x08)), Index (Local1, 0x0A))
                                            Store (DerefOf (Index (Local3, 0x09)), Index (Local1, 0x0B))
                                            Store (DerefOf (Index (Local3, 0x0A)), Index (Local1, 0x0C))
                                            Store (DerefOf (Index (Local3, 0x0B)), Index (Local1, 0x0D))
                                            Store (DerefOf (Index (Local3, 0x0C)), Index (Local1, 0x0E))
                                            Store (DerefOf (Index (Local3, 0x0D)), Index (Local1, 0x0F))
                                            Store (DerefOf (Index (Local3, 0x0E)), Index (Local1, 0x10))
                                            Store (DerefOf (Index (Local3, 0x0F)), Index (Local1, 0x11))
                                            Store (DerefOf (Index (Local3, 0x10)), Index (Local1, 0x12))
                                            Store (DerefOf (Index (Local3, 0x11)), Index (Local1, 0x13))
                                            Store (DerefOf (Index (Local3, 0x12)), Index (Local1, 0x14))
                                            Store (DerefOf (Index (Local3, 0x13)), Index (Local1, 0x15))
                                            Store (DerefOf (Index (Local3, 0x14)), Index (Local1, 0x16))
                                            Store (DerefOf (Index (Local3, 0x15)), Index (Local1, 0x17))
                                            Store (DerefOf (Index (Local3, 0x16)), Index (Local1, 0x18))
                                            Store (DerefOf (Index (Local3, 0x17)), Index (Local1, 0x19))
                                            Store (DerefOf (Index (Local3, 0x18)), Index (Local1, 0x1A))
                                            Store (DerefOf (Index (Local3, 0x19)), Index (Local1, 0x1B))
                                            Store (DerefOf (Index (Local3, 0x1A)), Index (Local1, 0x1C))
                                            Store (DerefOf (Index (Local3, 0x1B)), Index (Local1, 0x1D))
                                            Store (DerefOf (Index (Local3, 0x1C)), Index (Local1, 0x1E))
                                            Store (DerefOf (Index (Local3, 0x1D)), Index (Local1, 0x1F))
                                            Store (DerefOf (Index (Local3, 0x1E)), Index (Local1, 0x20))
                                            Store (DerefOf (Index (Local3, 0x1F)), Index (Local1, 0x21))
                                        }
                                        Store (Local1, BFDT)
                                        Store (One, STDT)
                                    }
                                    Else
                                    {
                                        Store (0xC5, P80H)
                                        Store (Zero, STDT)
                                    }
                                }
                                Else
                                {
                                    Store (0xC6, P80H)
                                    Store (Zero, STDT)
                                }
                                Release (CFMX)
                            }
                            Else
                            {
                                Store (Zero, STDT)
                            }
                        }
                    }
                }
            }
            Name (OCSL, Package (0x09)
            {
                0x80, 
                0x81, 
                0x82, 
                0x83, 
                0x84, 
                0x85, 
                0x86, 
                0x92, 
                0x93
            })
            Mutex (PFMX, 0x00)
            Method (PFUN, 4, Serialized)
            {
                Acquire (PFMX, 0xFFFF)
                Store (Arg0, SMMD)
                Store (Arg1, SFNO)
                Store (Arg2, BFDT)
                Store (0xCF, SMMC)
                Release (PFMX)
            }
            Method (CMFC, 4, Serialized)
            {
                Name (RTVL, Package (0x04)
                {
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero
                })
                If (LEqual (ObjectType (Arg0), One))
                {
                    Store (0x8000, Index (RTVL, Zero))
                }
                Else
                {
                    If (LLess (DerefOf (Index (Arg0, Zero)), 0xFE))
                    {
                        Store (Buffer (0x82) {}, Local1)
                        CreateWordField (Local1, Zero, RTST)
                        CreateField (Local1, 0x10, 0x0400, RTDT)
                        If (LLessEqual (ToInteger (Arg0), 0x7F))
                        {
                            CFUN (Arg0, Arg1, Arg2, Arg3)
                        }
                        Else
                        {
                            PFUN (Arg0, Arg1, Arg2, Arg3)
                        }
                        Store (STDT, RTST)
                        Store (BFDT, RTDT)
                        Return (Local1)
                    }
                    Else
                    {
                        Store (0x8000, Index (RTVL, Zero))
                    }
                }
                Return (RTVL)
            }
        }
        Scope (EC0)
        {
            Method (BSHK, 0, NotSerialized)
            {
                If (ECOK ())
                {
                    Store (One, Local1)
                    If (LEqual (OSYS, 0x07D1))
                    {
                        Store (Zero, Local1)
                    }
                    If (LEqual (OSYS, 0x07D2))
                    {
                        Store (Zero, Local1)
                    }
                    If (LEqual (OSYS, 0x07D6))
                    {
                        Store (One, Local1)
                    }
                    If (LEqual (OSYS, 0x03E8))
                    {
                        Store (0x02, Local1)
                    }
                    If (LEqual (OSYS, 0x07D9))
                    {
                        Store (0x03, Local1)
                    }
                    If (LEqual (OSYS, 0x07DC))
                    {
                        Store (0x04, Local1)
                    }
                    If (LEqual (OSYS, 0x07DD))
                    {
                        Store (0x05, Local1)
                    }
                    If (LEqual (OSYS, 0x07DF))
                    {
                        Store (0x06, Local1)
                    }
                    Sleep (0x14)
                    Store (Local1, OSTY)
                    Sleep (0x14)
                }
            }
        }
        Device (BAT1)
        {
            Name (_HID, EisaId ("PNP0C0A"))
            Name (_UID, One)
            Name (_PCL, Package (0x01)
            {
                _SB
            })
            Name (BMDL, Zero)
            Name (BASC, One)
            Name (BFFW, Zero)
            Method (_STA, 0, NotSerialized)
            {
                ^^EC0.BSHK ()
                If (ECOK ())
                {
                    If (^^EC0.BOL0)
                    {
                        Sleep (Zero)
                        Return (0x1F)
                    }
                    Else
                    {
                        Sleep (Zero)
                        Return (0x0F)
                    }
                }
                Else
                {
                    Sleep (Zero)
                    Return (0x1F)
                }
            }
            Method (_BIF, 0, NotSerialized)
            {
                Return (BIFX (Zero))
            }
            Method (_BIX, 0, NotSerialized)
            {
                Return (BIFX (One))
            }
            Method (BIFX, 1, NotSerialized)
            {
                Name (STAX, Package (0x14)
                {
                    Zero, 
                    One, 
                    0x1770, 
                    0x1770, 
                    One, 
                    0x2A30, 
                    0x0258, 
                    0xB4, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    Zero, 
                    0x0108, 
                    0x0EC4, 
                    "PABAS0241231", 
                    "41167", 
                    "LION", 
                    "Hewlett-Packard"
                })
                Name (STAF, Package (0x0D)
                {
                    One, 
                    0x1770, 
                    0x1770, 
                    One, 
                    0x2A30, 
                    0x0258, 
                    0xB4, 
                    0x0108, 
                    0x0EC4, 
                    "PABAS0241231", 
                    "41167", 
                    "LION", 
                    "Hewlett-Packard"
                })
                If (ECOK ())
                {
                    Store (^^EC0.ORRF, BFFW)
                    If (LEqual (^^EC0.BAM0, Zero))
                    {
                        Store (0x0A, BASC)
                    }
                    Store (^^EC0.BAM0, Index (STAX, One))
                    Store (^^EC0.BDN0, Local0)
                    Store (Local0, BMDL)
                    Store (Multiply (^^EC0.BDC0, BASC), Index (STAX, 0x02))
                    Sleep (Zero)
                    Store (^^EC0.BDV0, Index (STAX, 0x05))
                    Sleep (Zero)
                    If (LEqual (BFFW, One))
                    {
                        Store (^^EC0.BFCB, Local2)
                    }
                    Else
                    {
                        Store (^^EC0.BFC0, Local2)
                    }
                    Store (Multiply (Local2, BASC), Local2)
                    Sleep (Zero)
                    Store (Local2, Index (STAX, 0x03))
                    Divide (Local2, 0x64, Local0, Local1)
                    Multiply (Local1, 0x05, Local1)
                    Store (Local1, Index (STAX, 0x06))
                    Divide (Local2, 0x64, Local0, Local1)
                    Multiply (Local1, 0x03, Local1)
                    Store (Local1, Index (STAX, 0x07))
                    Store (DerefOf (Index (STAX, One)), Index (STAF, Zero))
                    Store (DerefOf (Index (STAX, 0x02)), Index (STAF, One))
                    Store (DerefOf (Index (STAX, 0x03)), Index (STAF, 0x02))
                    Store (DerefOf (Index (STAX, 0x04)), Index (STAF, 0x03))
                    Store (DerefOf (Index (STAX, 0x05)), Index (STAF, 0x04))
                    Store (DerefOf (Index (STAX, 0x06)), Index (STAF, 0x05))
                    Store (DerefOf (Index (STAX, 0x07)), Index (STAF, 0x06))
                    Store (DerefOf (Index (STAX, 0x0E)), Index (STAF, 0x07))
                    Store (DerefOf (Index (STAX, 0x0F)), Index (STAF, 0x08))
                    Store (DerefOf (Index (STAX, 0x10)), Index (STAF, 0x09))
                    Store (DerefOf (Index (STAX, 0x11)), Index (STAF, 0x0A))
                    Store (DerefOf (Index (STAX, 0x12)), Index (STAF, 0x0B))
                    Store (DerefOf (Index (STAX, 0x13)), Index (STAF, 0x0C))
                    If (LEqual (Arg0, One))
                    {
                        Return (STAX)
                    }
                    Else
                    {
                        Return (STAF)
                    }
                }
            }
            Method (_BST, 0, NotSerialized)
            {
                Name (PBST, Package (0x04)
                {
                    Zero, 
                    Ones, 
                    Ones, 
                    0x1770
                })
                If (ECOK ())
                {
                    Store (^^EC0.BST0, Index (PBST, Zero))
                    Sleep (Zero)
                    If (ShiftRight (^^EC0.BAC0, 0x0F))
                    {
                        Add (And (Not (^^EC0.BAC0), 0xFFFF), One, Local4)
                    }
                    Else
                    {
                        Store (^^EC0.BAC0, Local4)
                    }
                    If (LEqual (^^EC0.BAM0, Zero))
                    {
                        Divide (Multiply (Local4, ^^EC0.BPV0), 0x03E8, , Local4)
                    }
                    If (LEqual (^^^^WMID.BRTE, Zero))
                    {
                        Store (Ones, Index (PBST, One))
                    }
                    Else
                    {
                        Store (Local4, Index (PBST, One))
                    }
                    Sleep (Zero)
                    Store (Multiply (^^EC0.BRC0, BASC), Index (PBST, 0x02))
                    Sleep (Zero)
                    Store (^^EC0.BPV0, Index (PBST, 0x03))
                    Sleep (Zero)
                    If (LNotEqual (^^EC0.BDN0, BMDL))
                    {
                        Notify (BAT1, 0x81)
                    }
                }
                Return (PBST)
            }
            Method (_BTP, 1, NotSerialized)
            {
                Divide (Arg0, BASC, , Local0)
                Store (Local0, ^^EC0.BTPP)
            }
        }
        Device (ACAD)
        {
            Name (_HID, "ACPI0003")
            Name (_PCL, Package (0x01)
            {
                _SB
            })
            Name (XX00, Buffer (0x03) {})
            Method (_PSR, 0, NotSerialized)
            {
                Store (^^EC0.ADPT, Local0)
                If (LAnd (LEqual (^^EC0.PSAC, One), LEqual (^^EC0.AAAC, One)))
                {
                    Store (Zero, Local0)
                }
                CreateWordField (XX00, Zero, SSZE)
                CreateByteField (XX00, 0x02, ACST)
                Store (0x03, SSZE)
                If (Local0)
                {
                    Store (0xAC, P80H)
                    AFN4 (One)
                    Store (Zero, ACST)
                    
                    // Power Source is AC Adapter. 
                    // We can set the STAPM values higher.
                    // TODO: Move this to a common function - similar to DPTC
                    Name (ACVA, Buffer (0x07) {})
                    CreateWordField (ACVA, Zero, ACSZ)
                    CreateByteField (ACVA, 0x02, ACSF)
                    CreateDWordField (ACVA, 0x03, ACSD)
                    Store (0x07, ACSZ)
                    Store (0x05, ACSF)
                    Store (0x4E20, ACSD)
                    ALIB (0x0C, ACVA)
                    Store (0x07, ACSZ)
                    Store (0x06, ACSF)
                    Store (0x61A8, ACSD)
                    ALIB (0x0C, ACVA)
                    Store (0x07, ACSZ)
                    Store (0x07, ACSF)
                    Store (0x61A8, ACSD)
                    ALIB (0x0C, ACVA)
                }
                Else
                {
                    Store (0xDC, P80H)
                    AFN4 (0x02)
                    Store (One, ACST)
                    
                    // Power Source is the battery.
                    Name (DCVA, Buffer (0x07) {})
                    CreateWordField (DCVA, Zero, DCSZ)
                    CreateByteField (DCVA, 0x02, DCSF)
                    CreateDWordField (DCVA, 0x03, DCSD)
                    Store (0x07, DCSZ)
                    Store (0x05, DCSF)
                    Store (0x3A98, DCSD)
                    ALIB (0x0C, DCVA)
                    Store (0x07, DCSZ)
                    Store (0x06, DCSF)
                    Store (0x61A8, DCSD)
                    ALIB (0x0C, DCVA)
                    Store (0x07, DCSZ)
                    Store (0x07, DCSF)
                    Store (0x4E20, DCSD)
                    ALIB (0x0C, DCVA)
                }
                ALIB (One, XX00)
                Return (Local0)
            }
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }
        }
        Scope (RTC)
        {
            OperationRegion (RCM0, SystemCMOS, Zero, 0x10)
            Field (RCM0, ByteAcc, NoLock, Preserve)
            {
                AccessAs (ByteAcc, 0x00), 
                RTCS,   8, 
                Offset (0x02), 
                RTCM,   8, 
                Offset (0x04), 
                RTCH,   8, 
                Offset (0x06), 
                RTCW,   8, 
                RTCD,   8
            }
        }
    }
    Scope (_TZ)
    {
        ThermalZone (TSZ0)
        {
            Name (REGN, "Processor Thermal Zone")
            Method (FMAX, 0, NotSerialized)
            {
                Return (Multiply (\_SB.PCI0.LPC0.EC0.FNMX, 0x64))
            }
            Method (FMIN, 0, NotSerialized)
            {
                Return (Multiply (\_SB.PCI0.LPC0.EC0.FNMN, 0x64))
            }
            Method (FRSP, 0, NotSerialized)
            {
                Return (Multiply (\_SB.PCI0.LPC0.EC0.FRPM, 0x64))
            }
            Method (FSSP, 1, NotSerialized)
            {
                Store (One, \_SB.PCI0.LPC0.EC0.FNSW)
                Store (And (LNot (Arg0), One), \_SB.PCI0.LPC0.EC0.FWPM)
                Store (Zero, \_SB.PCI0.LPC0.EC0.FNSW)
            }
            Method (_CRT, 0, Serialized)
            {
                Return (0x1388)
            }
            Method (_HOT, 0, Serialized)
            {
                Return (0x0E58)
            }
            Method (_TMP, 0, Serialized)
            {
                If (LGreater (\_SB.PCI0.LPC0.EC0.CPUT, CMST))
                {
                    Store (\_SB.PCI0.LPC0.EC0.CPUT, CMST)
                }
                Return (Add (0x0AAC, Multiply (\_SB.PCI0.LPC0.EC0.CPUT, 0x0A)))
            }
            Method (_PSV, 0, Serialized)
            {
                Return (Add (0x0AAC, Multiply (\_SB.PCI0.LPC0.EC0.CPTP, 0x0A)))
            }
        }
        ThermalZone (TSZ2)
        {
            Name (BOTP, Zero)
            Name (TZTP, Zero)
            Name (FFVO, Zero)
            Method (_HOT, 0, Serialized)
            {
                Return (0x0E30)
            }
            Method (_TMP, 0, Serialized)
            {
                Store (Or (FFAL, PDPN), Local1)
                Store (Or (TZTP, BOTP), Local2)
                Store (Or (TZTP, FFVO), Local3)
                If (LOr (LOr (Local1, Local2), Local3))
                {
                    Store (Zero, TZTP)
                    Store (Zero, BOTP)
                    Store (Zero, FFVO)
                    Return (0x0E30)
                }
                Else
                {
                    Return (0x0B74)
                    Store (Zero, TZTP)
                    Store (Zero, BOTP)
                }
            }
        }
    }
    Scope (_SB.PCI0.LPC0.EC0)
    {
        OperationRegion (DBG1, SystemIO, 0xB0, 0x02)
        Field (DBG1, WordAcc, NoLock, Preserve)
        {
            PB0,    8, 
            PB1,    8
        }
        Method (_Q11, 0, NotSerialized)
        {
            Store (0x11, P80H)
            Notify (^^^GP17.VGA.LCD, 0x87)
        }
        Method (_Q12, 0, NotSerialized)
        {
            Store (0x12, P80H)
            Notify (^^^GP17.VGA.LCD, 0x86)
        }
        Method (_Q13, 0, NotSerialized)
        {
            Store (0x13, P80H)
            If (ECON)
            {
                Store (One, THSD)
                Notify (\_TZ.TSZ0, 0x80)
            }
        }
        Method (_Q14, 0, NotSerialized)
        {
            Store (0x14, P80H)
            If (ECON)
            {
                If (LNot (FANE))
                {
                    Store (One, FFAL)
                }
                Notify (\_TZ.TSZ2, 0x80)
            }
        }
        Method (_Q15, 0, NotSerialized)
        {
            Store (0x15, P80H)
            If (IGDS)
            {
                Notify (LID, 0x80)
            }
        }
        Method (_Q1D, 0, NotSerialized)
        {
            Store (0x1D, P80H)
            PCLK ()
        }
        Method (_Q1E, 0, NotSerialized)
        {
            Store (0x1E, P80H)
            ^^^GPP0.VGA.AFN2 (DTCL, 0x02)
        }
        Method (_Q24, 0, NotSerialized)
        {
            Store (0x24, P80H)
            Store ("=====QUERY_24=====", Debug)
            Sleep (0x03E8)
            Notify (BAT1, 0x80)
        }
        Method (_Q25, 0, NotSerialized)
        {
            Store (0x25, P80H)
            Store ("=====QUERY_25=====", Debug)
            Sleep (0x03E8)
            Notify (BAT1, 0x81)
            Sleep (0x03E8)
            Notify (BAT1, 0x80)
        }
        Method (_Q26, 0, NotSerialized)
        {
            Store (0x26, P80H)
            And (CPBC, 0x80, Local0)
            If (LEqual (Local0, 0x80))
            {
                Store (0x48, PB1)
                Store (0xC7, PB0)
            }
            Else
            {
                Store (0x49, PB1)
                Store (0xC7, PB0)
            }
        }
        Method (_Q37, 0, NotSerialized)
        {
            // When power source is changed to adapter, notifies ACAD object (with _PSR method)
            // and raise the STAPM values.
            Store (0x37, P80H)
            Store ("=====QUERY_37=====", Debug)
            Notify (ACAD, 0x80)
            Sleep (0x03E8)
            Notify (BAT1, 0x80)
            Store (0x03, ^^^^WMID.WEI1)
            Store (Zero, ^^^^WMID.WED1)
            Notify (WMID, 0x80)
            Store (One, PWRS)
            Name (XX11, Buffer (0x07) {})
            CreateWordField (XX11, Zero, SSZE)
            CreateByteField (XX11, 0x02, SMUF)
            CreateDWordField (XX11, 0x03, SMUD)
            Store (0x07, SSZE)
            Store (0x05, SMUF)
            Store (0x4E20, SMUD)
            ALIB (0x0C, XX11)
            Store (0x07, SSZE)
            Store (0x06, SMUF)
            Store (0x61A8, SMUD)
            ALIB (0x0C, XX11)
            Store (0x07, SSZE)
            Store (0x07, SMUF)
            Store (0x61A8, SMUD)
            ALIB (0x0C, XX11)
        }
        Method (_Q38, 0, NotSerialized)
        {
            // When power source is batter, notifies ACAD object and lowers STAPM values.
            Store (0x38, P80H)
            Store ("=====QUERY_38=====", Debug)
            Notify (ACAD, 0x80)
            Sleep (0x03E8)
            Notify (BAT1, 0x80)
            Store (Zero, PWRS)
            Name (XX11, Buffer (0x07) {})
            CreateWordField (XX11, Zero, SSZE)
            CreateByteField (XX11, 0x02, SMUF)
            CreateDWordField (XX11, 0x03, SMUD)
            Store (0x07, SSZE)
            Store (0x05, SMUF)
            Store (0x3A98, SMUD)
            ALIB (0x0C, XX11)
            Store (0x07, SSZE)
            Store (0x06, SMUF)
            Store (0x61A8, SMUD)
            ALIB (0x0C, XX11)
            Store (0x07, SSZE)
            Store (0x07, SMUF)
            Store (0x4E20, SMUD)
            ALIB (0x0C, XX11)
        }
        Method (_Q40, 0, NotSerialized)
        {
            Store (0x40, P80H)
            If (LOr (LOr (LEqual (OSYS, 0x07DC), LEqual (OSYS, 0x07DD)), LEqual (
                OSYS, 0x07DF)))
            {
                Notify (WLBU, 0x80)
            }
            Else
            {
            }
        }
        Method (_Q42, 0, NotSerialized)
        {
            Store (0x42, P80H)
            ^^^^WMID.ESDT ()
        }
        Method (_Q44, 0, NotSerialized)
        {
            Store (0x44, P80H)
            If (ECON)
            {
                Store (One, THSD)
                Store (One, \_TZ.TSZ2.BOTP)
                Notify (\_TZ.TSZ2, 0x80)
            }
        }
        Method (_Q45, 0, NotSerialized)
        {
            Store (0x45, P80H)
            Store ("=====QUERY_45=====", Debug)
            If (ECON)
            {
                Store (One, PDPN)
                Notify (\_TZ.TSZ2, 0x80)
            }
        }
        Method (_Q49, 0, NotSerialized)
        {
            Store (0x49, P80H)
            If (ECON)
            {
                CMDW (0x45, 0x45)
                Store (One, \_TZ.TSZ2.TZTP)
                Notify (\_TZ.TSZ2, 0x80)
            }
        }
        Method (_Q4B, 0, NotSerialized)
        {
            Store (0x4B, P80H)
            Store (One, ECSF)
            Store (One, CFBE)
        }
        Method (_Q4D, 0, NotSerialized)
        {
            Store (0x4D, P80H)
            Store ("=====QUERY_4D=====", Debug)
            If (BMNC)
            {
                Store (0x16, ^^^^WMID.WEI1)
                Store (One, ^^^^WMID.WED1)
                Notify (WMID, 0x80)
            }
            If (BCLC)
            {
                Store (0x16, ^^^^WMID.WEI1)
                Store (One, ^^^^WMID.WED1)
                Notify (WMID, 0x80)
            }
        }
        Method (_Q4E, 0, NotSerialized)
        {
            Store (0x4E, P80H)
            If (ECON)
            {
                Store (One, \_TZ.TSZ2.FFVO)
                Notify (\_TZ.TSZ2, 0x80)
            }
        }
        //Method (_Q4F, 0, NotSerialized)
        //{
        //    Store (0x4F, P80H)
        //    DPTC (0x06, 0x3A98)
        //    DPTC (0x07, 0x3A98)
        //}
        //Method (_Q50, 0, NotSerialized)
        //{
        //    Store (0x50, P80H)
        //    DPTC (0x06, 0x61A8)
        //    DPTC (0x07, 0x4E20)
        //}
    }
}
