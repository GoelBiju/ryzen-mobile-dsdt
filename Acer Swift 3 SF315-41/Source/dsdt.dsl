DefinitionBlock ("dsdt.aml", "DSDT", 1, "ACRSYS", "ACRPRDCT", 0x00040000)
{
    External (WMID)
    External (M010, MethodObj)    // 2 Arguments
    External (AFN4, MethodObj)    // 1 Arguments
    External (ALIB, MethodObj)    // 2 Arguments
    External (M009)
    External (AFN7, MethodObj)    // 1 Arguments
    External (MWAK, MethodObj)    // 1 Arguments
    External (MPTS, MethodObj)    // 1 Arguments
    External (\_SB_.AWAK, MethodObj)    // 5 Arguments
    External (\_SB_.APTS, MethodObj)    // 4 Arguments
    External (\_PR_.C007.PPCV)
    External (\_PR_.C006.PPCV)
    External (\_PR_.C005.PPCV)
    External (\_PR_.C004.PPCV)
    External (\_PR_.C003.PPCV)
    External (\_PR_.C002.PPCV)
    External (\_PR_.C001.PPCV)
    External (\_PR_.C000.PPCV)
    External (\_SB_.TPM2.PTS_, MethodObj)    // 1 Arguments
    External (\_SB_.PCI0.WMID.FEBC)
    External (\_SB_.PCI0.WMID.LMST, IntObj)
    External (\_SB_.PCI0.WMID.TOPT)
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
    OperationRegion (GNVS, SystemMemory, 0x8F76FA98, 0x0188)
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
        HML2,   64, 
        OSYS,   16
    }
    OperationRegion (OGNS, SystemMemory, 0x8F76FD18, 0x0B)
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
        OG10,   8
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
            Store (0x07D9, OSYS)
            If (CondRefOf (\_OSI, Local0))
            {
                Store (Zero, OSTB)
                Store (Zero, TPOS)
                If (_OSI ("Windows 2001"))
                {
                    Store (0x08, OSTB)
                    Store (0x08, TPOS)
                }
                If (_OSI ("Windows 2001.1"))
                {
                    Store (0x20, OSTB)
                    Store (0x20, TPOS)
                }
                If (_OSI ("Windows 2001 SP1"))
                {
                    Store (0x10, OSTB)
                    Store (0x10, TPOS)
                }
                If (_OSI ("Windows 2001 SP2"))
                {
                    Store (0x11, OSTB)
                    Store (0x11, TPOS)
                }
                If (_OSI ("Windows 2001 SP3"))
                {
                    Store (0x12, OSTB)
                    Store (0x12, TPOS)
                }
                If (_OSI ("Windows 2006"))
                {
                    Store (0x40, OSTB)
                    Store (0x40, TPOS)
                }
                If (_OSI ("Windows 2006 SP1"))
                {
                    Store (0x41, OSTB)
                    Store (0x41, TPOS)
                    Store (One, OSSP)
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
    OperationRegion (MDBG, SystemMemory, 0x8F35F018, 0x1004)
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
        }
        Method (_L19, 0, NotSerialized)
        {
            Notify (\_SB.PCI0.GP17.XHC0, 0x02)
            Notify (\_SB.PCI0.GP17.XHC1, 0x02)
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
        If (LEqual (Arg0, One))
        {
            \_SB.S80H (0x51)
        }
        If (LEqual (Arg0, 0x03))
        {
            \_SB.S80H (0x53)
            Store (One, SLPS)
        }
        If (LEqual (Arg0, 0x04))
        {
            \_SB.S80H (0x54)
            Store (One, SLPS)
            Store (One, RSTU)
        }
        If (LEqual (Arg0, 0x05))
        {
            \_SB.S80H (0x55)
            Store (0x90, BCMD)
            \_SB.BSMI (Zero)
            \_SB.GSMI (0x03)
        }
        If (CondRefOf (\_SB.TPM2.PTS))
        {
            \_SB.TPM2.PTS (Arg0)
        }
        \_SB.APTS (Arg0, \_SB.PCI0.LPC0.EC0.EC_S (Arg0), MPTS (Arg0))
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
                Notify (\_SB.PWRB, 0x02)
            } If (LEqual (Arg0, 0x04))
            {
                \_SB.S80H (0xE4)
                Notify (\_SB.PWRB, 0x02)
            } \_SB.PCI0.LPC0.EC0.EC_W (Arg0)
        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x04A0), Local1)
        Or (Local1, 0x88, Local1)
        And (Local1, 0xFE, Local1)
        \_SB.PCI0.LPC0.EC0.WR_M (0x04A0, Local1)
        MWAK (Arg0)
        Notify (\_SB.I2CD.TPDS, One)
        Notify (\_SB.I2CD.TPDE, One)
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
            Method (_INI, 0, NotSerialized)
            {
                If (LNotEqual (GPIC, Zero))
                {
                    DSPI ()
                    If (\NAPC)
                    {
                        NAPE ()
                    }
                }
                OSTP ()
                Notify (^^I2CD.TPDS, One)
                Notify (^^I2CD.TPDE, One)
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
                Name (BAR3, 0xFDA00000)
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
                    Name (AF7E, 0x80000000)
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
                Device (XHC0)
                {
                    Name (_ADR, 0x03)
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
                        Name (_ADR, Zero)
                        Device (HS01)
                        {
                            Name (_ADR, One)
                            Method (_UPC, 0, Serialized)
                            {
                                Name (UPCP, Package (0x04)
                                {
                                    0xFF, 
                                    0xFF, 
                                    Zero, 
                                    Zero
                                })
                                Return (UPCP)
                            }
                            Method (_PLD, 0, Serialized)
                            {
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x10)
                                    {
                                        /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                        /* 0008 */   0x69, 0x01, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00
                                    }
                                })
                                Return (PLDP)
                            }
                        }
                        Device (HS02)
                        {
                            Name (_ADR, 0x02)
                            Method (_UPC, 0, Serialized)
                            {
                                Name (UPCP, Package (0x04)
                                {
                                    0xFF, 
                                    0xFF, 
                                    Zero, 
                                    Zero
                                })
                                Return (UPCP)
                            }
                            Method (_PLD, 0, Serialized)
                            {
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x10)
                                    {
                                        /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                        /* 0008 */   0x69, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00
                                    }
                                })
                                Return (PLDP)
                            }
                        }
                        Device (HS03)
                        {
                            Name (_ADR, 0x03)
                            Method (_UPC, 0, Serialized)
                            {
                                Name (UPCP, Package (0x04)
                                {
                                    0xFF, 
                                    0x09, 
                                    Zero, 
                                    Zero
                                })
                                Return (UPCP)
                            }
                            Method (_PLD, 0, Serialized)
                            {
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x10)
                                    {
                                        /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                        /* 0008 */   0x69, 0x01, 0x80, 0x01, 0x00, 0x00, 0x00, 0x00
                                    }
                                })
                                Return (PLDP)
                            }
                        }
                        Device (HS04)
                        {
                            Name (_ADR, 0x04)
                            Method (_UPC, 0, Serialized)
                            {
                                Name (UPCP, Package (0x04)
                                {
                                    0xFF, 
                                    0xFF, 
                                    Zero, 
                                    Zero
                                })
                                Return (UPCP)
                            }
                            Method (_PLD, 0, Serialized)
                            {
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x10)
                                    {
                                        /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                        /* 0008 */   0x69, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00
                                    }
                                })
                                Return (PLDP)
                            }
                        }
                        Device (SS01)
                        {
                            Name (_ADR, 0x05)
                            Method (_UPC, 0, Serialized)
                            {
                                Name (UPCP, Package (0x04)
                                {
                                    0xFF, 
                                    0xFF, 
                                    Zero, 
                                    Zero
                                })
                                Return (UPCP)
                            }
                            Method (_PLD, 0, Serialized)
                            {
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x10)
                                    {
                                        /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                        /* 0008 */   0x69, 0x01, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00
                                    }
                                })
                                Return (PLDP)
                            }
                        }
                        Device (SS02)
                        {
                            Name (_ADR, 0x06)
                            Method (_UPC, 0, Serialized)
                            {
                                Name (UPCP, Package (0x04)
                                {
                                    0xFF, 
                                    0xFF, 
                                    Zero, 
                                    Zero
                                })
                                Return (UPCP)
                            }
                            Method (_PLD, 0, Serialized)
                            {
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x10)
                                    {
                                        /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                        /* 0008 */   0x69, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00
                                    }
                                })
                                Return (PLDP)
                            }
                        }
                        Device (SS03)
                        {
                            Name (_ADR, 0x07)
                            Method (_UPC, 0, Serialized)
                            {
                                Name (UPCP, Package (0x04)
                                {
                                    0xFF, 
                                    0xFF, 
                                    Zero, 
                                    Zero
                                })
                                Return (UPCP)
                            }
                            Method (_PLD, 0, Serialized)
                            {
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x10)
                                    {
                                        /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                        /* 0008 */   0x69, 0x01, 0x00, 0x02, 0x00, 0x00, 0x00, 0x00
                                    }
                                })
                                Return (PLDP)
                            }
                        }
                        Device (SS04)
                        {
                            Name (_ADR, 0x08)
                            Method (_UPC, 0, Serialized)
                            {
                                Name (UPCP, Package (0x04)
                                {
                                    0xFF, 
                                    0x09, 
                                    Zero, 
                                    Zero
                                })
                                Return (UPCP)
                            }
                            Method (_PLD, 0, Serialized)
                            {
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x10)
                                    {
                                        /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                        /* 0008 */   0x69, 0x01, 0x80, 0x01, 0x00, 0x00, 0x00, 0x00
                                    }
                                })
                                Return (PLDP)
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
                        Name (_ADR, Zero)
                        Device (HS01)
                        {
                            Name (_ADR, One)
                            Method (_UPC, 0, Serialized)
                            {
                                Name (UPCP, Package (0x04)
                                {
                                    Zero, 
                                    0xFF, 
                                    Zero, 
                                    Zero
                                })
                                Return (UPCP)
                            }
                            Method (_PLD, 0, Serialized)
                            {
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x10)
                                    {
                                        /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                        /* 0008 */   0x68, 0x01, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00
                                    }
                                })
                                Return (PLDP)
                            }
                            Device (CAM0)
                            {
                                Name (_ADR, One)
                                Name (_PLD, Package (0x01)
                                {
                                    Buffer (0x14)
                                    {
                                        /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                        /* 0008 */   0xA1, 0x1E, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                        /* 0010 */   0xFF, 0xFF, 0xFF, 0xFF
                                    }
                                })
                            }
                        }
                        Device (HS02)
                        {
                            Name (_ADR, 0x02)
                            Method (_UPC, 0, Serialized)
                            {
                                Name (UPCP, Package (0x04)
                                {
                                    Zero, 
                                    0xFF, 
                                    Zero, 
                                    Zero
                                })
                                Return (UPCP)
                            }
                            Method (_PLD, 0, Serialized)
                            {
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x10)
                                    {
                                        /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                        /* 0008 */   0x68, 0x01, 0x00, 0x08, 0x00, 0x00, 0x00, 0x00
                                    }
                                })
                                Return (PLDP)
                            }
                            Device (HUB1)
                            {
                                Name (_ADR, One)
                                Name (_STA, 0x0F)
                                Name (_UPC, Package (0x04)
                                {
                                    0xFF, 
                                    0xFF, 
                                    Zero, 
                                    Zero
                                })
                                Method (_PLD, 0, Serialized)
                                {
                                    Name (PLDP, Package (0x01)
                                    {
                                        Buffer (0x14)
                                        {
                                            /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                            /* 0008 */   0x69, 0x01, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                            /* 0010 */   0xFF, 0xFF, 0xFF, 0xFF
                                        }
                                    })
                                    Return (PLDP)
                                }
                            }
                            Device (HUB2)
                            {
                                Name (_ADR, 0x02)
                                Name (_STA, 0x0F)
                                Name (_UPC, Package (0x04)
                                {
                                    Zero, 
                                    0xFF, 
                                    Zero, 
                                    Zero
                                })
                                Method (_PLD, 0, Serialized)
                                {
                                    Name (PLDP, Package (0x01)
                                    {
                                        Buffer (0x14)
                                        {
                                            /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                            /* 0008 */   0x68, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,
                                            /* 0010 */   0xFF, 0xFF, 0xFF, 0xFF
                                        }
                                    })
                                    Return (PLDP)
                                }
                            }
                            Device (HUB3)
                            {
                                Name (_ADR, 0x03)
                                Name (_STA, 0x0F)
                                Name (_UPC, Package (0x04)
                                {
                                    Zero, 
                                    0xFF, 
                                    Zero, 
                                    Zero
                                })
                                Method (_PLD, 0, Serialized)
                                {
                                    Name (PLDP, Package (0x01)
                                    {
                                        Buffer (0x14)
                                        {
                                            /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                            /* 0008 */   0x68, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,
                                            /* 0010 */   0xFF, 0xFF, 0xFF, 0xFF
                                        }
                                    })
                                    Return (PLDP)
                                }
                            }
                            Device (HUB4)
                            {
                                Name (_ADR, 0x04)
                                Name (_STA, 0x0F)
                                Name (_UPC, Package (0x04)
                                {
                                    Zero, 
                                    0xFF, 
                                    Zero, 
                                    Zero
                                })
                                Method (_PLD, 0, Serialized)
                                {
                                    Name (PLDP, Package (0x01)
                                    {
                                        Buffer (0x14)
                                        {
                                            /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                            /* 0008 */   0x68, 0x01, 0x00, 0x01, 0x00, 0x00, 0x00, 0x00,
                                            /* 0010 */   0xFF, 0xFF, 0xFF, 0xFF
                                        }
                                    })
                                    Return (PLDP)
                                }
                            }
                        }
                        Device (HS03)
                        {
                            Name (_ADR, 0x03)
                            Method (_UPC, 0, Serialized)
                            {
                                Name (UPCP, Package (0x04)
                                {
                                    Zero, 
                                    0xFF, 
                                    Zero, 
                                    Zero
                                })
                                Return (UPCP)
                            }
                            Method (_PLD, 0, Serialized)
                            {
                                Name (PLDP, Package (0x01)
                                {
                                    Buffer (0x10)
                                    {
                                        /* 0000 */   0x82, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00, 0x00,
                                        /* 0008 */   0x68, 0x01, 0x80, 0x00, 0x00, 0x00, 0x00, 0x00
                                    }
                                })
                                Return (PLDP)
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
                        IRQNoFlags ()
                            {8}
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
                    Name (_HID, EisaId ("FUJ7401"))
                    Name (_CID, EisaId ("PNP0303"))
                    Method (_STA, 0, NotSerialized)
                    {
                        Store (PKBC, Local0)
                        If (And (Local0, One))
                        {
                            Store (PKBD, Local0)
                        }
                        Return (0x0F)
                    }
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
                    Method (_HID, 0, NotSerialized)
                    {
                        If (LEqual (TCTP, One))
                        {
                            Return (0xB57D2E4F)
                        }
                        If (LEqual (TCTP, 0x02))
                        {
                            Return (0x0A058416)
                        }
                        Return (0x0A058416)
                    }
                    Name (_CID, Package (0x03)
                    {
                        EisaId ("SYN1B00"), 
                        EisaId ("SYN0002"), 
                        EisaId ("PNP0F13")
                    })
                    Method (_STA, 0, NotSerialized)
                    {
                        If (LOr (LEqual (^^^WMID.TOPT, Zero), LLess (OSYS, 0x07DD)))
                        {
                            Store (Zero, I2CT)
                            Return (0x0F)
                        }
                        Else
                        {
                            Store (One, I2CT)
                            Return (Zero)
                        }
                    }
                    Name (_CRS, ResourceTemplate ()
                    {
                        IRQ (Edge, ActiveHigh, Exclusive, )
                            {12}
                    })
                    Name (_PRS, ResourceTemplate ()
                    {
                        StartDependentFn (0x00, 0x00)
                        {
                            IRQNoFlags ()
                                {12}
                        }
                        EndDependentFn ()
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
                Device (UAR3)
                {
                    Name (_HID, EisaId ("PNP0501"))
                    Name (_UID, 0x03)
                    Name (SIDP, 0x164E)
                    OperationRegion (SMSC, SystemIO, SIDP, 0x02)
                    Field (SMSC, ByteAcc, NoLock, Preserve)
                    {
                        INDX,   8, 
                        DATA,   8
                    }
                    IndexField (INDX, DATA, ByteAcc, NoLock, Preserve)
                    {
                        Offset (0x02), 
                        CR02,   8, 
                        Offset (0x0C), 
                        CR0C,   8, 
                        CR0D,   8, 
                        Offset (0x25), 
                        CR25,   8, 
                        Offset (0x28), 
                        CR28,   8
                    }
                    Method (ENCG, 0, NotSerialized)
                    {
                        Store (0x55, INDX)
                    }
                    Method (EXCG, 0, NotSerialized)
                    {
                        Store (0xAA, INDX)
                    }
                    Method (_STA, 0, Serialized)
                    {
                        ENCG ()
                        Store (CR0D, Local0)
                        If (LEqual (Local0, 0x82))
                        {
                            Store (0x0F, Local1)
                        }
                        Else
                        {
                            Store (Zero, Local1)
                        }
                        EXCG ()
                        Return (Local1)
                    }
                    Method (_CRS, 0, Serialized)
                    {
                        Name (BUF0, ResourceTemplate ()
                        {
                            IO (Decode16,
                                0x03F8,             // Range Minimum
                                0x03F8,             // Range Maximum
                                0x08,               // Alignment
                                0x08,               // Length
                                _Y09)
                            IRQNoFlags (_Y0A)
                                {4}
                        })
                        CreateByteField (BUF0, \_SB.PCI0.LPC0.UAR3._CRS._Y09._MIN, IOL0)
                        CreateByteField (BUF0, 0x03, IOH0)
                        CreateByteField (BUF0, \_SB.PCI0.LPC0.UAR3._CRS._Y09._MAX, IOL1)
                        CreateByteField (BUF0, 0x05, IOH1)
                        CreateByteField (BUF0, \_SB.PCI0.LPC0.UAR3._CRS._Y09._LEN, LEN0)
                        CreateWordField (BUF0, \_SB.PCI0.LPC0.UAR3._CRS._Y0A._INT, IRQW)
                        ENCG ()
                        ShiftLeft (CR25, 0x02, IOL0)
                        ShiftLeft (CR25, 0x02, IOL1)
                        ShiftRight (CR25, 0x06, IOH0)
                        ShiftRight (CR25, 0x06, IOH1)
                        Store (0x08, LEN0)
                        ShiftLeft (One, And (CR28, 0x0F), IRQW)
                        EXCG ()
                        Return (BUF0)
                    }
                }
                OperationRegion (PKBS, SystemIO, 0x60, 0x05)
                Field (PKBS, ByteAcc, Lock, Preserve)
                {
                    PKBD,   8, 
                    Offset (0x02), 
                    Offset (0x03), 
                    Offset (0x04), 
                    PKBC,   8
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
        Scope (\_SB)
        {
            Device (ARFB)
            {
                Name (_HID, "10251229")
                Name (_UID, "Acer RF Button")
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
                ,   5, 
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
            Name (_UID, 0x04)
            Name (_CRS, ResourceTemplate ()
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {14}
                Memory32Fixed (ReadWrite,
                    0xFEDC6000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)
            {
                If (LGreaterEqual (TSOS, 0x70))
                {
                    If (LEqual (IC4E, One))
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
                SRAD (0x09, 0xC8)
            }
        }
        Device (I2CF)
        {
            Name (_HID, "AMDI0010")
            Name (_UID, 0x05)
            Name (_CRS, ResourceTemplate ()
            {
                IRQ (Edge, ActiveHigh, Exclusive, )
                    {15}
                Memory32Fixed (ReadWrite,
                    0xFEDCB000,         // Address Base
                    0x00001000,         // Address Length
                    )
            })
            Method (_STA, 0, NotSerialized)
            {
                If (LGreaterEqual (TSOS, 0x70))
                {
                    If (LEqual (IC5E, One))
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
                    Return (DCRS)
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
            Name (_DDN, "COM1")
            Name (_UID, One)
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
                        _Y0B)
                    IRQNoFlags (_Y0C)
                        {3}
                })
                CreateByteField (BUF0, \_SB.PCI0.UAR1._CRS._Y0B._MIN, IOLO)
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, \_SB.PCI0.UAR1._CRS._Y0B._MAX, IORL)
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, \_SB.PCI0.UAR1._CRS._Y0C._INT, IRQL)
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
                        _Y0D)
                    IRQNoFlags (_Y0E)
                        {4}
                })
                CreateByteField (BUF0, \_SB.PCI0.UAR2._CRS._Y0D._MIN, IOLO)
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, \_SB.PCI0.UAR2._CRS._Y0D._MAX, IORL)
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, \_SB.PCI0.UAR2._CRS._Y0E._INT, IRQL)
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
                        _Y0F)
                    IRQNoFlags (_Y10)
                        {3}
                })
                CreateByteField (BUF0, \_SB.PCI0.UAR3._CRS._Y0F._MIN, IOLO)
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, \_SB.PCI0.UAR3._CRS._Y0F._MAX, IORL)
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, \_SB.PCI0.UAR3._CRS._Y10._INT, IRQL)
                ShiftLeft (One, FRUI (WUR2), IRQL)
                Return (BUF0)
            }
        }
        Device (UAR4)
        {
            Name (_HID, EisaId ("PNP0501"))
            Name (_DDN, "COM4")
            Name (_UID, 0x04)
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
                        _Y11)
                    IRQNoFlags (_Y12)
                        {4}
                })
                CreateByteField (BUF0, \_SB.PCI0.UAR4._CRS._Y11._MIN, IOLO)
                CreateByteField (BUF0, 0x03, IOHI)
                CreateByteField (BUF0, \_SB.PCI0.UAR4._CRS._Y11._MAX, IORL)
                CreateByteField (BUF0, 0x05, IORH)
                CreateWordField (BUF0, \_SB.PCI0.UAR4._CRS._Y12._INT, IRQL)
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
    Scope (_SB.I2CA)
    {
        Device (NFC1)
        {
            Name (_HID, EisaId ("NXP8013"))
            Name (_UID, One)
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0029, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB.I2CA",
                        0x00, ResourceConsumer, ,
                        )
                    GpioInt (Level, ActiveHigh, Exclusive, PullNone, 0x0000,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   
// Pin list
                            0x0045
                        }
                    GpioIo (Exclusive, PullNone, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   
// Pin list
                            0x0089
                        }
                    GpioIo (Exclusive, PullNone, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   
// Pin list
                            0x008A
                        }
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (And (LGreaterEqual (TPOS, 0x60), LEqual (NFCS, One)))
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
        Device (NFC1)
        {
            Name (_HID, EisaId ("NXP8013"))
            Name (_UID, 0x02)
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0029, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB.I2CB",
                        0x00, ResourceConsumer, ,
                        )
                    GpioInt (Level, ActiveHigh, Exclusive, PullNone, 0x0000,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   
// Pin list
                            0x0045
                        }
                    GpioIo (Exclusive, PullNone, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   
// Pin list
                            0x0089
                        }
                    GpioIo (Exclusive, PullNone, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   
// Pin list
                            0x008A
                        }
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (And (LGreaterEqual (TPOS, 0x60), LEqual (NFCS, 0x02)))
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
        Device (NFC1)
        {
            Name (_HID, EisaId ("NXP8013"))
            Name (_UID, 0x03)
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0029, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB.I2CC",
                        0x00, ResourceConsumer, ,
                        )
                    GpioInt (Level, ActiveHigh, Exclusive, PullNone, 0x0000,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   
// Pin list
                            0x0045
                        }
                    GpioIo (Exclusive, PullNone, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   
// Pin list
                            0x0089
                        }
                    GpioIo (Exclusive, PullNone, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   
// Pin list
                            0x008A
                        }
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (And (LGreaterEqual (TPOS, 0x60), LEqual (NFCS, 0x03)))
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
        Device (NFC1)
        {
            Name (_HID, EisaId ("NXP8013"))
            Name (_UID, 0x04)
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0029, ControllerInitiated, 0x000186A0,
                        AddressingMode7Bit, "\\_SB.I2CD",
                        0x00, ResourceConsumer, ,
                        )
                    GpioInt (Level, ActiveHigh, Exclusive, PullNone, 0x0000,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   
// Pin list
                            0x0045
                        }
                    GpioIo (Exclusive, PullNone, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   
// Pin list
                            0x0089
                        }
                    GpioIo (Exclusive, PullNone, 0x0000, 0x0000, IoRestrictionOutputOnly,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   
// Pin list
                            0x008A
                        }
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (And (LGreaterEqual (TPOS, 0x60), LEqual (NFCS, 0x04)))
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
        Device (TPNL)
        {
            Name (_HID, EisaId ("PNP0C50"))
            Name (_CID, "PNP0C50")
            Name (_UID, One)
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x004A, ControllerInitiated, 0x000F4240,
                        AddressingMode7Bit, "\\_SB.I2CA",
                        0x00, ResourceConsumer, ,
                        )
                    GpioInt (Level, ActiveLow, Shared, PullUp, 0x0000,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   
// Pin list
                            0x000C
                        }
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (And (LGreaterEqual (TPOS, 0x60), LEqual (THPN, One)))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Method (_DSW, 3, NotSerialized)
            {
                If (Arg0) {}
                Else
                {
                }
            }
            Method (_PS0, 0, NotSerialized)
            {
            }
            Method (_PS3, 0, NotSerialized)
            {
            }
            Method (_DSM, 4, Serialized)
            {
                Name (_T_1, Zero)
                Name (_T_0, Zero)
                If (LEqual (Arg0, Buffer (0x10)
                        {
                            /* 0000 */   0xF7, 0xF6, 0xDF, 0x3C, 0x67, 0x42, 0x55, 0x45,
                            /* 0008 */   0xAD, 0x05, 0xB3, 0x0A, 0x3D, 0x89, 0x38, 0xDE
                        }))
                {
                    While (One)
                    {
                        Store (ToInteger (Arg2), _T_0)
                        If (LEqual (_T_0, Zero))
                        {
                            While (One)
                            {
                                Store (ToInteger (Arg1), _T_1)
                                If (LEqual (_T_1, One))
                                {
                                    Return (Buffer (One)
                                    {
                                         0x03
                                    })
                                }
                                Else
                                {
                                    Return (Buffer (One)
                                    {
                                         0x00
                                    })
                                }
                                Break
                            }
                        }
                        Else
                        {
                            If (LEqual (_T_0, One))
                            {
                                Return (Zero)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                        Break
                    }
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00
                    })
                }
            }
        }
    }
    Scope (_SB.I2CB)
    {
        Device (TPNL)
        {
            Name (_HID, EisaId ("PNP0C50"))
            Name (_CID, "PNP0C50")
            Name (_UID, 0x02)
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x004A, ControllerInitiated, 0x000F4240,
                        AddressingMode7Bit, "\\_SB.I2CB",
                        0x00, ResourceConsumer, ,
                        )
                    GpioInt (Level, ActiveLow, Shared, PullUp, 0x0000,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   
// Pin list
                            0x000C
                        }
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (And (LGreaterEqual (TPOS, 0x60), LEqual (THPN, 0x02)))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Method (_DSW, 3, NotSerialized)
            {
                If (Arg0) {}
                Else
                {
                }
            }
            Method (_PS0, 0, NotSerialized)
            {
            }
            Method (_PS3, 0, NotSerialized)
            {
            }
            Method (_DSM, 4, Serialized)
            {
                Name (_T_1, Zero)
                Name (_T_0, Zero)
                If (LEqual (Arg0, Buffer (0x10)
                        {
                            /* 0000 */   0xF7, 0xF6, 0xDF, 0x3C, 0x67, 0x42, 0x55, 0x45,
                            /* 0008 */   0xAD, 0x05, 0xB3, 0x0A, 0x3D, 0x89, 0x38, 0xDE
                        }))
                {
                    While (One)
                    {
                        Store (ToInteger (Arg2), _T_0)
                        If (LEqual (_T_0, Zero))
                        {
                            While (One)
                            {
                                Store (ToInteger (Arg1), _T_1)
                                If (LEqual (_T_1, One))
                                {
                                    Return (Buffer (One)
                                    {
                                         0x03
                                    })
                                }
                                Else
                                {
                                    Return (Buffer (One)
                                    {
                                         0x00
                                    })
                                }
                                Break
                            }
                        }
                        Else
                        {
                            If (LEqual (_T_0, One))
                            {
                                Return (Zero)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                        Break
                    }
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00
                    })
                }
            }
        }
    }
    Scope (_SB.I2CC)
    {
        Device (TPNL)
        {
            Name (_HID, EisaId ("PNP0C50"))
            Name (_CID, "PNP0C50")
            Name (_UID, 0x03)
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x004A, ControllerInitiated, 0x000F4240,
                        AddressingMode7Bit, "\\_SB.I2CC",
                        0x00, ResourceConsumer, ,
                        )
                    GpioInt (Level, ActiveLow, Shared, PullUp, 0x0000,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   
// Pin list
                            0x000C
                        }
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (And (LGreaterEqual (TPOS, 0x60), LEqual (THPN, 0x03)))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Method (_DSW, 3, NotSerialized)
            {
                If (Arg0) {}
                Else
                {
                }
            }
            Method (_PS0, 0, NotSerialized)
            {
            }
            Method (_PS3, 0, NotSerialized)
            {
            }
            Method (_DSM, 4, Serialized)
            {
                Name (_T_1, Zero)
                Name (_T_0, Zero)
                If (LEqual (Arg0, Buffer (0x10)
                        {
                            /* 0000 */   0xF7, 0xF6, 0xDF, 0x3C, 0x67, 0x42, 0x55, 0x45,
                            /* 0008 */   0xAD, 0x05, 0xB3, 0x0A, 0x3D, 0x89, 0x38, 0xDE
                        }))
                {
                    While (One)
                    {
                        Store (ToInteger (Arg2), _T_0)
                        If (LEqual (_T_0, Zero))
                        {
                            While (One)
                            {
                                Store (ToInteger (Arg1), _T_1)
                                If (LEqual (_T_1, One))
                                {
                                    Return (Buffer (One)
                                    {
                                         0x03
                                    })
                                }
                                Else
                                {
                                    Return (Buffer (One)
                                    {
                                         0x00
                                    })
                                }
                                Break
                            }
                        }
                        Else
                        {
                            If (LEqual (_T_0, One))
                            {
                                Return (Zero)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                        Break
                    }
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00
                    })
                }
            }
        }
    }
    Scope (_SB.I2CD)
    {
        Device (TPNL)
        {
            Name (_HID, EisaId ("PNP0C50"))
            Name (_CID, "PNP0C50")
            Name (_UID, 0x04)
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x004A, ControllerInitiated, 0x000F4240,
                        AddressingMode7Bit, "\\_SB.I2CD",
                        0x00, ResourceConsumer, ,
                        )
                    GpioInt (Level, ActiveLow, Shared, PullUp, 0x0000,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   
// Pin list
                            0x000C
                        }
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (And (LGreaterEqual (TPOS, 0x60), LEqual (THPN, 0x04)))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Method (_DSW, 3, NotSerialized)
            {
                If (Arg0) {}
                Else
                {
                }
            }
            Method (_PS0, 0, NotSerialized)
            {
            }
            Method (_PS3, 0, NotSerialized)
            {
            }
            Method (_DSM, 4, Serialized)
            {
                Name (_T_1, Zero)
                Name (_T_0, Zero)
                If (LEqual (Arg0, Buffer (0x10)
                        {
                            /* 0000 */   0xF7, 0xF6, 0xDF, 0x3C, 0x67, 0x42, 0x55, 0x45,
                            /* 0008 */   0xAD, 0x05, 0xB3, 0x0A, 0x3D, 0x89, 0x38, 0xDE
                        }))
                {
                    While (One)
                    {
                        Store (ToInteger (Arg2), _T_0)
                        If (LEqual (_T_0, Zero))
                        {
                            While (One)
                            {
                                Store (ToInteger (Arg1), _T_1)
                                If (LEqual (_T_1, One))
                                {
                                    Return (Buffer (One)
                                    {
                                         0x03
                                    })
                                }
                                Else
                                {
                                    Return (Buffer (One)
                                    {
                                         0x00
                                    })
                                }
                                Break
                            }
                        }
                        Else
                        {
                            If (LEqual (_T_0, One))
                            {
                                Return (Zero)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                        Break
                    }
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00
                    })
                }
            }
        }
    }
    Scope (_SB.I2CA)
    {
        Device (TPDD)
        {
            Name (_HID, EisaId ("PNP0C50"))
            Name (_CID, "PNP0C50")
            Name (_UID, 0x05)
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0020, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2CA",
                        0x00, ResourceConsumer, ,
                        )
                    GpioInt (Level, ActiveLow, Exclusive, PullUp, 0x0000,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   
// Pin list
                            0x0009
                        }
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (And (LGreaterEqual (TPOS, 0x60), LEqual (THPD, One)))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Method (_DSW, 3, NotSerialized)
            {
                If (Arg0) {}
                Else
                {
                }
            }
            Method (_PS0, 0, NotSerialized)
            {
            }
            Method (_PS3, 0, NotSerialized)
            {
            }
            Method (_DSM, 4, Serialized)
            {
                Name (_T_1, Zero)
                Name (_T_0, Zero)
                If (LEqual (Arg0, Buffer (0x10)
                        {
                            /* 0000 */   0xF7, 0xF6, 0xDF, 0x3C, 0x67, 0x42, 0x55, 0x45,
                            /* 0008 */   0xAD, 0x05, 0xB3, 0x0A, 0x3D, 0x89, 0x38, 0xDE
                        }))
                {
                    While (One)
                    {
                        Store (ToInteger (Arg2), _T_0)
                        If (LEqual (_T_0, Zero))
                        {
                            While (One)
                            {
                                Store (ToInteger (Arg1), _T_1)
                                If (LEqual (_T_1, One))
                                {
                                    Return (Buffer (One)
                                    {
                                         0x03
                                    })
                                }
                                Else
                                {
                                    Return (Buffer (One)
                                    {
                                         0x00
                                    })
                                }
                                Break
                            }
                        }
                        Else
                        {
                            If (LEqual (_T_0, One))
                            {
                                Return (0x20)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                        Break
                    }
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00
                    })
                }
            }
        }
    }
    Scope (_SB.I2CB)
    {
        Device (TPDD)
        {
            Name (_HID, EisaId ("PNP0C50"))
            Name (_CID, "PNP0C50")
            Name (_UID, 0x06)
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0020, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2CB",
                        0x00, ResourceConsumer, ,
                        )
                    GpioInt (Level, ActiveLow, Exclusive, PullUp, 0x0000,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   
// Pin list
                            0x0009
                        }
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (And (LGreaterEqual (TPOS, 0x60), LEqual (THPD, 0x02)))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Method (_DSW, 3, NotSerialized)
            {
                If (Arg0) {}
                Else
                {
                }
            }
            Method (_PS0, 0, NotSerialized)
            {
            }
            Method (_PS3, 0, NotSerialized)
            {
            }
            Method (_DSM, 4, Serialized)
            {
                Name (_T_1, Zero)
                Name (_T_0, Zero)
                If (LEqual (Arg0, Buffer (0x10)
                        {
                            /* 0000 */   0xF7, 0xF6, 0xDF, 0x3C, 0x67, 0x42, 0x55, 0x45,
                            /* 0008 */   0xAD, 0x05, 0xB3, 0x0A, 0x3D, 0x89, 0x38, 0xDE
                        }))
                {
                    While (One)
                    {
                        Store (ToInteger (Arg2), _T_0)
                        If (LEqual (_T_0, Zero))
                        {
                            While (One)
                            {
                                Store (ToInteger (Arg1), _T_1)
                                If (LEqual (_T_1, One))
                                {
                                    Return (Buffer (One)
                                    {
                                         0x03
                                    })
                                }
                                Else
                                {
                                    Return (Buffer (One)
                                    {
                                         0x00
                                    })
                                }
                                Break
                            }
                        }
                        Else
                        {
                            If (LEqual (_T_0, One))
                            {
                                Return (0x20)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                        Break
                    }
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00
                    })
                }
            }
        }
    }
    Scope (_SB.I2CC)
    {
        Device (TPDD)
        {
            Name (_HID, EisaId ("PNP0C50"))
            Name (_CID, "PNP0C50")
            Name (_UID, 0x07)
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0020, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2CC",
                        0x00, ResourceConsumer, ,
                        )
                    GpioInt (Level, ActiveLow, Exclusive, PullUp, 0x0000,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   
// Pin list
                            0x0009
                        }
                })
                Return (RBUF)
            }
            Method (_STA, 0, NotSerialized)
            {
                If (And (LGreaterEqual (TPOS, 0x60), LEqual (THPD, 0x03)))
                {
                    Return (0x0F)
                }
                Else
                {
                    Return (Zero)
                }
            }
            Method (_DSW, 3, NotSerialized)
            {
                If (Arg0) {}
                Else
                {
                }
            }
            Method (_PS0, 0, NotSerialized)
            {
            }
            Method (_PS3, 0, NotSerialized)
            {
            }
            Method (_DSM, 4, Serialized)
            {
                Name (_T_1, Zero)
                Name (_T_0, Zero)
                If (LEqual (Arg0, Buffer (0x10)
                        {
                            /* 0000 */   0xF7, 0xF6, 0xDF, 0x3C, 0x67, 0x42, 0x55, 0x45,
                            /* 0008 */   0xAD, 0x05, 0xB3, 0x0A, 0x3D, 0x89, 0x38, 0xDE
                        }))
                {
                    While (One)
                    {
                        Store (ToInteger (Arg2), _T_0)
                        If (LEqual (_T_0, Zero))
                        {
                            While (One)
                            {
                                Store (ToInteger (Arg1), _T_1)
                                If (LEqual (_T_1, One))
                                {
                                    Return (Buffer (One)
                                    {
                                         0x03
                                    })
                                }
                                Else
                                {
                                    Return (Buffer (One)
                                    {
                                         0x00
                                    })
                                }
                                Break
                            }
                        }
                        Else
                        {
                            If (LEqual (_T_0, One))
                            {
                                Return (0x20)
                            }
                            Else
                            {
                                Return (Zero)
                            }
                        }
                        Break
                    }
                }
                Else
                {
                    Return (Buffer (One)
                    {
                         0x00
                    })
                }
            }
        }
    }
    Name (HIDG, Buffer (0x10)
    {
        /* 0000 */   0xF7, 0xF6, 0xDF, 0x3C, 0x67, 0x42, 0x55, 0x45,
        /* 0008 */   0xAD, 0x05, 0xB3, 0x0A, 0x3D, 0x89, 0x38, 0xDE
    })
    Method (HIDD, 5, Serialized)
    {
        If (LEqual (Arg0, HIDG))
        {
            If (LEqual (Arg2, Zero))
            {
                If (LEqual (Arg1, One))
                {
                    Return (Buffer (One)
                    {
                         0x03
                    })
                }
            }
            If (LEqual (Arg2, One))
            {
                Return (Arg4)
            }
        }
        Return (Buffer (One)
        {
             0x00
        })
    }
    Scope (_SB.I2CD)
    {
        Device (TPDE)
        {
            Name (HID2, One)
            Name (_HID, "ELAN0501")
            Name (_CID, "PNP0C50")
            Name (_S0W, 0x04)
            Name (TPSW, Zero)
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x0015, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2CD",
                        0x00, ResourceConsumer, ,
                        )
                    GpioInt (Level, ActiveLow, Exclusive, PullUp, 0x0000,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   
// Pin list
                            0x0009
                        }
                })
                Return (RBUF)
            }
            Method (_DSM, 4, Serialized)
            {
                If (LEqual (Arg0, HIDG))
                {
                    Return (HIDD (Arg0, Arg1, Arg2, Arg3, HID2))
                }
                Return (Buffer (One)
                {
                     0x00
                })
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LOr (LEqual (^^^PCI0.WMID.TOPT, Zero), LLess (OSYS, 0x07DD)))
                {
                    Store (Zero, I2CT)
                    Return (Zero)
                }
                Else
                {
                    Store (One, I2CT)
                    If (LEqual (TCTP, One))
                    {
                        Return (Zero)
                    }
                    Return (0x0F)
                }
            }
        }
        Device (TPDS)
        {
            Name (HID2, 0x20)
            Name (_HID, "SYNA7DB5")
            Name (_CID, "PNP0C50")
            Name (_S0W, 0x04)
            Name (TPSW, Zero)
            Method (_CRS, 0, NotSerialized)
            {
                Name (RBUF, ResourceTemplate ()
                {
                    I2cSerialBus (0x002C, ControllerInitiated, 0x00061A80,
                        AddressingMode7Bit, "\\_SB.I2CD",
                        0x00, ResourceConsumer, ,
                        )
                    GpioInt (Level, ActiveLow, Exclusive, PullUp, 0x0000,
                        "\\_SB.GPIO", 0x00, ResourceConsumer, ,
                        )
                        {   
// Pin list
                            0x0009
                        }
                })
                Return (RBUF)
            }
            Method (_DSM, 4, Serialized)
            {
                If (LEqual (Arg0, HIDG))
                {
                    Return (HIDD (Arg0, Arg1, Arg2, Arg3, HID2))
                }
                Return (Buffer (One)
                {
                     0x00
                })
            }
            Method (_STA, 0, NotSerialized)
            {
                If (LOr (LEqual (^^^PCI0.WMID.TOPT, Zero), LLess (OSYS, 0x07DD)))
                {
                    Store (Zero, I2CT)
                    Return (Zero)
                }
                Else
                {
                    Store (One, I2CT)
                    If (LEqual (TCTP, One))
                    {
                        Return (0x0F)
                    }
                    Return (Zero)
                }
            }
        }
    }
    OperationRegion (PECM, SystemIO, 0x72, 0x02)
    Field (PECM, ByteAcc, Lock, Preserve)
    {
        EIND,   8, 
        EDAT,   8
    }
    IndexField (EIND, EDAT, ByteAcc, NoLock, Preserve)
    {
        Offset (0xE0), 
        RAMB,   32, 
        RESV,   32, 
        CTPF,   8, 
        WLDP,   1, 
        BTDP,   1, 
        RES1,   2, 
        WRST,   1, 
        BRST,   1, 
        RES2,   2, 
        FSCU,   8, 
        RSDF,   8, 
        ABTY,   8, 
        RES3,   24, 
        S3TL,   8, 
        S3TH,   8, 
        ES3M,   1, 
        SS3F,   1, 
        KBST,   1, 
        I2CT,   1, 
        TCTP,   2, 
        KBLS,   2, 
        RES4,   16, 
        LDDF,   8, 
        S3FA,   8, 
        POS0,   8, 
        POS1,   8, 
        POS2,   8, 
        POS3,   8, 
        POS4,   8, 
        POS5,   8, 
        MANN,   8, 
        RES5,   16
    }
    OperationRegion (RAMW, SystemMemory, RAMB, 0x0100)
    Field (RAMW, AnyAcc, NoLock, Preserve)
    {
        TT_P,   8, 
        FS_F,   8, 
        FS_T,   16, 
        FA_D,   32, 
        FS_Z,   16, 
        ST_P,   8, 
        MN_A,   64, 
        BT_P,   8, 
        AL_D,   32, 
        DB_1,   8, 
        DB_2,   32, 
        DB_3,   32, 
        DB_4,   32, 
        RT_W,   16, 
        PM_B,   32, 
        PM_S,   8, 
        AC_F,   8, 
        DC_F,   8, 
        DC_2,   8, 
        VG_F,   16, 
        PD_L,   16, 
        CD_L,   16, 
        CD_S,   16, 
        ND_S,   16, 
        SD_S,   16, 
        CN_R,   8, 
        TJ_M,   16, 
        TR_T,   8, 
        CR_T,   8, 
        PC_P,   8, 
        S3_E,   16, 
        S3_B,   16, 
        S3_O,   16
    }
    Scope (\)
    {
        OperationRegion (GPSC, SystemIO, 0xB0, 0x02)
        Field (GPSC, ByteAcc, NoLock, Preserve)
        {
            SMCM,   8, 
            SMST,   8
        }
        Method (ISMI, 1, Serialized)
        {
            Store (Arg0, SMCM)
        }
        Method (ASMI, 1, Serialized)
        {
            Store (Arg0, AL_D)
            Store (0xD6, SMCM)
            Return (AL_D)
        }
        Method (DB_G, 4, NotSerialized)
        {
            Store (Arg0, DB_1)
            Store (Arg1, DB_2)
            Store (Arg2, DB_3)
            Store (Arg3, DB_4)
            ASMI (0x80)
        }
    }
    Scope (_SB.PCI0.LPC0)
    {
        Device (EC0)
        {
            Name (_HID, EisaId ("PNP0C09"))
            Name (CRS, ResourceTemplate ()
            {
                IO (Decode16,
                    0x0062,             // Range Minimum
                    0x0062,             // Range Maximum
                    0x00,               // Alignment
                    0x01,               // Length
                    )
                IO (Decode16,
                    0x0066,             // Range Minimum
                    0x0066,             // Range Maximum
                    0x00,               // Alignment
                    0x01,               // Length
                    )
            })
            Method (_CRS, 0, NotSerialized)
            {
                Return (CRS)
            }
            Name (_GPE, 0x03)
            OperationRegion (TRDP, SystemIO, 0x025C, 0x02)
            Field (TRDP, ByteAcc, NoLock, Preserve)
            {
                AEID,   8, 
                AEIC,   8
            }
            Mutex (MUEC, 0x00)
            Name (ECFL, Ones)
            Method (ECAV, 0, NotSerialized)
            {
                If (LGreaterEqual (_REV, 0x02))
                {
                    Return (One)
                }
                If (LGreaterEqual (ST_P, 0x04))
                {
                    Return (Zero)
                }
                If (LEqual (ECFL, Ones))
                {
                    Return (Zero)
                }
                Return (ECFL)
            }
            OperationRegion (ECW1, SystemMemory, 0xFEFF0380, 0x80)
            Field (ECW1, ByteAcc, Lock, Preserve)
            {
                Offset (0x01), 
                EPWS,   8, 
                EB0S,   8, 
                EB1S,   8, 
                EB0R,   8, 
                EB1R,   8, 
                EB0T,   8, 
                EB1T,   8, 
                OCOT,   8, 
                Offset (0x10), 
                B0PN,   16, 
                B0VL,   16, 
                B0RC,   16, 
                B0FC,   16, 
                B0ST,   16, 
                B0CC,   16, 
                B0TM,   16, 
                B0C1,   16, 
                B0CV,   16, 
                Offset (0x30), 
                B1PN,   16, 
                B1VL,   16, 
                B1RC,   16, 
                B1FC,   16, 
                B1ST,   16, 
                B1CC,   16, 
                B1TM,   16, 
                B1C1,   16, 
                B1CV,   16, 
                Offset (0x50), 
                B0DC,   16, 
                B0DV,   16, 
                B0SN,   16, 
                B0MD,   16, 
                B1DC,   16, 
                B1DV,   16, 
                B1SN,   16, 
                B1MD,   16, 
                TH1R,   8, 
                TH1L,   8, 
                TH0R,   8, 
                TH0L,   8, 
                ECRT,   8, 
                EPSV,   8, 
                EACT,   8, 
                TERR,   8, 
                F0TS,   16, 
                F1TS,   16, 
                F0CS,   8, 
                F1CS,   8, 
                PCPT,   16, 
                ALSC,   8, 
                Offset (0x72), 
                ALSU,   16, 
                ALSL,   16, 
                ALSX,   16, 
                BRTC,   8, 
                BCDV,   8, 
                AINP,   16
            }
            OperationRegion (ECW2, SystemMemory, 0xFEFF0700, 0x80)
            Field (ECW2, ByteAcc, Lock, Preserve)
            {
                ESEM,   8, 
                CMD1,   8, 
                CDT1,   8, 
                CDT2,   8, 
                CDT3,   8, 
                CDT4,   8, 
                CDT5,   8, 
                CDT6,   8, 
                CDT7,   8, 
                CDT8,   8, 
                CDT9,   8, 
                CD10,   8, 
                CD11,   8, 
                CD12,   8, 
                Offset (0x40), 
                EDA1,   8, 
                EDA2,   8, 
                EDA3,   8, 
                EDA4,   8, 
                EDA5,   8, 
                EDA6,   8, 
                EDA7,   8, 
                EDA8,   8, 
                EDA9,   8, 
                ED10,   8, 
                ED11,   8, 
                ED12,   8
            }
            OperationRegion (ECW3, SystemMemory, 0xFEFF0CF0, 0x80)
            Field (ECW3, ByteAcc, Lock, Preserve)
            {
                CTLB,   8, 
                CTHB,   8, 
                CFLB,   8, 
                CFHB,   8, 
                STLB,   8, 
                STHB,   8, 
                SFLB,   8, 
                SFHB,   8, 
                GFLB,   8, 
                GFHB,   8
            }
            OperationRegion (PHM0, SystemMemory, 0xFEFF0380, 0x80)
            Field (PHM0, ByteAcc, Lock, Preserve)
            {
                Offset (0x12), 
                BD25,   8, 
                BD26,   8, 
                BD27,   8, 
                BD28,   8, 
                BD29,   8, 
                BD2A,   8, 
                BD2D,   8, 
                BD2E,   8, 
                BD2F,   8, 
                BD30,   8, 
                BD31,   8, 
                BD32,   8, 
                Offset (0x22), 
                BD33,   8, 
                BD34,   8, 
                BD35,   8, 
                BD36,   8, 
                BD37,   8, 
                BD38,   8, 
                BD39,   8, 
                BD3A,   8, 
                Offset (0x50), 
                BD3B,   8, 
                BD3C,   8, 
                BD3D,   8, 
                BD3E,   8, 
                Offset (0x60), 
                BD20,   8, 
                Offset (0x62), 
                BD22,   8, 
                Offset (0x68), 
                BD23,   8, 
                BD24,   8, 
                Offset (0x6E), 
                BD21,   8
            }
            OperationRegion (PHM1, SystemMemory, 0xFEFF0700, 0xFF)
            Field (PHM1, ByteAcc, Lock, Preserve)
            {
                Offset (0xB7), 
                BD1E,   8, 
                BD1F,   8, 
                Offset (0xBA), 
                BD1C,   8, 
                BD1D,   8, 
                Offset (0xBE), 
                BD1A,   8, 
                BD1B,   8, 
                Offset (0xC5), 
                PECR,   8, 
                Offset (0xC8), 
                CR01,   8, 
                CR02,   8, 
                CR03,   8, 
                CR04,   8, 
                CR05,   8
            }
            OperationRegion (ECWB, SystemMemory, 0xFEFF0700, 0x80)
            Field (ECWB, ByteAcc, Lock, Preserve)
            {
                ESEB,   8, 
                CMDB,   8, 
                CDTB,   496, 
                EDAB,   512
            }
            Method (_REG, 2, NotSerialized)
            {
                Notify (AC0, 0x80)
            }
            Name (BADR, 0x0B)
            Name (CADR, 0x09)
            Name (SADR, 0x0A)
            Name (ISHE, Zero)
            Method (_INI, 0, Serialized)
            {
                Store (RR_M (0x04A0), Local1)
                Or (Local1, 0x88, Local1)
                And (Local1, 0xFE, Local1)
                WR_M (0x04A0, Local1)
                Store (One, ECFL)
                Store (RR_M (0x04A0), Local1)
                Or (Local1, 0x08, Local1)
                WR_M (0x04A0, Local1)
                H0_2 ()
                If (LGreaterEqual (OSYS, 0x07DC))
                {
                    WR_M (0x0617, One)
                }
                Else
                {
                    WR_M (0x0617, Zero)
                }
            }
            Method (ALMH, 1, NotSerialized)
            {
                If (LEqual (Arg0, BADR))
                {
                    NB_T (0x80)
                }
            }
            Method (SR_W, 1, NotSerialized)
            {
                Store (SR_T (RDWD, BADR, Arg0), Local0)
                Store (DerefOf (Index (Local0, Zero)), Local1)
                If (Local1)
                {
                    Return (Ones)
                }
                Else
                {
                    Return (DerefOf (Index (Local0, 0x02)))
                }
            }
            Name (BSLF, Zero)
            Method (BS_F, 1, Serialized)
            {
                If (Arg0)
                {
                    Store (One, BSLF)
                }
                Else
                {
                    Store (Zero, BSLF)
                }
            }
            Method (BP_U, 0, Serialized)
            {
                If (BSLF)
                {
                    Store (B1MD, Local0)
                }
                Else
                {
                    Store (B0MD, Local0)
                }
                If (LNotEqual (Local0, 0xFFFF))
                {
                    ShiftRight (Local0, 0x0F, Local1)
                    And (Local1, One, Local1)
                    XOr (Local1, One, Local0)
                }
                Return (Local0)
            }
            Method (BD_C, 0, Serialized)
            {
                If (BSLF)
                {
                    Store (B1DC, Local0)
                }
                Else
                {
                    Store (B0DC, Local0)
                }
                And (Local0, 0xFFFF, Local0)
                Return (Local0)
            }
            Method (BL_F, 0, Serialized)
            {
                If (BSLF)
                {
                    Store (B1FC, Local0)
                }
                Else
                {
                    Store (B0FC, Local0)
                }
                And (Local0, 0xFFFF, Local0)
                Return (Local0)
            }
            Method (BT_C, 0, Serialized)
            {
                If (BSLF)
                {
                    Store (B1MD, Local0)
                }
                Else
                {
                    Store (B0MD, Local0)
                }
                If (LNotEqual (Local0, 0xFFFF))
                {
                    ShiftRight (Local0, 0x09, Local0)
                    And (Local0, One, Local0)
                    XOr (Local0, One, Local0)
                }
                Else
                {
                    Store (Zero, Local0)
                }
                Return (Local0)
            }
            Method (BD_V, 0, Serialized)
            {
                If (BSLF)
                {
                    Store (B1DV, Local0)
                }
                Else
                {
                    Store (B0DV, Local0)
                }
                Return (Local0)
            }
            Method (BD_N, 0, NotSerialized)
            {
                Name (BSTR, Buffer (0x20) {})
                Store (SR_T (RDBL, BADR, 0x21), Local0)
                If (LNotEqual (DerefOf (Index (Local0, Zero)), Zero))
                {
                    Store (Zero, Index (BSTR, 0x04))
                }
                Else
                {
                    Store (DerefOf (Index (Local0, 0x02)), BSTR)
                    Store (Zero, Index (BSTR, DerefOf (Index (Local0, One))))
                }
                Return (BSTR)
            }
            Method (BS_N, 0, Serialized)
            {
                If (BSLF)
                {
                    Store (B1SN, Local0)
                }
                Else
                {
                    Store (B0SN, Local0)
                }
                Return (Local0)
            }
            Method (BS_T, 0, Serialized)
            {
                If (BSLF)
                {
                    Store (B1ST, Local0)
                }
                Else
                {
                    Store (B0ST, Local0)
                }
                Return (Local0)
            }
            Method (BC_R, 0, Serialized)
            {
                If (BSLF)
                {
                    Store (B1CC, Local0)
                }
                Else
                {
                    Store (B0CC, Local0)
                }
                Return (Local0)
            }
            Method (BR_C, 0, Serialized)
            {
                If (BSLF)
                {
                    Store (B1RC, Local0)
                }
                Else
                {
                    Store (B0RC, Local0)
                }
                Return (Local0)
            }
            Method (BV_T, 0, Serialized)
            {
                If (BSLF)
                {
                    Store (B1VL, Local0)
                }
                Else
                {
                    Store (B0VL, Local0)
                }
                Return (Local0)
            }
            Method (BT_P, 1, Serialized)
            {
                And (EPWS, 0x02, Local0)
                If (Local0)
                {
                    Store (One, Local1)
                }
                Else
                {
                    Store (Zero, Local1)
                }
                And (EPWS, 0x04, Local0)
                If (Local0)
                {
                    Store (One, Local2)
                }
                Else
                {
                    Store (Zero, Local2)
                }
                If (Arg0)
                {
                    Store (Local2, DC_2)
                    Return (Local2)
                }
                Else
                {
                    Store (Local1, DC_F)
                    Return (Local1)
                }
            }
            Method (AP_S, 0, Serialized)
            {
                And (EPWS, One, Local0)
                Return (Local0)
            }
            Method (GB_T, 1, Serialized)
            {
                If (LEqual (Arg0, Zero))
                {
                    Store (EB0T, Local0)
                }
                Else
                {
                    Store (EB1T, Local0)
                }
                Return (Local0)
            }
            Method (BC_H, 1, Serialized)
            {
                If (Arg0)
                {
                    Store (EB1S, Local0)
                }
                Else
                {
                    Store (EB0S, Local0)
                }
                And (Local0, 0xFF, Local0)
                If (LNotEqual (Local0, 0xFF))
                {
                    And (Local0, 0x02, Local0)
                    ShiftRight (Local0, One, Local0)
                }
                Else
                {
                    Store (Zero, Local0)
                }
                Return (Local0)
            }
            Method (BC_F, 1, Serialized)
            {
                If (Arg0)
                {
                    Store (EB1S, Local0)
                }
                Else
                {
                    Store (EB0S, Local0)
                }
                And (Local0, 0xFF, Local0)
                If (LNotEqual (Local0, 0xFF))
                {
                    And (Local0, 0x10, Local0)
                    ShiftRight (Local0, 0x04, Local0)
                }
                Else
                {
                    Store (Zero, Local0)
                }
                Return (Local0)
            }
            Method (CB_T, 1, Serialized)
            {
                Store (GB_T (Arg0), Local1)
                If (LEqual (Local1, 0xFF))
                {
                    Store (Zero, Local0)
                }
                Else
                {
                    And (Local1, 0x10, Local0)
                    If (Local0)
                    {
                        Store (One, Local0)
                    }
                }
                Return (Local0)
            }
            Method (FS_C, 1, Serialized)
            {
                If (Arg0)
                {
                    Store (F1TS, Local0)
                }
                Else
                {
                    Store (F0TS, Local0)
                }
                Not (Local0, Local0)
                And (Local0, 0xFFFF, Local0)
                If (LNotEqual (Local0, Zero))
                {
                    If (LEqual (Local0, 0xFFFF))
                    {
                        Store (Zero, Local0)
                    }
                    Else
                    {
                        Multiply (Local0, 0x02, Local0)
                        Store (0x001C8402, Local1)
                        Divide (Local1, Local0, Local2, Local0)
                    }
                }
                Else
                {
                    Store (Zero, Local0)
                }
                Return (Local0)
            }
            Method (RT_M, 0, NotSerialized)
            {
                Store (RR_M (0x03E2), Local0)
                Return (Local0)
            }
            Method (RC_R, 0, NotSerialized)
            {
                Store (ECRT, Local0)
                If (LGreater (Local0, 0x80))
                {
                    Store (0x7F, Local0)
                }
                Return (Local0)
            }
            Method (RS_V, 0, NotSerialized)
            {
                Store (EPSV, Local0)
                If (LGreater (Local0, 0x80))
                {
                    Store (0x7F, Local0)
                }
                Return (Local0)
            }
            Method (EC_S, 1, NotSerialized)
            {
                OE_S (Arg0)
            }
            Method (EC_W, 1, NotSerialized)
            {
                If (LLessEqual (Arg0, 0x04)) {}
                If (LEqual (Arg0, 0x03))
                {
                    If (LEqual (M009, 0x8B))
                    {
                        Noop
                        PTPA ()
                    }
                    Else
                    {
                        PTPB ()
                    }
                }
                If (LEqual (Arg0, 0x04)) {}
                OE_W (Arg0)
            }
            Method (RR_M, 1, Serialized)
            {
                If (LEqual (Acquire (MUEC, 0xFFFF), Zero))
                {
                    Store (Arg0, Local0)
                    And (Local0, 0xFF, Local1)
                    ShiftRight (Local0, 0x08, Local0)
                    And (Local0, 0xFF, Local0)
                    Store (Local1, CDT2)
                    Store (Local0, CDT1)
                    Store (0x80, CMD1)
                    Store (0x0F, ESEM)
                    Store (0x7F, Local0)
                    While (LAnd (Local0, CMD1))
                    {
                        Sleep (One)
                        Decrement (Local0)
                    }
                    If (LEqual (CMD1, Zero))
                    {
                        Store (EDA1, Local0)
                    }
                    Else
                    {
                        Store (Ones, Local0)
                    }
                    Release (MUEC)
                    Return (Local0)
                }
                Return (Ones)
            }
            Method (WR_M, 2, Serialized)
            {
                If (LEqual (Acquire (MUEC, 0xFFFF), Zero))
                {
                    Store (Arg0, Local0)
                    And (Local0, 0xFF, Local1)
                    ShiftRight (Local0, 0x08, Local0)
                    And (Local0, 0xFF, Local0)
                    Store (Local1, CDT2)
                    Store (Local0, CDT1)
                    Store (Arg1, CDT3)
                    Store (0x81, CMD1)
                    Store (0x0F, ESEM)
                    Store (0x7F, Local0)
                    While (LAnd (Local0, CMD1))
                    {
                        Sleep (One)
                        Decrement (Local0)
                    }
                    If (LEqual (CMD1, Zero))
                    {
                        Store (One, Local0)
                    }
                    Else
                    {
                        Store (Ones, Local0)
                    }
                    Release (MUEC)
                    Return (Local0)
                }
                Return (Ones)
            }
            Method (SB_R, 1, Serialized)
            {
                WB_O (Zero, Arg0)
            }
            Name (DECF, Zero)
            Method (SF_A, 2, Serialized)
            {
                Store (RR_M (0x0521), Local1)
                Store (RR_M (0x0522), Local2)
                Store (RR_M (0x0523), Local3)
                Store (RR_M (0x0524), Local4)
                If (LEqual (Arg0, Zero))
                {
                    Or (Local3, 0x80, Local3)
                    Or (Local4, 0x80, Local4)
                    If (And (Local1, 0x80))
                    {
                        ShiftRight (Local1, 0x04, Local0)
                        And (Local0, 0x03, Local0)
                        If (LEqual (Local0, Zero))
                        {
                            WR_M (0x0523, Local3)
                        }
                        Else
                        {
                            If (LEqual (Local0, One))
                            {
                                WR_M (0x0524, Local4)
                            }
                            Else
                            {
                                If (LEqual (Local0, 0x02))
                                {
                                    WR_M (0x0523, Local3)
                                    WR_M (0x0524, Local4)
                                }
                            }
                        }
                    }
                    If (And (Local2, 0x80))
                    {
                        ShiftRight (Local2, 0x04, Local0)
                        And (Local0, 0x03, Local0)
                        If (LEqual (Local0, Zero))
                        {
                            WR_M (0x0523, Local3)
                        }
                        Else
                        {
                            If (LEqual (Local0, One))
                            {
                                WR_M (0x0524, Local4)
                            }
                            Else
                            {
                                If (LEqual (Local0, 0x02))
                                {
                                    WR_M (0x0523, Local3)
                                    WR_M (0x0524, Local4)
                                }
                            }
                        }
                    }
                    Return (Zero)
                }
                And (Local3, 0x7F, Local3)
                And (Local4, 0x7F, Local4)
                WR_M (0x0523, Local3)
                WR_M (0x0524, Local4)
                WF_O (Decrement (Arg0), Arg1)
                Return (Zero)
            }
            Method (SP_N, 3, Serialized)
            {
                If (LEqual (Acquire (MUEC, 0xFFFF), Zero))
                {
                    Store (Arg0, Local0)
                    Store (Arg1, Local1)
                    If (LGreaterEqual (Local0, 0x41))
                    {
                        Subtract (Local0, 0x41, Local0)
                    }
                    ShiftLeft (Local0, 0x04, Local0)
                    Or (Local0, Local1, Local0)
                    Store (Local0, CDT2)
                    If (LEqual (Arg2, One))
                    {
                        Store (0x20, Local2)
                    }
                    Else
                    {
                        Store (0x40, Local2)
                    }
                    Store (Local2, CDT1)
                    Store (0x87, CMD1)
                    Store (0x0F, ESEM)
                    Store (0x7F, Local0)
                    While (LAnd (Local0, CMD1))
                    {
                        Sleep (One)
                        Decrement (Local0)
                    }
                    If (LEqual (CMD1, Zero))
                    {
                        Store (One, Local0)
                    }
                    Else
                    {
                        Store (Ones, Local0)
                    }
                    Release (MUEC)
                    Return (Local0)
                }
                Return (Ones)
            }
            Method (RP_N, 2, Serialized)
            {
                If (LEqual (Acquire (MUEC, 0xFFFF), Zero))
                {
                    Store (Arg0, Local0)
                    If (LGreaterEqual (Local0, 0x41))
                    {
                        Subtract (Local0, 0x41, Local0)
                    }
                    ShiftLeft (Local0, 0x04, Local0)
                    Or (Local0, Arg1, Local0)
                    Store (Local0, CDT2)
                    Store (Zero, CDT1)
                    Store (0x87, CMD1)
                    Store (0x0F, ESEM)
                    Store (0x7F, Local0)
                    While (LAnd (Local0, CMD1))
                    {
                        Sleep (One)
                        Decrement (Local0)
                    }
                    If (LEqual (CMD1, Zero))
                    {
                        Store (EDA1, Local0)
                    }
                    Else
                    {
                        Store (Ones, Local0)
                    }
                    Release (MUEC)
                    Return (Local0)
                }
                Return (Ones)
            }
            Name (WRQK, 0x02)
            Name (RDQK, 0x03)
            Name (SDBT, 0x04)
            Name (RCBT, 0x05)
            Name (WRBT, 0x06)
            Name (RDBT, 0x07)
            Name (WRWD, 0x08)
            Name (RDWD, 0x09)
            Name (WRBL, 0x0A)
            Name (RDBL, 0x0B)
            Name (WBLP, 0x8A)
            Name (RBLP, 0x8B)
            Name (PCLL, 0x0C)
            Name (GOOD, Zero)
            Name (UKER, 0x07)
            Name (DAER, 0x10)
            Name (DERR, 0x11)
            Name (CMDN, 0x12)
            Name (UKE2, 0x13)
            Name (DADN, 0x17)
            Name (SBTO, 0x18)
            Name (USPT, 0x19)
            Name (SBBY, 0x1A)
            Method (SR_T, 3, Serialized)
            {
                Store (Package (0x03)
                    {
                        0x07, 
                        Zero, 
                        Zero
                    }, Local0)
                OperationRegion (ECBD, SystemMemory, 0xFEFF0700, 0x80)
                Field (ECBD, ByteAcc, Lock, Preserve)
                {
                    Offset (0x40), 
                    Offset (0x41), 
                    BCNT,   8, 
                    BDAT,   240
                }
                If (LNotEqual (Arg0, RDBL))
                {
                    If (LNotEqual (Arg0, RDWD))
                    {
                        If (LNotEqual (Arg0, RDBT))
                        {
                            If (LNotEqual (Arg0, RCBT))
                            {
                                If (LNotEqual (Arg0, RDQK))
                                {
                                    If (LNotEqual (Arg0, RBLP))
                                    {
                                        Return (Local0)
                                    }
                                }
                            }
                        }
                    }
                }
                If (LEqual (Acquire (MUEC, 0xFFFF), Zero))
                {
                    Store (Zero, CDT1)
                    Store (Arg0, CDT2)
                    ShiftLeft (Arg1, One, Local1)
                    Store (Local1, CDT3)
                    Store (Arg2, CDT4)
                    Store (Zero, CDT5)
                    Store (0x9A, CMD1)
                    Store (0x0F, ESEM)
                    Store (0xFA, Local2)
                    While (LAnd (Local2, CMD1))
                    {
                        Sleep (0x02)
                        Decrement (Local2)
                    }
                    If (LEqual (CMD1, Zero))
                    {
                        If (LEqual (EDA1, 0x80))
                        {
                            Store (GOOD, Index (Local0, Zero))
                            If (LEqual (Arg0, RDBL))
                            {
                                Store (BCNT, Index (Local0, One))
                                Store (BDAT, Index (Local0, 0x02))
                            }
                            If (LEqual (Arg0, RBLP))
                            {
                                Store (BCNT, Index (Local0, One))
                                Store (BDAT, Index (Local0, 0x02))
                            }
                            If (LEqual (Arg0, RDWD))
                            {
                                Store (0x02, Index (Local0, One))
                                Store (EDA3, Local1)
                                ShiftLeft (Local1, 0x08, Local1)
                                Or (Local1, EDA2, Local1)
                                Store (Local1, Index (Local0, 0x02))
                            }
                            If (LEqual (Arg0, RDBT))
                            {
                                Store (One, Index (Local0, One))
                                Store (EDA2, Index (Local0, 0x02))
                            }
                            If (LEqual (Arg0, RCBT))
                            {
                                Store (One, Index (Local0, One))
                                Store (EDA2, Index (Local0, 0x02))
                            }
                        }
                    }
                    Else
                    {
                        Store (UKER, Index (Local0, Zero))
                        Store (Zero, Index (Local0, One))
                        Store (0xFF, Index (Local0, 0x02))
                    }
                    Release (MUEC)
                }
                Return (Local0)
            }
            Method (SW_T, 5, Serialized)
            {
                Store (Package (0x03)
                    {
                        0x07, 
                        Zero, 
                        Zero
                    }, Local0)
                OperationRegion (ECBD, SystemMemory, 0xFEFF0380, 0x80)
                Field (ECBD, ByteAcc, Lock, Preserve)
                {
                    Offset (0x07), 
                    BDAT,   256
                }
                If (LNotEqual (Arg0, WRBL))
                {
                    If (LNotEqual (Arg0, WRWD))
                    {
                        If (LNotEqual (Arg0, WRBT))
                        {
                            If (LNotEqual (Arg0, SDBT))
                            {
                                If (LNotEqual (Arg0, WRQK))
                                {
                                    If (LNotEqual (Arg0, WBLP))
                                    {
                                        Return (Local0)
                                    }
                                }
                            }
                        }
                    }
                }
                If (LEqual (Acquire (MUEC, 0xFFFF), Zero))
                {
                    Store (Zero, CDT1)
                    Store (Arg0, CDT2)
                    ShiftLeft (Arg1, One, Local1)
                    Store (Local1, CDT3)
                    Store (Arg2, CDT4)
                    If (LEqual (Arg0, WRBL))
                    {
                        Store (Arg3, CDT5)
                        Store (Arg4, BDAT)
                    }
                    If (LEqual (Arg0, WBLP))
                    {
                        Store (Arg3, CDT5)
                        Store (Arg4, BDAT)
                    }
                    If (LEqual (Arg0, WRWD))
                    {
                        Store (Zero, CDT5)
                        Store (Arg4, CDT6)
                        And (Arg4, 0xFF, Local3)
                        Store (Local3, CDT6)
                        And (Arg4, 0xFF00, Local4)
                        ShiftRight (Local4, 0x08, Local4)
                        Store (Local4, CDT7)
                    }
                    If (LEqual (Arg0, WRBT))
                    {
                        Store (Zero, CDT5)
                        Store (Arg4, CDT6)
                    }
                    If (LEqual (Arg0, SDBT))
                    {
                        Store (Zero, CDT5)
                        Store (Arg4, CDT6)
                    }
                    Store (0x9A, CMD1)
                    Store (0x0F, ESEM)
                    Store (0x7F, Local2)
                    While (LAnd (Local2, CMD1))
                    {
                        Sleep (One)
                        Decrement (Local2)
                    }
                    If (LEqual (CMD1, Zero))
                    {
                        Store (Zero, Index (Local0, Zero))
                    }
                    Else
                    {
                        Store (UKER, Index (Local0, Zero))
                    }
                    Release (MUEC)
                }
                Return (Local0)
            }
            Method (RE_P, 1, NotSerialized)
            {
                Return (Zero)
            }
            Method (WE_P, 2, NotSerialized)
            {
                Return (Zero)
            }
            Method (WB_R, 2, Serialized)
            {
                If (LEqual (Acquire (MUEC, 0xFFFF), Zero))
                {
                    Store (Arg0, CDT1)
                    Store (Arg1, CDT2)
                    Store (0x86, CMD1)
                    Store (0x0F, ESEM)
                    Store (0x7F, Local0)
                    While (LAnd (Local0, CMD1))
                    {
                        Sleep (One)
                        Decrement (Local0)
                    }
                    If (LEqual (CMD1, Zero))
                    {
                        Store (One, Local0)
                    }
                    Else
                    {
                        Store (Ones, Local0)
                    }
                    Release (MUEC)
                    Return (Local0)
                }
                Return (Ones)
            }
            Method (EX_T, 6, NotSerialized)
            {
                Store (Package (0x06)
                    {
                        0x10, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }, Local1)
                If (LEqual (Acquire (MUEC, 0xFFFF), Zero))
                {
                    Store (Arg1, CDT1)
                    Store (Arg2, CDT2)
                    Store (Arg3, CDT3)
                    Store (Arg4, CDT4)
                    Store (Arg5, CDT5)
                    Store (Arg0, CMD1)
                    Store (0x0F, ESEM)
                    Store (0x7F, Local0)
                    While (LAnd (Local0, CMD1))
                    {
                        Sleep (One)
                        Decrement (Local0)
                    }
                    If (LEqual (CMD1, Zero))
                    {
                        Store (Zero, Index (Local1, Zero))
                        Store (EDA1, Index (Local1, One))
                        Store (EDA2, Index (Local1, 0x02))
                        Store (EDA3, Index (Local1, 0x03))
                        Store (EDA4, Index (Local1, 0x04))
                        Store (EDA5, Index (Local1, 0x05))
                    }
                    Else
                    {
                        Store (0x10, Index (Local1, Zero))
                    }
                    Release (MUEC)
                }
                Return (Local1)
            }
            Method (EX_1, 1, Serialized)
            {
                Store (Package (0x0D)
                    {
                        0x10, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }, Local1)
                If (LEqual (Acquire (MUEC, 0xFFFF), Zero))
                {
                    Store (DerefOf (Index (Arg0, One)), CDT1)
                    Store (DerefOf (Index (Arg0, 0x02)), CDT2)
                    Store (DerefOf (Index (Arg0, 0x03)), CDT3)
                    Store (DerefOf (Index (Arg0, 0x04)), CDT4)
                    Store (DerefOf (Index (Arg0, 0x05)), CDT5)
                    Store (DerefOf (Index (Arg0, 0x06)), CDT6)
                    Store (DerefOf (Index (Arg0, 0x07)), CDT7)
                    Store (DerefOf (Index (Arg0, 0x08)), CDT8)
                    Store (DerefOf (Index (Arg0, 0x09)), CDT9)
                    Store (DerefOf (Index (Arg0, 0x0A)), CD10)
                    Store (DerefOf (Index (Arg0, 0x0B)), CD11)
                    Store (DerefOf (Index (Arg0, 0x0C)), CD12)
                    Store (DerefOf (Index (Arg0, Zero)), CMD1)
                    Store (0x0F, ESEM)
                    Store (0x7F, Local0)
                    While (LAnd (Local0, CMD1))
                    {
                        Sleep (One)
                        Decrement (Local0)
                    }
                    If (LEqual (CMD1, Zero))
                    {
                        Store (Zero, Index (Local1, Zero))
                        Store (EDA1, Index (Local1, One))
                        Store (EDA2, Index (Local1, 0x02))
                        Store (EDA3, Index (Local1, 0x03))
                        Store (EDA4, Index (Local1, 0x04))
                        Store (EDA5, Index (Local1, 0x05))
                        Store (EDA6, Index (Local1, 0x06))
                        Store (EDA7, Index (Local1, 0x07))
                        Store (EDA8, Index (Local1, 0x08))
                        Store (EDA9, Index (Local1, 0x09))
                        Store (ED10, Index (Local1, 0x0A))
                        Store (ED11, Index (Local1, 0x0B))
                        Store (ED12, Index (Local1, 0x0C))
                    }
                    Else
                    {
                        Store (0x10, Index (Local1, Zero))
                    }
                    Release (MUEC)
                }
                Return (Local1)
            }
            Method (ES_M, 6, NotSerialized)
            {
                Store (Package (0x05)
                    {
                        0x11, 
                        Zero, 
                        Zero, 
                        Zero, 
                        Zero
                    }, Local1)
                If (LGreater (Arg0, One))
                {
                    Return (Local1)
                }
                If (LEqual (Acquire (MUEC, 0xFFFF), Zero))
                {
                    Store (Arg0, CDT1)
                    Store (Arg1, CDT2)
                    Store (Arg2, CDT3)
                    Store (Arg3, CDT4)
                    Store (Zero, CDT5)
                    Store (Arg4, CDT6)
                    Store (Arg5, CDT7)
                    Store (0x9A, CMD1)
                    Store (0x0F, ESEM)
                    Store (0x7F, Local2)
                    While (LAnd (Local2, CMD1))
                    {
                        Sleep (One)
                        Decrement (Local2)
                    }
                    If (LEqual (CMD1, Zero))
                    {
                        Store (Zero, Index (Local1, Zero))
                        Store (EDA1, Index (Local1, One))
                        Store (EDA2, Index (Local1, 0x02))
                        Store (EDA3, Index (Local1, 0x03))
                        Store (EDA4, Index (Local1, 0x04))
                    }
                    Else
                    {
                        Store (0x10, Index (Local1, Zero))
                    }
                    Release (MUEC)
                }
                Return (Local1)
            }
            Method (WE_I, 0, Serialized)
            {
                Store (0x4000, Local0)
                And (AEIC, 0x02, Local1)
                While (LAnd (LNotEqual (Local0, Zero), LEqual (Local1, 0x02)))
                {
                    And (AEIC, 0x02, Local1)
                    Decrement (Local0)
                }
            }
            Method (WE_O, 0, Serialized)
            {
                Store (0x4000, Local0)
                And (AEIC, One, Local1)
                While (LAnd (LNotEqual (Local0, Zero), LEqual (Local1, Zero)))
                {
                    And (AEIC, One, Local1)
                    Decrement (Local0)
                }
            }
            Method (RF_O, 1, Serialized)
            {
                If (LEqual (Acquire (MUEC, 0xFFFF), Zero))
                {
                    Store (Arg0, CDT1)
                    Store (0x83, CMD1)
                    Store (0x0F, ESEM)
                    Store (0x7F, Local0)
                    While (LAnd (Local0, CMD1))
                    {
                        Sleep (One)
                        Decrement (Local0)
                    }
                    If (LEqual (CMD1, Zero))
                    {
                        Store (EDA1, Local0)
                    }
                    Else
                    {
                        Store (Ones, Local0)
                    }
                    Release (MUEC)
                    Return (Local0)
                }
                Return (Ones)
            }
            Method (WF_O, 2, Serialized)
            {
                If (LEqual (Acquire (MUEC, 0xFFFF), Zero))
                {
                    Store (Arg0, CDT1)
                    Store (Arg1, CDT2)
                    Store (0x84, CMD1)
                    Store (0x0F, ESEM)
                    Store (0x7F, Local0)
                    While (LAnd (Local0, CMD1))
                    {
                        Sleep (One)
                        Decrement (Local0)
                    }
                    If (LEqual (CMD1, Zero))
                    {
                        Store (One, Local0)
                    }
                    Else
                    {
                        Store (Ones, Local0)
                    }
                    Release (MUEC)
                    Return (Local0)
                }
                Return (Ones)
            }
            Method (RB_O, 1, Serialized)
            {
                If (LEqual (Acquire (MUEC, 0xFFFF), Zero))
                {
                    Store (Arg0, CDT1)
                    Store (0x85, CMD1)
                    Store (0x0F, ESEM)
                    Store (0x7F, Local0)
                    While (LAnd (Local0, CMD1))
                    {
                        Sleep (One)
                        Decrement (Local0)
                    }
                    If (LEqual (CMD1, Zero))
                    {
                        Store (EDA1, Local0)
                    }
                    Else
                    {
                        Store (Ones, Local0)
                    }
                    Release (MUEC)
                    Return (Local0)
                }
                Return (Ones)
            }
            Method (WB_O, 2, Serialized)
            {
                If (LEqual (Acquire (MUEC, 0xFFFF), Zero))
                {
                    Store (Arg0, CDT1)
                    Store (Arg1, CDT2)
                    Store (0x86, CMD1)
                    Store (0x0F, ESEM)
                    Store (0x7F, Local0)
                    While (LAnd (Local0, CMD1))
                    {
                        Sleep (One)
                        Decrement (Local0)
                    }
                    If (LEqual (CMD1, Zero))
                    {
                        Store (One, Local0)
                    }
                    Else
                    {
                        Store (Ones, Local0)
                    }
                    Release (MUEC)
                    Return (Local0)
                }
                Return (Ones)
            }
            Method (PK_E, 1, NotSerialized)
            {
                If (LEqual (Acquire (MUEC, 0xFFFF), Zero))
                {
                    Store (Arg0, CDT1)
                    Store (0xB1, CMD1)
                    Store (0x0F, ESEM)
                    Store (0x7F, Local0)
                    While (LAnd (Local0, CMD1))
                    {
                        Sleep (One)
                        Decrement (Local0)
                    }
                    If (LEqual (CMD1, Zero))
                    {
                        Store (One, Local0)
                    }
                    Else
                    {
                        Store (Ones, Local0)
                    }
                    Release (MUEC)
                    Return (Local0)
                }
                Return (Ones)
            }
            Method (PK_L, 1, NotSerialized)
            {
                If (LEqual (Acquire (MUEC, 0xFFFF), Zero))
                {
                    Store (Arg0, CDT1)
                    Store (0xB0, CMD1)
                    Store (0x0F, ESEM)
                    Store (0x7F, Local0)
                    While (LAnd (Local0, CMD1))
                    {
                        Sleep (One)
                        Decrement (Local0)
                    }
                    If (LEqual (CMD1, Zero))
                    {
                        Store (One, Local0)
                    }
                    Else
                    {
                        Store (Ones, Local0)
                    }
                    Release (MUEC)
                    Return (Local0)
                }
                Return (Ones)
            }
            Method (PT_P, 1, NotSerialized)
            {
                If (LEqual (Acquire (MUEC, 0xFFFF), Zero))
                {
                    CreateField (Arg0, Zero, 0x01F0, CDB0)
                    Store (CDB0, CDTB)
                    Store (0x97, CMDB)
                    Store (0x0F, ESEB)
                    Store (0x7F, Local0)
                    While (LAnd (Local0, CMD1))
                    {
                        Sleep (One)
                        Decrement (Local0)
                    }
                    If (LEqual (CMD1, Zero))
                    {
                        Store (One, Local0)
                    }
                    Else
                    {
                        Store (Ones, Local0)
                    }
                    Release (MUEC)
                    Return (Local0)
                }
                Return (Ones)
            }
            Method (AC_P, 0, Serialized)
            {
                Return (And (GP_S (), One))
            }
            Method (DC_P, 1, Serialized)
            {
                Store (GP_S (), Local0)
                If (Arg0)
                {
                    And (Local0, 0x04, Local0)
                }
                Else
                {
                    And (Local0, 0x02, Local0)
                }
                If (Local0)
                {
                    Store (One, Local0)
                }
                Else
                {
                    Store (Zero, Local0)
                }
                Return (Local0)
            }
            Method (GP_S, 0, Serialized)
            {
                Store (EPWS, Local0)
                Return (Local0)
            }
            Method (BC_E, 1, Serialized)
            {
                If (Arg0)
                {
                    If (ECAV ())
                    {
                        Store (EB1S, Local1)
                        And (Local1, 0xFFFF, Local1)
                        If (LNotEqual (Local1, 0xFFFF))
                        {
                            And (Local1, 0x16, Local1)
                            If (LEqual (Local1, 0x04))
                            {
                                Store (Zero, Local0)
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x02))
                                {
                                    Store (One, Local0)
                                }
                                Else
                                {
                                    If (LEqual (Local1, 0x10))
                                    {
                                        Store (One, Local0)
                                    }
                                }
                            }
                        }
                        Store (Ones, Local0)
                    }
                    Else
                    {
                        Store (Ones, Local0)
                    }
                    Return (Local0)
                }
                Else
                {
                    If (ECAV ())
                    {
                        Store (EB0S, Local1)
                        And (Local1, 0xFFFF, Local1)
                        If (LNotEqual (Local1, 0xFFFF))
                        {
                            And (Local1, 0x16, Local1)
                            If (LEqual (Local1, 0x04))
                            {
                                Store (Zero, Local0)
                            }
                            Else
                            {
                                If (LEqual (Local1, 0x02))
                                {
                                    Store (One, Local0)
                                }
                                Else
                                {
                                    If (LEqual (Local1, 0x10))
                                    {
                                        Store (One, Local0)
                                    }
                                }
                            }
                        }
                        Store (Ones, Local0)
                    }
                    Else
                    {
                        Store (Ones, Local0)
                    }
                    Return (Local0)
                }
            }
            Method (PTPA, 0, Serialized)
            {
                Name (DAT1, Zero)
                Name (DAT2, Zero)
                Name (DAT3, Zero)
                Store (Zero, Local0)
                WR_M (0x0530, 0x63)
                WR_M (0x0531, 0x62)
                WR_M (0x0532, 0x60)
                WR_M (0x0533, 0x62)
                WR_M (0x0534, 0x58)
                WR_M (0x0535, 0x3A)
                WR_M (0x0537, 0x32)
                WR_M (0x0538, 0x3C)
                WR_M (0x0539, 0x41)
                WR_M (0x053A, 0x43)
                WR_M (0x053B, 0x46)
                WR_M (0x053C, 0x4B)
                WR_M (0x053D, 0x4B)
                WR_M (0x053E, 0x4B)
                WR_M (0x0540, 0x0A)
                WR_M (0x0541, 0x0F)
                WR_M (0x0542, 0x0F)
                WR_M (0x0543, 0x0F)
                WR_M (0x0544, 0x0F)
                WR_M (0x0545, 0x0F)
                WR_M (0x0546, 0x0F)
                WR_M (0x0547, 0x0F)
                WR_M (0x0548, 0x3A)
                WR_M (0x0549, 0x4B)
                WR_M (0x054A, 0x57)
                WR_M (0x054B, 0x61)
                WR_M (0x054C, 0x6F)
                WR_M (0x054D, 0x84)
                WR_M (0x054E, 0x84)
                WR_M (0x054F, 0x84)
                WR_M (0x0550, One)
                WR_M (0x0551, 0x02)
                WR_M (0x0552, 0x04)
                WR_M (0x0553, 0x06)
                WR_M (0x0554, One)
                WR_M (0x0555, 0x02)
                WR_M (0x0556, 0x04)
                WR_M (0x0557, 0x06)
                WR_M (0x0558, One)
                WR_M (0x0559, 0x02)
                WR_M (0x055A, 0x04)
                WR_M (0x055B, 0x06)
                WR_M (0x055C, One)
                WR_M (0x055D, 0x02)
                WR_M (0x055E, 0x04)
                WR_M (0x055F, 0x06)
                WR_M (0x05C0, 0x6E)
                WR_M (0x05C1, 0x04)
                WR_M (0x05C2, 0xA9)
                WR_M (0x05C3, 0x03)
                WR_M (0x05C4, 0x3D)
                WR_M (0x05C5, 0x03)
                WR_M (0x05C6, 0x02)
                WR_M (0x05C7, 0x03)
                WR_M (0x05C8, 0xB7)
                WR_M (0x05C9, 0x02)
                WR_M (0x05CA, 0x68)
                WR_M (0x05CB, 0x02)
                WR_M (0x05CC, Zero)
                WR_M (0x05CD, Zero)
                WR_M (0x05CE, Zero)
                WR_M (0x05CF, Zero)
                WR_M (0x03E4, 0x62)
                WR_M (0x03E5, 0x61)
                Store (RR_M (0x0520), DAT1)
                And (DAT1, 0xCC, DAT2)
                Or (DAT2, One, DAT3)
                And (DAT3, 0x7F, Local0)
                WR_M (0x0521, 0x8C)
                WR_M (0x0522, Zero)
                WR_M (0x0523, 0x9D)
                WR_M (0x0524, Zero)
                WR_M (0x0520, 0x81)
                WR_M (0x052A, 0x98)
                WR_M (0x052C, One)
                WR_M (0x052D, One)
            }
            Method (PTPB, 0, Serialized)
            {
                Name (DAT1, Zero)
                Name (DAT2, Zero)
                Name (DAT3, Zero)
                Store (Zero, Local0)
                WR_M (0x0530, 0x63)
                WR_M (0x0531, 0x62)
                WR_M (0x0532, 0x60)
                WR_M (0x0533, 0x62)
                WR_M (0x0534, 0x58)
                WR_M (0x0535, 0x3A)
                WR_M (0x0536, 0x64)
                WR_M (0x0537, 0x32)
                WR_M (0x0538, 0x3C)
                WR_M (0x0539, 0x3E)
                WR_M (0x053A, 0x40)
                WR_M (0x053B, 0x42)
                WR_M (0x053C, 0x48)
                WR_M (0x053D, 0x48)
                WR_M (0x053E, 0x48)
                WR_M (0x0540, 0x0A)
                WR_M (0x0541, 0x0A)
                WR_M (0x0542, 0x0A)
                WR_M (0x0543, 0x0A)
                WR_M (0x0544, 0x0A)
                WR_M (0x0545, 0x0E)
                WR_M (0x0546, 0x0E)
                WR_M (0x0547, 0x0E)
                WR_M (0x0548, 0x3A)
                WR_M (0x0549, 0x4B)
                WR_M (0x054A, 0x57)
                WR_M (0x054B, 0x61)
                WR_M (0x054C, 0x6F)
                WR_M (0x054D, 0x84)
                WR_M (0x054E, 0x84)
                WR_M (0x054F, 0x84)
                WR_M (0x0550, One)
                WR_M (0x0551, 0x02)
                WR_M (0x0552, 0x04)
                WR_M (0x0553, 0x06)
                WR_M (0x0554, One)
                WR_M (0x0555, 0x02)
                WR_M (0x0556, 0x04)
                WR_M (0x0557, 0x06)
                WR_M (0x0558, One)
                WR_M (0x0559, 0x02)
                WR_M (0x055A, 0x04)
                WR_M (0x055B, 0x06)
                WR_M (0x055C, One)
                WR_M (0x055D, 0x02)
                WR_M (0x055E, 0x04)
                WR_M (0x055F, 0x06)
                WR_M (0x05C0, 0x6E)
                WR_M (0x05C1, 0x04)
                WR_M (0x05C2, 0xA9)
                WR_M (0x05C3, 0x03)
                WR_M (0x05C4, 0x3D)
                WR_M (0x05C5, 0x03)
                WR_M (0x05C6, 0x02)
                WR_M (0x05C7, 0x03)
                WR_M (0x05C8, 0xB7)
                WR_M (0x05C9, 0x02)
                WR_M (0x05CA, 0x68)
                WR_M (0x05CB, 0x02)
                WR_M (0x05CC, Zero)
                WR_M (0x05CD, Zero)
                WR_M (0x05CE, Zero)
                WR_M (0x05CF, Zero)
                WR_M (0x03E4, 0x62)
                WR_M (0x03E5, 0x61)
                Store (RR_M (0x0520), DAT1)
                And (DAT1, 0xFC, DAT2)
                Or (DAT2, 0x32, DAT3)
                And (DAT3, 0x7F, Local0)
                WR_M (0x0521, 0xAC)
                WR_M (0x0522, 0x2C)
                WR_M (0x0523, 0x9D)
                WR_M (0x0524, 0x9D)
                WR_M (0x0520, 0xB2)
                WR_M (0x052A, 0x98)
                WR_M (0x052C, One)
                WR_M (0x052D, One)
            }
        }
    }
    Scope (_SB.PCI0.LPC0.EC0)
    {
    }
    Name (ATKP, Zero)
    Scope (\)
    {
        Device (WMI0)
        {
            Name (_HID, "PNP0C14")
            Name (_UID, Zero)
            Name (WAPF, Zero)
            Name (_WDG, Buffer (0x01B8)
            {
                /* 0000 */   0x00, 0x24, 0x14, 0x39, 0xA3, 0xC6, 0xFA, 0x40,
                /* 0008 */   0xBA, 0xDB, 0x8A, 0x26, 0x52, 0x83, 0x41, 0x00,
                /* 0010 */   0x30, 0x30, 0x01, 0x01, 0x00, 0x24, 0x14, 0x49,
                /* 0018 */   0xA3, 0xC6, 0xFA, 0x40, 0xBA, 0xDB, 0x8A, 0x26,
                /* 0020 */   0x52, 0x83, 0x41, 0x00, 0x30, 0x31, 0x01, 0x01,
                /* 0028 */   0x00, 0x24, 0x14, 0x4A, 0xA3, 0xC6, 0xFA, 0x40,
                /* 0030 */   0xBA, 0xDB, 0x8A, 0x26, 0x52, 0x83, 0x41, 0x00,
                /* 0038 */   0x30, 0x32, 0x01, 0x01, 0x01, 0x24, 0x14, 0x49,
                /* 0040 */   0xA3, 0xC6, 0xFA, 0x40, 0xBA, 0xDB, 0x8A, 0x26,
                /* 0048 */   0x52, 0x83, 0x41, 0x00, 0x31, 0x31, 0x01, 0x01,
                /* 0050 */   0x01, 0x24, 0x14, 0x4A, 0xA3, 0xC6, 0xFA, 0x40,
                /* 0058 */   0xBA, 0xDB, 0x8A, 0x26, 0x52, 0x83, 0x41, 0x00,
                /* 0060 */   0x31, 0x32, 0x01, 0x01, 0x02, 0x24, 0x14, 0x49,
                /* 0068 */   0xA3, 0xC6, 0xFA, 0x40, 0xBA, 0xDB, 0x8A, 0x26,
                /* 0070 */   0x52, 0x83, 0x41, 0x00, 0x32, 0x31, 0x01, 0x01,
                /* 0078 */   0x02, 0x24, 0x14, 0x4A, 0xA3, 0xC6, 0xFA, 0x40,
                /* 0080 */   0xBA, 0xDB, 0x8A, 0x26, 0x52, 0x83, 0x41, 0x00,
                /* 0088 */   0x32, 0x32, 0x01, 0x01, 0x03, 0x24, 0x14, 0x49,
                /* 0090 */   0xA3, 0xC6, 0xFA, 0x40, 0xBA, 0xDB, 0x8A, 0x26,
                /* 0098 */   0x52, 0x83, 0x41, 0x00, 0x33, 0x31, 0x01, 0x01,
                /* 00A0 */   0x03, 0x24, 0x14, 0x4A, 0xA3, 0xC6, 0xFA, 0x40,
                /* 00A8 */   0xBA, 0xDB, 0x8A, 0x26, 0x52, 0x83, 0x41, 0x00,
                /* 00B0 */   0x33, 0x32, 0x01, 0x01, 0x04, 0x24, 0x14, 0x49,
                /* 00B8 */   0xA3, 0xC6, 0xFA, 0x40, 0xBA, 0xDB, 0x8A, 0x26,
                /* 00C0 */   0x52, 0x83, 0x41, 0x00, 0x34, 0x31, 0x01, 0x01,
                /* 00C8 */   0x04, 0x24, 0x14, 0x4A, 0xA3, 0xC6, 0xFA, 0x40,
                /* 00D0 */   0xBA, 0xDB, 0x8A, 0x26, 0x52, 0x83, 0x41, 0x00,
                /* 00D8 */   0x34, 0x32, 0x01, 0x01, 0x05, 0x24, 0x14, 0x49,
                /* 00E0 */   0xA3, 0xC6, 0xFA, 0x40, 0xBA, 0xDB, 0x8A, 0x26,
                /* 00E8 */   0x52, 0x83, 0x41, 0x00, 0x35, 0x31, 0x01, 0x01,
                /* 00F0 */   0x05, 0x24, 0x14, 0x4A, 0xA3, 0xC6, 0xFA, 0x40,
                /* 00F8 */   0xBA, 0xDB, 0x8A, 0x26, 0x52, 0x83, 0x41, 0x00,
                /* 0100 */   0x35, 0x32, 0x01, 0x01, 0x06, 0x24, 0x14, 0x49,
                /* 0108 */   0xA3, 0xC6, 0xFA, 0x40, 0xBA, 0xDB, 0x8A, 0x26,
                /* 0110 */   0x52, 0x83, 0x41, 0x00, 0x36, 0x31, 0x01, 0x01,
                /* 0118 */   0x06, 0x24, 0x14, 0x4A, 0xA3, 0xC6, 0xFA, 0x40,
                /* 0120 */   0xBA, 0xDB, 0x8A, 0x26, 0x52, 0x83, 0x41, 0x00,
                /* 0128 */   0x36, 0x32, 0x01, 0x01, 0x07, 0x24, 0x14, 0x49,
                /* 0130 */   0xA3, 0xC6, 0xFA, 0x40, 0xBA, 0xDB, 0x8A, 0x26,
                /* 0138 */   0x52, 0x83, 0x41, 0x00, 0x37, 0x31, 0x01, 0x01,
                /* 0140 */   0x07, 0x24, 0x14, 0x4A, 0xA3, 0xC6, 0xFA, 0x40,
                /* 0148 */   0xBA, 0xDB, 0x8A, 0x26, 0x52, 0x83, 0x41, 0x00,
                /* 0150 */   0x37, 0x32, 0x01, 0x01, 0x00, 0x24, 0x14, 0x59,
                /* 0158 */   0xA3, 0xC6, 0xFA, 0x40, 0xBA, 0xDB, 0x8A, 0x26,
                /* 0160 */   0x52, 0x83, 0x41, 0x00, 0x80, 0x00, 0x01, 0x08,
                /* 0168 */   0x00, 0x24, 0x14, 0x69, 0xA3, 0xC6, 0xFA, 0x40,
                /* 0170 */   0xBA, 0xDB, 0x8A, 0x26, 0x52, 0x83, 0x41, 0x00,
                /* 0178 */   0x30, 0x35, 0x01, 0x02, 0x00, 0x24, 0x14, 0x79,
                /* 0180 */   0xA3, 0xC6, 0xFA, 0x40, 0xBA, 0xDB, 0x8A, 0x26,
                /* 0188 */   0x52, 0x83, 0x41, 0x00, 0x30, 0x36, 0x01, 0x02,
                /* 0190 */   0x00, 0x24, 0x14, 0x89, 0xA3, 0xC6, 0xFA, 0x40,
                /* 0198 */   0xBA, 0xDB, 0x8A, 0x26, 0x52, 0x83, 0x41, 0x00,
                /* 01A0 */   0x30, 0x37, 0x01, 0x02, 0x21, 0x12, 0x90, 0x05,
                /* 01A8 */   0x66, 0xD5, 0xD1, 0x11, 0xB2, 0xF0, 0x00, 0xA0,
                /* 01B0 */   0xC9, 0x06, 0x29, 0x10, 0x42, 0x41, 0x01, 0x01
            })
            Name (XVCD, Zero)
            Method (WQ00, 1, NotSerialized)
            {
                Return (XVCD)
            }
            OperationRegion (\WMIA, SystemMemory, PM_B, 0x9000)
            Field (WMIA, AnyAcc, NoLock, Preserve)
            {
                WAG1,   2048, 
                WAG2,   2048, 
                WAG3,   2048, 
                WAG4,   2048, 
                WAG5,   2048, 
                WAG6,   2048, 
                WAG7,   2048, 
                WAG8,   2048, 
                Offset (0x1000), 
                WPD1,   32768, 
                WPD2,   32768, 
                WPD3,   32768, 
                WPD4,   32768, 
                WPD5,   32768, 
                WPD6,   32768, 
                WPD7,   32768, 
                WPD8,   32768
            }
            Method (WQ01, 1, NotSerialized)
            {
                Return (WAG1)
            }
            Method (WS01, 2, NotSerialized)
            {
                Store (Arg1, WAG1)
                Return (Zero)
            }
            Method (WQ02, 1, NotSerialized)
            {
                Return (WPD1)
            }
            Method (WS02, 2, NotSerialized)
            {
                Store (Arg1, WPD1)
                Return (Zero)
            }
            Method (WQ11, 1, NotSerialized)
            {
                Return (WAG2)
            }
            Method (WS11, 2, NotSerialized)
            {
                Store (Arg1, WAG2)
                Return (Zero)
            }
            Method (WQ12, 1, NotSerialized)
            {
                Return (WPD2)
            }
            Method (WS12, 2, NotSerialized)
            {
                Store (Arg1, WPD2)
                Return (Zero)
            }
            Method (WQ21, 1, NotSerialized)
            {
                Return (WAG3)
            }
            Method (WS21, 2, NotSerialized)
            {
                Store (Arg1, WAG3)
                Return (Zero)
            }
            Method (WQ22, 1, NotSerialized)
            {
                Return (WPD3)
            }
            Method (WS22, 2, NotSerialized)
            {
                Store (Arg1, WPD3)
                Return (Zero)
            }
            Method (WQ31, 1, NotSerialized)
            {
                Return (WAG4)
            }
            Method (WS31, 2, NotSerialized)
            {
                Store (Arg1, WAG4)
                Return (Zero)
            }
            Method (WQ32, 1, NotSerialized)
            {
                Return (WPD4)
            }
            Method (WS32, 2, NotSerialized)
            {
                Store (Arg1, WPD4)
                Return (Zero)
            }
            Method (WQ41, 1, NotSerialized)
            {
                Return (WAG5)
            }
            Method (WS41, 2, NotSerialized)
            {
                Store (Arg1, WAG5)
                Return (Zero)
            }
            Method (WQ42, 1, NotSerialized)
            {
                Return (WPD5)
            }
            Method (WS42, 2, NotSerialized)
            {
                Store (Arg1, WPD5)
                Return (Zero)
            }
            Method (WQ51, 1, NotSerialized)
            {
                Return (WAG6)
            }
            Method (WS51, 2, NotSerialized)
            {
                Store (Arg1, WAG6)
                Return (Zero)
            }
            Method (WQ52, 1, NotSerialized)
            {
                Return (WPD6)
            }
            Method (WS52, 2, NotSerialized)
            {
                Store (Arg1, WPD6)
                Return (Zero)
            }
            Method (WQ61, 1, NotSerialized)
            {
                Return (WAG7)
            }
            Method (WS61, 2, NotSerialized)
            {
                Store (Arg1, WAG7)
                Return (Zero)
            }
            Method (WQ62, 1, NotSerialized)
            {
                Return (WPD7)
            }
            Method (WS62, 2, NotSerialized)
            {
                Store (Arg1, WPD7)
                Return (Zero)
            }
            Method (WQ71, 1, NotSerialized)
            {
                Return (WAG8)
            }
            Method (WS71, 2, NotSerialized)
            {
                Store (Arg1, WAG8)
                Return (Zero)
            }
            Method (WQ72, 1, NotSerialized)
            {
                Return (WPD8)
            }
            Method (WS72, 2, NotSerialized)
            {
                Store (Arg1, WPD8)
                Return (Zero)
            }
            Method (WM05, 3, NotSerialized)
            {
                CreateDWordField (Arg2, Zero, WMA5)
                If (LEqual (WMA5, One))
                {
                    WG_F (PM_B, Add (PM_B, 0x1000), One)
                    Return (Zero)
                }
                If (LEqual (WMA5, 0x02))
                {
                    WG_F (Add (PM_B, 0x0100), Add (PM_B, 0x2000), 0x02)
                    Return (Zero)
                }
                If (LEqual (WMA5, 0x03))
                {
                    WG_F (Add (PM_B, 0x0200), Add (PM_B, 0x3000), 0x03)
                    Return (Zero)
                }
                If (LEqual (WMA5, 0x04))
                {
                    WG_F (Add (PM_B, 0x0300), Add (PM_B, 0x4000), 0x04)
                    Return (Zero)
                }
                If (LEqual (WMA5, 0x05))
                {
                    WG_F (Add (PM_B, 0x0400), Add (PM_B, 0x5000), 0x05)
                    Return (Zero)
                }
                If (LEqual (WMA5, 0x06))
                {
                    WG_F (Add (PM_B, 0x0500), Add (PM_B, 0x6000), 0x06)
                    Return (Zero)
                }
                If (LEqual (WMA5, 0x07))
                {
                    WG_F (Add (PM_B, 0x0600), Add (PM_B, 0x7000), 0x07)
                    Return (Zero)
                }
                If (LEqual (WMA5, 0x08))
                {
                    WG_F (Add (PM_B, 0x0700), Add (PM_B, 0x8000), 0x08)
                    Return (Zero)
                }
                Return (Zero)
            }
            Method (WM06, 3, Serialized)
            {
                CreateDWordField (Arg2, Zero, WM6A)
                Store (IN_T (WM6A), Local0)
                Return (Local0)
            }
            Method (WM07, 3, Serialized)
            {
                CreateDWordField (Arg2, Zero, WM7A)
                Store (WD_G (WM7A), Local0)
                Return (Local0)
            }
            Method (NTFY, 1, Serialized)
            {
                Store (Arg0, XVCD)
                Notify (WMI0, 0x80)
            }
            Method (WSMI, 1, Serialized)
            {
                Store (Arg0, PM_S)
                ISMI (0xDF)
                Stall (0xFF)
            }
            Name (WQBA, Buffer (0x0914)
            {
                /* 0000 */   0x46, 0x4F, 0x4D, 0x42, 0x01, 0x00, 0x00, 0x00,
                /* 0008 */   0x04, 0x09, 0x00, 0x00, 0x50, 0x67, 0x00, 0x00,
                /* 0010 */   0x44, 0x53, 0x00, 0x01, 0x1A, 0x7D, 0xDA, 0x54,
                /* 0018 */   0x28, 0xC7, 0xB2, 0x00, 0x01, 0x06, 0x18, 0x42,
                /* 0020 */   0x10, 0x2B, 0x10, 0x92, 0x2B, 0x81, 0x42, 0x04,
                /* 0028 */   0x0A, 0x44, 0x24, 0x81, 0x30, 0x28, 0x0D, 0x20,
                /* 0030 */   0x92, 0x03, 0x21, 0x17, 0x4C, 0x4C, 0x80, 0x08,
                /* 0038 */   0x08, 0x79, 0x15, 0x60, 0x53, 0x80, 0x49, 0x10,
                /* 0040 */   0xF5, 0xEF, 0x0F, 0x51, 0x12, 0x1C, 0x4A, 0x08,
                /* 0048 */   0x84, 0x24, 0x0A, 0x30, 0x2F, 0x40, 0xB7, 0x00,
                /* 0050 */   0xC3, 0x02, 0x6C, 0x0B, 0x30, 0x2D, 0xC0, 0x31,
                /* 0058 */   0x24, 0x95, 0x06, 0x4E, 0x09, 0x2C, 0x05, 0x42,
                /* 0060 */   0x42, 0x05, 0x28, 0x17, 0xE0, 0x5B, 0x80, 0x76,
                /* 0068 */   0x44, 0x49, 0x16, 0xB0, 0xA3, 0x30, 0x09, 0x3C,
                /* 0070 */   0x8A, 0xC8, 0x46, 0xE3, 0xD0, 0xD8, 0x61, 0x58,
                /* 0078 */   0x26, 0x98, 0x06, 0x71, 0x18, 0x65, 0x23, 0x8B,
                /* 0080 */   0xC0, 0x13, 0xEA, 0x74, 0x74, 0x05, 0x08, 0x13,
                /* 0088 */   0x20, 0x1E, 0x55, 0x18, 0xCD, 0x41, 0x91, 0x08,
                /* 0090 */   0xD0, 0x28, 0x31, 0x63, 0x22, 0xB0, 0x9D, 0x63,
                /* 0098 */   0x6B, 0x14, 0xA7, 0x51, 0xB8, 0x00, 0xE9, 0x18,
                /* 00A0 */   0x1A, 0xC1, 0x71, 0x85, 0xF7, 0xC8, 0x8E, 0x90,
                /* 00A8 */   0x59, 0x1C, 0x8B, 0x20, 0x43, 0x85, 0xEB, 0x10,
                /* 00B0 */   0x4E, 0x73, 0x32, 0xC8, 0x89, 0x9C, 0x49, 0xEC,
                /* 00B8 */   0x08, 0x05, 0x09, 0xB0, 0x8E, 0x21, 0xA4, 0x58,
                /* 00C0 */   0x51, 0x6A, 0xC6, 0xD3, 0x0C, 0x82, 0x34, 0x0A,
                /* 00C8 */   0xA5, 0xC9, 0x79, 0x00, 0x61, 0xC2, 0xC3, 0x20,
                /* 00D0 */   0x30, 0xFE, 0x11, 0x61, 0x64, 0x40, 0xC8, 0x33,
                /* 00D8 */   0xB2, 0x86, 0x6A, 0x02, 0xBB, 0x17, 0xE0, 0x6C,
                /* 00E0 */   0x6A, 0x32, 0x36, 0x39, 0x29, 0x9B, 0x1D, 0x41,
                /* 00E8 */   0x68, 0x0B, 0x5E, 0xDA, 0x04, 0x18, 0x04, 0x13,
                /* 00F0 */   0x4A, 0x24, 0x0F, 0xE5, 0x78, 0xA2, 0x54, 0x88,
                /* 00F8 */   0xA4, 0xF1, 0xC5, 0x88, 0x52, 0x1C, 0x8A, 0x60,
                /* 0100 */   0x23, 0xB6, 0x86, 0x21, 0x98, 0x98, 0x21, 0xE3,
                /* 0108 */   0x07, 0xB7, 0xFD, 0x83, 0x01, 0x53, 0x00, 0xD1,
                /* 0110 */   0x02, 0x88, 0x22, 0x8D, 0x06, 0x75, 0x18, 0x48,
                /* 0118 */   0xF0, 0x70, 0xE0, 0x71, 0x9E, 0xD6, 0xF9, 0x1D,
                /* 0120 */   0xD7, 0x41, 0x04, 0x39, 0xE1, 0xE3, 0xAA, 0xF3,
                /* 0128 */   0x54, 0x40, 0x46, 0xC6, 0xFE, 0xFF, 0x58, 0x09,
                /* 0130 */   0x3A, 0x38, 0x26, 0x40, 0x71, 0x0D, 0xA8, 0x69,
                /* 0138 */   0x3E, 0x1D, 0xB0, 0x81, 0x86, 0xC3, 0x0C, 0xD1,
                /* 0140 */   0xA3, 0x0D, 0x77, 0x02, 0x87, 0xC8, 0x00, 0x3D,
                /* 0148 */   0xA2, 0x07, 0x03, 0xEC, 0x10, 0x4F, 0xE6, 0x25,
                /* 0150 */   0xA0, 0x54, 0x01, 0x66, 0x4F, 0x08, 0x9A, 0x76,
                /* 0158 */   0x82, 0xE3, 0xF1, 0x71, 0xC0, 0xF3, 0x39, 0xE1,
                /* 0160 */   0x04, 0x96, 0x3F, 0x08, 0xD4, 0xC8, 0x0C, 0xED,
                /* 0168 */   0x71, 0x9E, 0xD6, 0x5B, 0x81, 0x8F, 0x00, 0x26,
                /* 0170 */   0xB0, 0x58, 0x08, 0x6D, 0x52, 0xE3, 0x01, 0x02,
                /* 0178 */   0x8A, 0x0F, 0x05, 0x42, 0x78, 0x75, 0xF0, 0x7C,
                /* 0180 */   0x4D, 0x30, 0x32, 0x84, 0x9C, 0x8C, 0x07, 0x35,
                /* 0188 */   0x0A, 0x83, 0xD6, 0x0A, 0xAE, 0x9B, 0x40, 0x02,
                /* 0190 */   0x47, 0x84, 0xD0, 0x67, 0xC3, 0xA2, 0x86, 0x4D,
                /* 0198 */   0x8F, 0x16, 0xFC, 0x54, 0xC1, 0x20, 0xCF, 0xE0,
                /* 01A0 */   0x11, 0xC0, 0x23, 0x39, 0x21, 0x1F, 0x3E, 0x3C,
                /* 01A8 */   0x30, 0xF8, 0xB3, 0xF0, 0x91, 0x02, 0x1C, 0x1E,
                /* 01B0 */   0xC1, 0x84, 0xF3, 0x0A, 0x01, 0x6B, 0xA4, 0xF0,
                /* 01B8 */   0x6F, 0x11, 0x46, 0xF6, 0xA9, 0xE1, 0xB5, 0x21,
                /* 01C0 */   0x81, 0x0F, 0x1E, 0x81, 0xB1, 0x43, 0xB5, 0x5F,
                /* 01C8 */   0x01, 0x08, 0xC1, 0xA3, 0x3D, 0x0A, 0x3C, 0x7B,
                /* 01D0 */   0x44, 0x78, 0xDC, 0xC0, 0xFC, 0xFF, 0x8F, 0x1B,
                /* 01D8 */   0xB0, 0x09, 0x8A, 0x1C, 0x20, 0x7A, 0x0C, 0xFC,
                /* 01E0 */   0x04, 0x71, 0x0A, 0xF1, 0xC3, 0x1F, 0xC3, 0x11,
                /* 01E8 */   0x45, 0x89, 0x7C, 0x48, 0x3E, 0x9C, 0x18, 0xE1,
                /* 01F0 */   0x10, 0x9E, 0x49, 0xCE, 0xC0, 0x07, 0x0C, 0x4F,
                /* 01F8 */   0xEB, 0x14, 0x5E, 0x24, 0x3C, 0x02, 0x4C, 0xA0,
                /* 0200 */   0x43, 0x0C, 0x8D, 0xB2, 0x7E, 0x45, 0x80, 0x41,
                /* 0208 */   0x9D, 0x63, 0x00, 0x57, 0x30, 0xCF, 0x31, 0xE0,
                /* 0210 */   0x3B, 0x3E, 0xF0, 0x6B, 0x00, 0xE6, 0x7C, 0xF2,
                /* 0218 */   0x14, 0x03, 0x07, 0x97, 0x81, 0xBC, 0x04, 0xC4,
                /* 0220 */   0x79, 0x77, 0xF1, 0xCD, 0xC4, 0xD7, 0x02, 0xE3,
                /* 0228 */   0x3E, 0xC4, 0x80, 0x61, 0x60, 0x0F, 0x31, 0xE0,
                /* 0230 */   0xFC, 0xFF, 0x1F, 0x62, 0xE0, 0x05, 0x3F, 0xC4,
                /* 0238 */   0x00, 0x34, 0x91, 0x77, 0xBE, 0x90, 0x91, 0x55,
                /* 0240 */   0xF8, 0x10, 0x83, 0xBA, 0x21, 0x9C, 0xCF, 0x43,
                /* 0248 */   0xCA, 0xD3, 0x01, 0x93, 0x73, 0xCE, 0xA0, 0x87,
                /* 0250 */   0x18, 0xE0, 0x01, 0x88, 0xF7, 0x3E, 0x65, 0x32,
                /* 0258 */   0x82, 0x33, 0x35, 0xA0, 0x51, 0x7D, 0xAE, 0x00,
                /* 0260 */   0xC7, 0x79, 0x82, 0xFF, 0xFF, 0xCF, 0x13, 0x18,
                /* 0268 */   0xBC, 0xD7, 0x0A, 0x76, 0x0C, 0x60, 0x67, 0x0A,
                /* 0270 */   0x38, 0x57, 0x0A, 0x9F, 0x5A, 0x7C, 0x4E, 0xF0,
                /* 0278 */   0x18, 0xF9, 0x58, 0x0C, 0x1A, 0xF2, 0x41, 0xC0,
                /* 0280 */   0x0B, 0xB4, 0xAC, 0xB3, 0x0D, 0x68, 0x2E, 0x13,
                /* 0288 */   0xCF, 0x3D, 0xD8, 0xA3, 0x0D, 0x18, 0x90, 0x2A,
                /* 0290 */   0xBD, 0x05, 0xE8, 0x02, 0x82, 0x23, 0xF0, 0xC1,
                /* 0298 */   0x06, 0xF8, 0xC4, 0x3A, 0xD5, 0xD0, 0x30, 0x63,
                /* 02A0 */   0x54, 0x10, 0x18, 0xD4, 0xC1, 0x06, 0x70, 0x75,
                /* 02A8 */   0xE8, 0xF0, 0xC1, 0x06, 0x3C, 0xFF, 0xFF, 0x11,
                /* 02B0 */   0xB2, 0xC1, 0x9C, 0x44, 0x98, 0xA3, 0x08, 0xF6,
                /* 02B8 */   0x2C, 0xE1, 0x9B, 0x0D, 0x78, 0xB0, 0xB1, 0x27,
                /* 02C0 */   0x1B, 0xB0, 0x9C, 0x09, 0x9E, 0x6C, 0x80, 0x49,
                /* 02C8 */   0xF8, 0x93, 0x0D, 0x40, 0x1E, 0xD8, 0x27, 0x81,
                /* 02D0 */   0x77, 0x80, 0xFF, 0xFF, 0x93, 0x0D, 0x60, 0xF1,
                /* 02D8 */   0x4A, 0x81, 0x3D, 0xD9, 0x40, 0x5E, 0xBC, 0x4E,
                /* 02E0 */   0x36, 0xE0, 0x3A, 0x03, 0x82, 0xED, 0x08, 0x02,
                /* 02E8 */   0xF3, 0x6C, 0x03, 0x9C, 0xCE, 0x80, 0xC0, 0xE1,
                /* 02F0 */   0xFF, 0x7F, 0x06, 0x04, 0x1C, 0x9E, 0x5B, 0x9E,
                /* 02F8 */   0x01, 0xC1, 0x75, 0xF2, 0x64, 0x67, 0x40, 0x70,
                /* 0300 */   0xA1, 0x3C, 0x03, 0x02, 0x66, 0xFF, 0xFF, 0x67,
                /* 0308 */   0x40, 0xC0, 0xD2, 0xE9, 0x80, 0x9D, 0x01, 0x01,
                /* 0310 */   0x4E, 0xFD, 0xFF, 0x2F, 0x20, 0xFC, 0x0C, 0x08,
                /* 0318 */   0x30, 0xEC, 0x66, 0x03, 0x1B, 0x1B, 0x7B, 0xB2,
                /* 0320 */   0x01, 0xCB, 0x19, 0x10, 0x77, 0xB2, 0x01, 0xEF,
                /* 0328 */   0xFF, 0xFF, 0x0C, 0x08, 0x30, 0xE9, 0x64, 0x03,
                /* 0330 */   0x58, 0xFB, 0xFF, 0x9F, 0x01, 0x01, 0x63, 0x67,
                /* 0338 */   0x1B, 0x60, 0x75, 0x06, 0x04, 0xBC, 0xFF, 0xFF,
                /* 0340 */   0xCF, 0x80, 0xF8, 0x63, 0xCB, 0x33, 0x20, 0xB8,
                /* 0348 */   0x70, 0x9F, 0x01, 0xC1, 0x87, 0xF1, 0x0C, 0x08,
                /* 0350 */   0xF0, 0xEF, 0x74, 0xC0, 0x8E, 0x36, 0xFC, 0xFF,
                /* 0358 */   0x7F, 0x06, 0x04, 0x18, 0x75, 0x10, 0x60, 0x67,
                /* 0360 */   0x40, 0xC0, 0xD3, 0xFF, 0xFF, 0x0C, 0x08, 0x58,
                /* 0368 */   0xBB, 0xD9, 0xC0, 0xC6, 0xC6, 0x9E, 0x6C, 0xC0,
                /* 0370 */   0x72, 0x06, 0xC4, 0x9D, 0x6C, 0xC0, 0x7F, 0x06,
                /* 0378 */   0x04, 0x5C, 0xFD, 0xFF, 0xCF, 0x80, 0x80, 0x95,
                /* 0380 */   0x93, 0x0D, 0xE0, 0xF1, 0x0C, 0x08, 0xF8, 0x39,
                /* 0388 */   0x0A, 0xFC, 0xFF, 0x9F, 0x01, 0x01, 0x6E, 0xCD,
                /* 0390 */   0xE1, 0x19, 0x10, 0x5C, 0x33, 0xF3, 0x19, 0x10,
                /* 0398 */   0x6C, 0xF7, 0x1A, 0x9F, 0x01, 0xC1, 0xFF, 0xFF,
                /* 03A0 */   0x3F, 0x03, 0x02, 0xEC, 0x39, 0x1D, 0xB0, 0xA3,
                /* 03A8 */   0x0D, 0xE0, 0xEE, 0xFF, 0x7F, 0x06, 0x04, 0xEC,
                /* 03B0 */   0x1C, 0x04, 0xD8, 0x19, 0x10, 0xE0, 0xD6, 0xFF,
                /* 03B8 */   0xFF, 0x66, 0x03, 0x1F, 0x1B, 0x7B, 0xB2, 0x01,
                /* 03C0 */   0xCB, 0x19, 0x10, 0x77, 0xB2, 0x01, 0xFF, 0x19,
                /* 03C8 */   0x10, 0x60, 0xD0, 0xC9, 0x06, 0xF6, 0xFF, 0xFF,
                /* 03D0 */   0x0C, 0x08, 0x30, 0xE9, 0x6C, 0x03, 0xAC, 0xCE,
                /* 03D8 */   0x80, 0xC0, 0xEF, 0xFF, 0x7F, 0x06, 0x04, 0x3C,
                /* 03E0 */   0xDD, 0x5B, 0x9E, 0x01, 0xC1, 0x85, 0xFB, 0x0C,
                /* 03E8 */   0x08, 0x3E, 0x88, 0x67, 0x40, 0xC0, 0xFA, 0xFF,
                /* 03F0 */   0xFF, 0x0C, 0x08, 0x98, 0x38, 0x1D, 0xB0, 0x33,
                /* 03F8 */   0x20, 0xC0, 0xAC, 0x83, 0x00, 0x3B, 0xD8, 0xE0,
                /* 0400 */   0xFF, 0xFF, 0x67, 0x40, 0x80, 0x4D, 0x37, 0x1B,
                /* 0408 */   0xD8, 0xD8, 0xD8, 0x93, 0x0D, 0x58, 0xCE, 0x80,
                /* 0410 */   0xB8, 0x93, 0x0D, 0xF8, 0xCF, 0x80, 0x70, 0xFE,
                /* 0418 */   0xFF, 0x67, 0x40, 0x80, 0x2D, 0x27, 0x1B, 0xC0,
                /* 0420 */   0xE3, 0x95, 0x02, 0xF3, 0xFF, 0x3F, 0x03, 0x02,
                /* 0428 */   0x56, 0xCE, 0x36, 0xC0, 0xEA, 0x0C, 0x08, 0xF0,
                /* 0430 */   0xE0, 0xE0, 0xF2, 0x66, 0x83, 0xF9, 0xFF, 0x9F,
                /* 0438 */   0x01, 0xC1, 0x80, 0xFB, 0x0C, 0x08, 0xBE, 0xFB,
                /* 0440 */   0xC1, 0x33, 0x20, 0xC0, 0xBF, 0xD3, 0x01, 0x3B,
                /* 0448 */   0xDA, 0x80, 0xE3, 0xFF, 0x7F, 0x06, 0x04, 0x58,
                /* 0450 */   0x73, 0x10, 0x60, 0x67, 0x40, 0xC0, 0xE1, 0xFF,
                /* 0458 */   0xFF, 0x0C, 0x08, 0x98, 0xB9, 0xD9, 0xC0, 0xC6,
                /* 0460 */   0xC6, 0x9E, 0x6C, 0xC0, 0x72, 0x06, 0xC4, 0x9D,
                /* 0468 */   0x6C, 0xC0, 0x7F, 0x06, 0x04, 0x3C, 0xFE, 0xFF,
                /* 0470 */   0xCF, 0x80, 0xC0, 0xFC, 0x64, 0x03, 0x78, 0x3C,
                /* 0478 */   0x03, 0x02, 0x7E, 0xCE, 0x36, 0xB0, 0xFF, 0xFF,
                /* 0480 */   0x67, 0x40, 0x80, 0x3F, 0xDE, 0xCE, 0x80, 0x20,
                /* 0488 */   0xC3, 0x7D, 0x06, 0x04, 0xDF, 0xFD, 0xE0, 0x19,
                /* 0490 */   0x10, 0xD8, 0xFD, 0xFF, 0xCF, 0x80, 0x00, 0x43,
                /* 0498 */   0x4E, 0x07, 0xEC, 0x0C, 0x08, 0x78, 0xFD, 0xFF,
                /* 04A0 */   0x9F, 0x01, 0x01, 0x03, 0x07, 0x01, 0x76, 0x06,
                /* 04A8 */   0x04, 0xD8, 0x75, 0xB3, 0x81, 0xF9, 0xFF, 0xBF,
                /* 04B0 */   0x60, 0xC1, 0x38, 0xD9, 0x80, 0xE5, 0x0C, 0x88,
                /* 04B8 */   0x3B, 0xD9, 0x80, 0xFF, 0x0C, 0x08, 0x30, 0xE8,
                /* 04C0 */   0x64, 0x03, 0xE6, 0xFF, 0xFF, 0x19, 0x10, 0x60,
                /* 04C8 */   0xCB, 0xD9, 0x06, 0x58, 0x9D, 0x01, 0x81, 0xFB,
                /* 04D0 */   0xFF, 0xFF, 0x0C, 0x08, 0xB8, 0x38, 0x1A, 0x3C,
                /* 04D8 */   0x03, 0x82, 0xEB, 0x96, 0xE0, 0x33, 0x20, 0xD8,
                /* 04E0 */   0xEE, 0x07, 0xCF, 0x80, 0x00, 0x23, 0xFE, 0xFF,
                /* 04E8 */   0x67, 0x40, 0x60, 0x7B, 0x3A, 0x60, 0x67, 0x40,
                /* 04F0 */   0x80, 0x59, 0x07, 0x01, 0x76, 0xB0, 0x01, 0xD7,
                /* 04F8 */   0xFF, 0xFF, 0x0C, 0x08, 0x30, 0xE6, 0x66, 0x03,
                /* 0500 */   0x1B, 0x1B, 0x7B, 0xB2, 0x01, 0xCB, 0x19, 0x10,
                /* 0508 */   0x77, 0xB2, 0x01, 0xFF, 0x19, 0x10, 0x7C, 0xFF,
                /* 0510 */   0xFF, 0x33, 0x20, 0xC0, 0x88, 0x93, 0x0D, 0xE0,
                /* 0518 */   0xF1, 0x0C, 0x08, 0x96, 0xFF, 0xFF, 0x19, 0x10,
                /* 0520 */   0x98, 0x9F, 0x6D, 0x80, 0x55, 0xB4, 0x83, 0x0D,
                /* 0528 */   0x2A, 0xCC, 0xD9, 0x06, 0x10, 0x3D, 0xEF, 0x87,
                /* 0530 */   0x0F, 0x1F, 0x0C, 0x7C, 0x10, 0xC0, 0xDC, 0x6C,
                /* 0538 */   0xE0, 0xDC, 0x2A, 0x7C, 0x5D, 0xF1, 0x41, 0xC4,
                /* 0540 */   0x87, 0x07, 0xF6, 0xFF, 0x87, 0x8A, 0x13, 0x9E,
                /* 0548 */   0x9F, 0x1C, 0x7C, 0xB6, 0x81, 0x7D, 0x9A, 0x79,
                /* 0550 */   0x08, 0xC4, 0x21, 0x3C, 0xDB, 0x80, 0xFD, 0x4D,
                /* 0558 */   0xE1, 0x63, 0x81, 0xCF, 0x36, 0x00, 0x3F, 0x44,
                /* 0560 */   0x1C, 0x30, 0xE4, 0x64, 0x3C, 0xA8, 0x51, 0x58,
                /* 0568 */   0xE3, 0x25, 0x81, 0x4C, 0xDB, 0x04, 0x43, 0x43,
                /* 0570 */   0xE8, 0xB4, 0xE4, 0xB3, 0x0D, 0x38, 0xFF, 0xFF,
                /* 0578 */   0x67, 0x1B, 0x70, 0x9E, 0x4E, 0xF0, 0x67, 0x1B,
                /* 0580 */   0x30, 0x9D, 0x25, 0x30, 0x04, 0x1E, 0x32, 0xFC,
                /* 0588 */   0xD3, 0x0C, 0x3F, 0x3E, 0xBC, 0x3F, 0x24, 0xF0,
                /* 0590 */   0xB9, 0x0F, 0x6C, 0xA7, 0x0E, 0x38, 0x87, 0x19,
                /* 0598 */   0x60, 0x32, 0x26, 0xDC, 0x91, 0xC2, 0x43, 0xE0,
                /* 05A0 */   0x03, 0x68, 0x75, 0x7E, 0xE4, 0x58, 0x78, 0x56,
                /* 05A8 */   0xB8, 0xB3, 0x0C, 0x1F, 0x15, 0xE6, 0x74, 0x83,
                /* 05B0 */   0x8B, 0xF2, 0x3E, 0x30, 0x81, 0x82, 0xBC, 0x0B,
                /* 05B8 */   0x24, 0xF2, 0x81, 0x40, 0x61, 0x7C, 0xBA, 0x01,
                /* 05C0 */   0x8E, 0xFF, 0xFF, 0xD3, 0x0D, 0xF0, 0x98, 0xA4,
                /* 05C8 */   0x4F, 0x37, 0x60, 0x83, 0x88, 0x18, 0xAC, 0x68,
                /* 05D0 */   0x30, 0xDD, 0x9A, 0x70, 0xB7, 0x1B, 0x1C, 0x5E,
                /* 05D8 */   0xB8, 0x18, 0xA7, 0xC3, 0x10, 0xA2, 0x3C, 0xB0,
                /* 05E0 */   0x18, 0x99, 0x1F, 0x03, 0xC1, 0x70, 0x9B, 0x79,
                /* 05E8 */   0xB6, 0x01, 0x2E, 0xE1, 0x0E, 0x05, 0xFA, 0x43,
                /* 05F0 */   0xF9, 0x6C, 0x03, 0xF8, 0xFC, 0xFF, 0x9F, 0x6D,
                /* 05F8 */   0x80, 0xCF, 0x41, 0x04, 0x77, 0x32, 0x01, 0xC3,
                /* 0600 */   0x89, 0x01, 0xD6, 0xB1, 0x0D, 0xB8, 0x88, 0x5B,
                /* 0608 */   0xA9, 0x4E, 0x3B, 0x16, 0x06, 0x22, 0x1B, 0x87,
                /* 0610 */   0x45, 0x3A, 0x54, 0x0B, 0xA1, 0xD2, 0x90, 0x7C,
                /* 0618 */   0x04, 0x3A, 0xBB, 0x47, 0x85, 0xE7, 0x04, 0x01,
                /* 0620 */   0x09, 0xD4, 0x10, 0x0E, 0x0F, 0xA1, 0xE8, 0xA3,
                /* 0628 */   0xA1, 0xC0, 0x0E, 0x0B, 0x46, 0x41, 0x3C, 0x7A,
                /* 0630 */   0x07, 0x81, 0xD0, 0xA1, 0x08, 0x7F, 0x62, 0xF0,
                /* 0638 */   0x7C, 0xDE, 0xF8, 0x4D, 0xF0, 0xB0, 0xF1, 0xB4,
                /* 0640 */   0x00, 0xEB, 0x62, 0xE0, 0x63, 0x00, 0x3F, 0x13,
                /* 0648 */   0xE2, 0x0F, 0xFD, 0x26, 0xE0, 0xC7, 0x1E, 0xF0,
                /* 0650 */   0x09, 0x3C, 0x0D, 0x80, 0x02, 0xC8, 0x93, 0xF7,
                /* 0658 */   0xB1, 0xE6, 0x01, 0x80, 0xCD, 0xE1, 0xC9, 0xC6,
                /* 0660 */   0x68, 0xFF, 0xFF, 0x47, 0x1A, 0x9C, 0x8C, 0x95,
                /* 0668 */   0xEA, 0x4B, 0xE3, 0x33, 0xA3, 0xC7, 0xC5, 0xCF,
                /* 0670 */   0x03, 0x3E, 0xB8, 0xB0, 0xB3, 0x01, 0xEE, 0x0C,
                /* 0678 */   0x85, 0x81, 0xF5, 0x48, 0x39, 0xAC, 0xD1, 0xC2,
                /* 0680 */   0x1E, 0xF0, 0x43, 0x83, 0x2F, 0x1C, 0x9E, 0x99,
                /* 0688 */   0xCF, 0x28, 0x3E, 0x6A, 0x80, 0xE5, 0x38, 0x05,
                /* 0690 */   0xFF, 0xB0, 0x82, 0x3B, 0xC9, 0xC0, 0x9D, 0xE6,
                /* 0698 */   0x23, 0xC1, 0xA3, 0x9E, 0x87, 0x1E, 0xDE, 0x47,
                /* 06A0 */   0x18, 0xCF, 0x2E, 0x88, 0xAF, 0x9D, 0xFC, 0xF2,
                /* 06A8 */   0x7D, 0x5A, 0xBE, 0xEF, 0xF8, 0xE8, 0x63, 0xA0,
                /* 06B0 */   0x27, 0x86, 0xA8, 0xAF, 0x27, 0x9E, 0x00, 0xBF,
                /* 06B8 */   0x50, 0x38, 0xC6, 0xA9, 0x88, 0x06, 0x5A, 0xA9,
                /* 06C0 */   0xA4, 0xAE, 0x99, 0xC2, 0xF8, 0x54, 0x04, 0xB8,
                /* 06C8 */   0x8A, 0x30, 0x78, 0x50, 0xFC, 0xFF, 0x4F, 0x45,
                /* 06D0 */   0xD8, 0x1B, 0x86, 0x2F, 0x03, 0x3E, 0x14, 0x81,
                /* 06D8 */   0xE5, 0x40, 0xE2, 0x89, 0xBD, 0x04, 0xF8, 0xDC,
                /* 06E0 */   0x80, 0xC3, 0x39, 0x03, 0x7E, 0x32, 0x02, 0xC3,
                /* 06E8 */   0x5D, 0xFB, 0xC9, 0x08, 0xB8, 0x44, 0x3B, 0x19,
                /* 06F0 */   0x01, 0x34, 0x39, 0xDF, 0xE1, 0xFE, 0xFF, 0x27,
                /* 06F8 */   0x23, 0x30, 0x9C, 0x1A, 0x60, 0x1C, 0x8C, 0x80,
                /* 0700 */   0x8B, 0xA4, 0x83, 0x11, 0x95, 0x73, 0x30, 0x82,
                /* 0708 */   0x72, 0x84, 0xC0, 0x1D, 0x8C, 0xC0, 0x3F, 0xA6,
                /* 0710 */   0x33, 0x7A, 0x1D, 0x38, 0x75, 0x1F, 0x8C, 0x00,
                /* 0718 */   0x73, 0xC3, 0xF5, 0xC1, 0x08, 0xF8, 0xFC, 0xFF,
                /* 0720 */   0x0F, 0x46, 0xC0, 0xE5, 0x70, 0xE1, 0x83, 0x11,
                /* 0728 */   0xB8, 0x0F, 0x0B, 0xFC, 0x10, 0x83, 0x25, 0x28,
                /* 0730 */   0xFE, 0x35, 0x64, 0x02, 0x85, 0x5A, 0xA4, 0x24,
                /* 0738 */   0x2F, 0x97, 0xC2, 0xF8, 0x4C, 0x04, 0xB8, 0x8A,
                /* 0740 */   0x71, 0x26, 0x02, 0x21, 0xC6, 0xE3, 0xB1, 0x11,
                /* 0748 */   0xCF, 0x38, 0x6C, 0xB8, 0xE7, 0x8B, 0xA7, 0x22,
                /* 0750 */   0xB0, 0xCF, 0xE1, 0x0C, 0xFA, 0xBC, 0x6E, 0xE9,
                /* 0758 */   0x54, 0x84, 0xFF, 0xFF, 0x9F, 0x8A, 0x60, 0x1C,
                /* 0760 */   0x83, 0x9E, 0x8A, 0x80, 0x4B, 0xBC, 0x53, 0x11,
                /* 0768 */   0x40, 0x93, 0x13, 0xC4, 0x53, 0x11, 0xB8, 0xCE,
                /* 0770 */   0x0D, 0x30, 0xCF, 0x45, 0xE0, 0xFB, 0xFF, 0x9F,
                /* 0778 */   0x8B, 0xE0, 0x3E, 0x08, 0x7C, 0x18, 0x22, 0xE7,
                /* 0780 */   0x22, 0x74, 0x78, 0x2A, 0x1D, 0x22, 0x70, 0xB1,
                /* 0788 */   0xCF, 0x45, 0x74, 0xD8, 0x0E, 0x4C, 0xA2, 0x43,
                /* 0790 */   0xBD, 0xCF, 0x45, 0x3C, 0xE6, 0x91, 0x86, 0x82,
                /* 0798 */   0x18, 0xD0, 0x19, 0xCE, 0x45, 0x68, 0x15, 0xE7,
                /* 07A0 */   0x22, 0xE4, 0x20, 0xDF, 0x16, 0xD8, 0xEC, 0x7C,
                /* 07A8 */   0x0F, 0xE0, 0x37, 0x15, 0x5F, 0x8B, 0x18, 0x6E,
                /* 07B0 */   0x35, 0xD7, 0x1D, 0x14, 0x98, 0x6F, 0x45, 0x18,
                /* 07B8 */   0x5D, 0xA7, 0x22, 0x90, 0xE9, 0xBB, 0x14, 0x81,
                /* 07C0 */   0x1C, 0x9D, 0x9F, 0xA8, 0xC0, 0x87, 0xFF, 0x3C,
                /* 07C8 */   0xE0, 0x21, 0x3C, 0x51, 0xC1, 0x3D, 0x13, 0xBC,
                /* 07D0 */   0xF5, 0xF8, 0x44, 0x05, 0xFB, 0x90, 0x4B, 0x4E,
                /* 07D8 */   0x54, 0x40, 0xE3, 0xFF, 0x7F, 0xA2, 0x02, 0x5F,
                /* 07E0 */   0xEC, 0x13, 0x15, 0xA0, 0xE7, 0x08, 0x82, 0x3B,
                /* 07E8 */   0xB9, 0x82, 0xF5, 0x98, 0x81, 0x51, 0x68, 0xD3,
                /* 07F0 */   0xA7, 0x46, 0xA3, 0x56, 0x0D, 0xCA, 0xD4, 0x28,
                /* 07F8 */   0xD3, 0xA0, 0x56, 0x9F, 0x4A, 0x8D, 0x19, 0xBB,
                /* 0800 */   0x0F, 0x58, 0xE2, 0x3B, 0x41, 0xC3, 0x75, 0x40,
                /* 0808 */   0x10, 0x1A, 0x89, 0x42, 0x20, 0x8E, 0xF2, 0xA7,
                /* 0810 */   0x10, 0x88, 0x85, 0x78, 0x00, 0x61, 0x42, 0x57,
                /* 0818 */   0x24, 0x10, 0x8B, 0x5B, 0x9B, 0x40, 0x1C, 0x0D,
                /* 0820 */   0x84, 0x46, 0x5F, 0x9D, 0x40, 0x1C, 0xD8, 0x07,
                /* 0828 */   0x08, 0x93, 0xFB, 0x26, 0x10, 0x88, 0xE3, 0x18,
                /* 0830 */   0x01, 0x61, 0x11, 0x5E, 0x54, 0x3A, 0x06, 0x10,
                /* 0838 */   0x2B, 0x20, 0x4C, 0xA0, 0x16, 0x10, 0x26, 0xCB,
                /* 0840 */   0x0C, 0x08, 0x0B, 0x05, 0x42, 0x43, 0x7F, 0x39,
                /* 0848 */   0x04, 0xE2, 0xA0, 0x76, 0x40, 0x98, 0x4C, 0x3D,
                /* 0850 */   0x20, 0x2C, 0x86, 0x1F, 0x10, 0x26, 0x5E, 0xD1,
                /* 0858 */   0x60, 0x28, 0x08, 0x95, 0xF6, 0xE6, 0xD2, 0x61,
                /* 0860 */   0x82, 0x78, 0x02, 0x61, 0x61, 0x40, 0xE8, 0xFF,
                /* 0868 */   0x3F, 0xAC, 0x28, 0x10, 0x16, 0xD1, 0xD5, 0x60,
                /* 0870 */   0xE8, 0xDB, 0x40, 0x20, 0x0E, 0xF0, 0x4C, 0x0A,
                /* 0878 */   0x42, 0x44, 0x3F, 0x25, 0x04, 0xE2, 0xC8, 0x20,
                /* 0880 */   0x54, 0xD2, 0x1F, 0x42, 0x43, 0x25, 0x7F, 0xA5,
                /* 0888 */   0x83, 0x61, 0x20, 0x34, 0xE6, 0x83, 0xE9, 0x50,
                /* 0890 */   0xD9, 0x5F, 0x4B, 0x20, 0x16, 0xA6, 0x0E, 0x84,
                /* 0898 */   0x09, 0x77, 0x37, 0x54, 0xFA, 0x19, 0xD1, 0x60,
                /* 08A0 */   0x08, 0x08, 0x15, 0xF3, 0xA8, 0xD0, 0x50, 0xC9,
                /* 08A8 */   0x83, 0x22, 0x08, 0x91, 0x0F, 0x42, 0xE3, 0xBD,
                /* 08B0 */   0x04, 0x34, 0x54, 0xF2, 0x21, 0xD0, 0x60, 0xC8,
                /* 08B8 */   0x1B, 0x47, 0x20, 0x96, 0xFC, 0x4A, 0xD3, 0x50,
                /* 08C0 */   0xC9, 0x43, 0x41, 0x20, 0x0E, 0x09, 0x42, 0x45,
                /* 08C8 */   0xBC, 0x72, 0x82, 0x90, 0xF0, 0xCF, 0x8B, 0x20,
                /* 08D0 */   0x44, 0xBA, 0xD1, 0x41, 0xD0, 0xE7, 0xC5, 0x83,
                /* 08D8 */   0x01, 0xB3, 0x0A, 0xC2, 0x04, 0x69, 0x1D, 0x36,
                /* 08E0 */   0x7D, 0x28, 0x14, 0xF0, 0x15, 0xD0, 0xE1, 0x20,
                /* 08E8 */   0x88, 0x80, 0x2C, 0xD2, 0xED, 0x80, 0x29, 0x08,
                /* 08F0 */   0x15, 0x63, 0x17, 0x90, 0x49, 0x03, 0x11, 0x90,
                /* 08F8 */   0xE3, 0x0A, 0x06, 0x61, 0x62, 0x5F, 0x14, 0x41,
                /* 0900 */   0x48, 0xAE, 0xE7, 0x51, 0x40, 0x12, 0x12, 0x44,
                /* 0908 */   0xC7, 0x03, 0xF2, 0x84, 0x13, 0x90, 0xC3, 0x81,
                /* 0910 */   0x08, 0xC8, 0xFF, 0x7F
            })
        }
    }
    Scope (WMI0)
    {
        Name (WMIP, Zero)
        Method (IN_T, 1, NotSerialized)
        {
            Store (One, WMIP)
            Return (Zero)
        }
        Name (PCDV, Zero)
        Method (WD_G, 1, NotSerialized)
        {
            Return (Zero)
        }
        Method (_WED, 1, NotSerialized)
        {
            Return (Arg0)
        }
        Method (WG_F, 3, Serialized)
        {
            Store (WG_N (Arg0), Local0)
            Store (And (ShiftRight (Local0, 0x10), 0xFFFF), Local1)
            And (Local0, 0xFFFF, Local0)
            If (CS_C (Arg0, Local0, Local1, Arg2))
            {
                Return (Zero)
            }
            WG_L (Arg0, Arg1, Local0, Local1, Arg2)
            OperationRegion (\WMIF, SystemMemory, Arg0, 0x0100)
            Field (WMIF, DWordAcc, NoLock, Preserve)
            {
                Offset (0x06), 
                STAS,   8, 
                REST,   8
            }
            If (LNotEqual (LAnd (STAS, One), One))
            {
                Return (Zero)
            }
            Store (0x82, STAS)
            Store (One, REST)
            Return (Zero)
        }
        Method (WG_N, 1, NotSerialized)
        {
            OperationRegion (\PAR, SystemMemory, Arg0, 0x08)
            Field (PAR, DWordAcc, NoLock, Preserve)
            {
                FUNC,   32, 
                Offset (0x06), 
                STAS,   8, 
                EROR,   8
            }
            Store (Zero, EROR)
            Store (One, STAS)
            Return (FUNC)
        }
        Name (WGSL, Package (0x05)
        {
            0x66, 
            One, 
            0x6A, 
            One, 
            Ones
        })
        Method (CS_C, 4, NotSerialized)
        {
            Store (Zero, Local0)
            While (One)
            {
                Store (DerefOf (Index (WGSL, Local0)), Local1)
                If (LEqual (Local1, Ones))
                {
                    Return (Zero)
                }
                Add (Local0, One, Local0)
                Store (DerefOf (Index (WGSL, Local0)), Local2)
                If (LEqual (Local1, Arg1))
                {
                    If (LEqual (Local2, Arg2))
                    {
                        Break
                    }
                }
                Add (Local0, One, Local0)
            }
            OperationRegion (\WMIC, SystemMemory, Arg0, 0x0100)
            Field (WMIC, DWordAcc, NoLock, Preserve)
            {
                Offset (0x07), 
                REST,   8
            }
            Store (Arg3, PM_S)
            ISMI (0xDE)
            Return (REST)
        }
    }
    Scope (_SB.PCI0.LPC0.EC0)
    {
        Name (PUNT, One)
        Name (LFCC, 0x1770)
        Name (LFC0, Zero)
        Name (LFC1, Zero)
        Name (NBIF, Package (0x0D)
        {
            Zero, 
            Ones, 
            Ones, 
            One, 
            Ones, 
            Ones, 
            Ones, 
            Ones, 
            Ones, 
            "", 
            "", 
            "", 
            ""
        })
        Name (PBIF, Package (0x0D)
        {
            One, 
            0x1770, 
            0x1770, 
            One, 
            0x39D0, 
            0x0258, 
            0x012C, 
            0x3C, 
            0x3C, 
            "Model", 
            "  ", 
            "LIon", 
            "OEM"
        })
        Name (PBST, Package (0x04)
        {
            Zero, 
            Ones, 
            Ones, 
            Ones
        })
        Name (BIXP, Package (0x14)
        {
            Zero, 
            Zero, 
            Ones, 
            Ones, 
            One, 
            Ones, 
            Zero, 
            Zero, 
            Ones, 
            Ones, 
            Ones, 
            Ones, 
            Zero, 
            Zero, 
            One, 
            One, 
            "SDI ICR18650", 
            "123456789", 
            "LION", 
            "Simplo"
        })
        Mutex (MUBT, 0x00)
        Method (BI_F, 5, NotSerialized)
        {
            Store (Arg0, PUNT)
            Store (Arg1, Local1)
            Store (Arg2, Local2)
            If (LEqual (PUNT, Zero))
            {
                Multiply (Local1, 0x0A, Local1)
                Multiply (Local2, 0x0A, Local2)
            }
            Store (PUNT, Index (PBIF, Zero))
            Store (Local1, Index (PBIF, One))
            Store (Local2, Index (PBIF, 0x02))
            Store (Local2, LFCC)
            Store (Arg3, Index (PBIF, 0x03))
            Store (Arg4, Index (PBIF, 0x04))
            Divide (Local2, 0x64, Local3, Local5)
            Multiply (Local5, 0x0A, Local6)
            Store (Local6, Index (PBIF, 0x05))
            Multiply (Local5, 0x05, Local6)
            Store (Local6, Index (PBIF, 0x06))
            Divide (Local1, 0x64, Local3, Local7)
            Store (Local7, Index (PBIF, 0x07))
            Store (Local7, Index (PBIF, 0x08))
            If (PUNT)
            {
                Store (Zero, Index (PBIF, Zero))
                Multiply (DerefOf (Index (PBIF, One)), DerefOf (Index (PBIF, 0x04
                    )), Local0)
                Divide (Local0, 0x03E8, Local1, Index (PBIF, One))
                Multiply (DerefOf (Index (PBIF, 0x02)), DerefOf (Index (PBIF, 0x04
                    )), Local0)
                Divide (Local0, 0x03E8, Local1, Index (PBIF, 0x02))
                Multiply (DerefOf (Index (PBIF, 0x05)), DerefOf (Index (PBIF, 0x04
                    )), Local0)
                Divide (Local0, 0x03E8, Local1, Index (PBIF, 0x05))
                Multiply (DerefOf (Index (PBIF, 0x06)), DerefOf (Index (PBIF, 0x04
                    )), Local0)
                Divide (Local0, 0x03E8, Local1, Index (PBIF, 0x06))
                Multiply (DerefOf (Index (PBIF, 0x07)), DerefOf (Index (PBIF, 0x04
                    )), Local0)
                Divide (Local0, 0x03E8, Local1, Index (PBIF, 0x07))
                Multiply (DerefOf (Index (PBIF, 0x08)), DerefOf (Index (PBIF, 0x04
                    )), Local0)
                Divide (Local0, 0x03E8, Local1, Index (PBIF, 0x08))
                Store (DerefOf (Index (PBIF, 0x02)), LFCC)
            }
        }
        Method (BS_L, 1, Serialized)
        {
            If (LNot (BT_P (Arg0)))
            {
                Return (NBIF)
            }
            If (LEqual (GB_T (Arg0), 0xFF))
            {
                Return (NBIF)
            }
            If (LEqual (Acquire (MUBT, 0xFFFF), Zero))
            {
                BS_F (Arg0)
                Store (BD_N (), Index (PBIF, 0x09))
                Store (BP_U (), Local0)
                Store (BD_C (), Local1)
                Store (BL_F (), Local2)
                If (Arg0)
                {
                    Store (Local2, LFC1)
                }
                Else
                {
                    Store (Local2, LFC0)
                }
                Store (BT_C (), Local3)
                Store (BD_V (), Local4)
                If (LNotEqual (Local0, Ones))
                {
                    If (LNotEqual (Local1, Ones))
                    {
                        If (LNotEqual (Local2, Ones))
                        {
                            If (LNotEqual (Local3, Ones))
                            {
                                If (LNotEqual (Local4, Ones))
                                {
                                    BI_F (Local0, Local1, Local2, Local3, Local4)
                                }
                            }
                        }
                    }
                }
                Release (MUBT)
            }
            Return (PBIF)
        }
        Method (BS_C, 5, NotSerialized)
        {
            And (Arg1, 0xFFFF, Local1)
            Store (Zero, Local0)
            If (AP_S ())
            {
                Store (One, Local0)
            }
            If (Local0)
            {
                If (BC_H (Arg4))
                {
                    Store (0x02, Local0)
                }
                Else
                {
                    Store (Zero, Local0)
                }
            }
            Else
            {
                Store (One, Local0)
            }
            And (Arg0, 0x0300, Local2)
            If (Local2)
            {
                ShiftLeft (One, 0x02, Local2)
                Or (Local0, Local2, Local0)
            }
            If (LGreaterEqual (Local1, 0x8000))
            {
                Subtract (0xFFFF, Local1, Local1)
            }
            Store (Arg2, Local2)
            If (LEqual (PUNT, Zero))
            {
                Multiply (Local1, BD_V (), Local1)
                Divide (Local1, 0x03E8, Local3, Local1)
                Multiply (Local2, 0x0A, Local2)
            }
            Else
            {
                Multiply (Local1, BD_V (), Local1)
                Divide (Local1, 0x03E8, Local6, Local1)
                Multiply (Local2, BD_V (), Local2)
                Divide (Local2, 0x03E8, Local6, Local2)
            }
            And (Local0, 0x02, Local3)
            If (LNot (Local3))
            {
                Subtract (LFCC, Local2, Local3)
                Divide (LFCC, 0xC8, Local4, Local5)
                If (LLess (Local3, Local5))
                {
                    Store (LFCC, Local2)
                }
            }
            Else
            {
                If (BC_F (Arg4))
                {
                    And (Local0, 0x05, Local0)
                    Store (LFCC, Local2)
                }
            }
            If (LNot (AP_S ()))
            {
                Divide (Local2, 0x0A, Local3, Local4)
                If (LLess (Local1, Local4))
                {
                    Store (Local4, Local1)
                }
            }
            Store (Local0, Index (PBST, Zero))
            Store (Local1, Index (PBST, One))
            Store (Local2, Index (PBST, 0x02))
            Store (Arg3, Index (PBST, 0x03))
        }
        Method (BS_P, 1, Serialized)
        {
            Store (Zero, Index (PBST, Zero))
            Store (Ones, Index (PBST, One))
            Store (Ones, Index (PBST, 0x02))
            Store (Ones, Index (PBST, 0x03))
            If (LNot (BT_P (Arg0)))
            {
                Return (PBST)
            }
            If (LEqual (GB_T (Arg0), 0xFF))
            {
                Return (PBST)
            }
            If (LEqual (Acquire (MUBT, 0xFFFF), Zero))
            {
                BS_F (Arg0)
                Store (BS_T (), Local0)
                Store (BC_R (), Local1)
                Store (BR_C (), Local2)
                Store (BV_T (), Local3)
                If (LNotEqual (Local0, Ones))
                {
                    If (LNotEqual (Local1, Ones))
                    {
                        If (LNotEqual (Local2, Ones))
                        {
                            If (LNotEqual (Local3, Ones))
                            {
                                BS_C (Local0, Local1, Local2, Local3, Arg0)
                            }
                        }
                    }
                }
                Release (MUBT)
            }
            Divide (LFCC, 0x64, Local5, Local4)
            Store (BL_F (), Local5)
            If (LEqual (PUNT, Zero))
            {
                Multiply (Local5, 0x0A, Local5)
            }
            Else
            {
                Multiply (Local5, BD_V (), Local5)
                Divide (Local5, 0x03E8, Local0, Local5)
            }
            If (LGreaterEqual (LFCC, Local5))
            {
                Subtract (LFCC, Local5, Local5)
            }
            Else
            {
                Subtract (Local5, LFCC, Local5)
            }
            If (LGreater (Local5, Local4))
            {
                Notify (BAT0, 0x81)
            }
            Return (PBST)
        }
        Method (BI_X, 1, Serialized)
        {
            Store (BP_U (), Index (BIXP, One))
            Store (BD_C (), Index (BIXP, 0x02))
            Store (BL_F (), Index (BIXP, 0x03))
            Store (BT_C (), Index (BIXP, 0x04))
            Store (BD_V (), Index (BIXP, 0x05))
            If (BL_F ())
            {
                Store (Divide (BL_F (), 0x0A, ), Index (BIXP, 0x06))
                Store (Divide (BL_F (), 0x14, ), Index (BIXP, 0x07))
                Store (Divide (BD_C (), 0x64, ), Index (BIXP, 0x08))
                Store (Divide (BD_C (), 0x64, ), Index (BIXP, 0x0E))
                Store (Divide (BD_C (), 0x64, ), Index (BIXP, 0x0F))
                Store (BD_N (), Index (BIXP, 0x10))
                Store (0x40, Index (BIXP, 0x09))
            }
            Return (BIXP)
        }
    }
    Scope (_SB.PCI0)
    {
        Device (BAT0)
        {
            Name (_HID, EisaId ("PNP0C0A"))
            Name (_UID, Zero)
            Name (_PCL, Package (0x01)
            {
                PCI0
            })
            Method (_STA, 0, NotSerialized)
            {
                If (^^LPC0.EC0.BT_P (Zero))
                {
                    Store (^^LPC0.EC0.BT_P (Zero), DC_F)
                    Return (0x1F)
                }
                Else
                {
                    Return (0x0F)
                }
            }
            Method (_BIF, 0, Serialized)
            {
                Return (^^LPC0.EC0.BS_L (Zero))
            }
            Method (_BST, 0, NotSerialized)
            {
                Return (^^LPC0.EC0.BS_P (Zero))
            }
        }
    }
    Scope (_SB.PCI0.LPC0.EC0)
    {
        Method (_QA1, 0, NotSerialized)
        {
            If (DC_P (Zero))
            {
                Sleep (0x07D0)
            }
            Notify (BAT0, 0x80)
            Notify (BAT0, 0x81)
        }
        Method (NB_T, 1, NotSerialized)
        {
            If (BT_P (Zero))
            {
                Notify (BAT0, Arg0)
            }
        }
    }
    Scope (_SB.PCI0)
    {
        Device (AC0)
        {
            Name (_HID, "ACPI0003")
            Name (XX00, Buffer (0x03) {})
            Method (_STA, 0, NotSerialized)
            {
                Return (0x0F)
            }
            Method (_PSR, 0, NotSerialized)
            {
                Name (UTDP, Buffer (0x08) {})
                CreateWordField (UTDP, Zero, M254)
                CreateByteField (UTDP, 0x02, M255)
                CreateDWordField (UTDP, 0x03, M256)
                Store (0x07, M254)
                Store (0x05, M255)
                Store (0x7530, M256)
                ALIB (0x0C, UTDP)
                Store (0x06, M255)
                Store (0x7530, M256)
                ALIB (0x0C, UTDP)
                Store (0x07, M255)
                Store (0x7530, M256)
                ALIB (0x0C, UTDP)
                Store (0x03, M255)
                Store (0x5A, M256)
                ALIB (0x0C, UTDP)
                If (LNot (Acquire (^^LPC0.EC0.MUEC, 0x012C)))
                {
                    Store (^^LPC0.EC0.EPWS, Local0)
                    CreateWordField (XX00, Zero, SSZE)
                    CreateByteField (XX00, 0x02, ACST)
                    Store (0x03, SSZE)
                    If (LOr (LEqual (Local0, 0x03), LEqual (Local0, One)))
                    {
                        Store (0xECAC, P80H)
                        AFN4 (One)
                        Store (Zero, ACST)
                    }
                    Else
                    {
                        Store (0xECDC, P80H)
                        AFN4 (0x02)
                        Store (One, ACST)
                    }
                    ALIB (One, XX00)
                    Release (^^LPC0.EC0.MUEC)
                }
                Store (^^LPC0.EC0.AP_S (), AC_F)
                Return (^^LPC0.EC0.AP_S ())
            }
            Name (_PCL, Package (0x01)
            {
                PCI0
            })
        }
    }
    Scope (WMI0)
    {
        Method (WG_L, 5, NotSerialized)
        {
            AX_X (Arg0, Arg1, Arg2, Arg3, Arg4)
            BX_X (Arg0, Arg1, Arg2, Arg3, Arg4)
            EX_X (Arg0, Arg1, Arg2, Arg3, Arg4)
            FX_X (Arg0, Arg1, Arg2, Arg3, Arg4)
            GX_X (Arg0, Arg1, Arg2, Arg3, Arg4)
            JX_X (Arg0, Arg1, Arg2, Arg3, Arg4)
            KX_X (Arg0, Arg1, Arg2, Arg3, Arg4)
            LX_X (Arg0, Arg1, Arg2, Arg3, Arg4)
            WF_S (Arg0, Arg1, Arg2, Arg3, Arg4)
        }
    }
    Scope (WMI0)
    {
        Method (JX_X, 5, NotSerialized)
        {
            If (LNotEqual (Arg2, 0x62))
            {
                Return (Zero)
            }
            OperationRegion (JX_X, SystemMemory, Arg0, 0x08)
            Field (JX_X, DWordAcc, NoLock, Preserve)
            {
                MFUN,   16, 
                SFUN,   16, 
                LEN,    16, 
                SM62,   8, 
                EM62,   8
            }
            If (LEqual (Arg3, One))
            {
                J0_1 (Arg4)
            }
            Else
            {
                Store (One, EM62)
            }
            If (LEqual (EM62, Zero))
            {
                Store (0x80, SM62)
            }
            Else
            {
                Store (0x82, SM62)
            }
            Return (Zero)
        }
        Method (J0_1, 1, NotSerialized)
        {
            WSMI (Arg0)
        }
    }
    Scope (WMI0)
    {
        Method (KX_X, 5, NotSerialized)
        {
            If (LNotEqual (Arg2, 0x63))
            {
                Return (Zero)
            }
            OperationRegion (KX_X, SystemMemory, Arg0, 0x10)
            Field (KX_X, ByteAcc, NoLock, Preserve)
            {
                Offset (0x06), 
                SM63,   8, 
                EM63,   8
            }
            If (LEqual (Arg3, One))
            {
                K0_1 (Arg0)
            }
            Else
            {
                If (LEqual (Arg3, 0x02))
                {
                    K0_2 (Arg0, Arg4)
                }
                Else
                {
                    If (LEqual (Arg3, 0x03))
                    {
                        K0_3 (Arg0)
                    }
                    Else
                    {
                        If (LEqual (Arg3, 0x04))
                        {
                            K0_4 (Arg0)
                        }
                        Else
                        {
                            If (LEqual (Arg3, 0x05))
                            {
                                K0_5 (Arg0)
                            }
                            Else
                            {
                                If (LEqual (Arg3, 0x06))
                                {
                                    K0_6 (Arg0)
                                }
                                Else
                                {
                                    If (LEqual (Arg3, 0x07))
                                    {
                                        K0_7 (Arg0)
                                    }
                                    Else
                                    {
                                        If (LEqual (Arg3, 0x08))
                                        {
                                            K0_8 (Arg0)
                                        }
                                        Else
                                        {
                                            If (LEqual (Arg3, 0x09))
                                            {
                                                K0_9 (Arg0)
                                            }
                                            Else
                                            {
                                                If (LEqual (Arg3, 0x0A))
                                                {
                                                    K0_A (Arg0)
                                                }
                                                Else
                                                {
                                                    If (LEqual (Arg3, 0x0B))
                                                    {
                                                        K0_B (Arg0)
                                                    }
                                                    Else
                                                    {
                                                        If (LEqual (Arg3, 0x0C))
                                                        {
                                                            K0_C (Arg0)
                                                        }
                                                        Else
                                                        {
                                                            If (LEqual (Arg3, 0x0D))
                                                            {
                                                                K0_D (Arg0)
                                                            }
                                                            Else
                                                            {
                                                                If (LEqual (Arg3, 0x0E))
                                                                {
                                                                    K0_E (Arg0)
                                                                }
                                                                Else
                                                                {
                                                                    If (LEqual (Arg3, 0x0F))
                                                                    {
                                                                        K0_F (Arg0)
                                                                    }
                                                                    Else
                                                                    {
                                                                        Store (One, EM63)
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
            If (LEqual (EM63, Zero))
            {
                Store (0x80, SM63)
            }
            Else
            {
                Store (0x82, SM63)
            }
            Return (Zero)
        }
        Method (K0_1, 1, NotSerialized)
        {
            OperationRegion (KX_X, SystemMemory, Arg0, 0x10)
            Field (KX_X, ByteAcc, NoLock, Preserve)
            {
                Offset (0x06), 
                SM63,   8, 
                EM63,   8, 
                FUNC,   8, 
                TSXR,   8, 
                TSXL,   8
            }
            If (LEqual (FUNC, Zero))
            {
                Store (\_SB.PCI0.LPC0.EC0.RR_M (0x03E2), TSXR)
                Store (\_SB.PCI0.LPC0.EC0.RR_M (0x03E3), TSXL)
            }
            Else
            {
                If (LEqual (FUNC, One))
                {
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x03E0), TSXR)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x03E1), TSXL)
                }
                Else
                {
                    Store (One, EM63)
                }
            }
        }
        Method (K0_2, 2, NotSerialized)
        {
            OperationRegion (KX_X, SystemMemory, Arg0, 0x10)
            Field (KX_X, ByteAcc, NoLock, Preserve)
            {
                Offset (0x06), 
                SM63,   8, 
                EM63,   8, 
                DEVS,   8, 
                DEVT,   16
            }
            If (LEqual (DEVS, Zero))
            {
                WSMI (Arg1)
            }
            Else
            {
                If (LEqual (DEVS, One))
                {
                    Store (\_SB.PCI0.LPC0.EC0.PCPT, DEVT)
                }
                Else
                {
                    If (LEqual (DEVS, 0x02))
                    {
                        WSMI (Arg1)
                    }
                    Else
                    {
                        If (LEqual (DEVS, 0x03))
                        {
                            WSMI (Arg1)
                        }
                        Else
                        {
                            Store (One, EM63)
                        }
                    }
                }
            }
        }
        Method (K0_3, 1, NotSerialized)
        {
            OperationRegion (KX_X, SystemMemory, Arg0, 0x10)
            Field (KX_X, ByteAcc, NoLock, Preserve)
            {
                Offset (0x06), 
                SM63,   8, 
                EM63,   8, 
                FANX,   8, 
                FANS,   8, 
                FANT,   16, 
                TRGG,   8
            }
            If (LEqual (FANX, Zero))
            {
                Store (\_SB.PCI0.LPC0.EC0.F0CS, FANS)
                Store (\_SB.PCI0.LPC0.EC0.F0TS, FANT)
                Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0576), TRGG)
            }
            Else
            {
                If (LEqual (FANX, One))
                {
                    Store (\_SB.PCI0.LPC0.EC0.F1CS, FANS)
                    Store (\_SB.PCI0.LPC0.EC0.F1TS, FANT)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0577), TRGG)
                }
                Else
                {
                    Store (One, EM63)
                }
            }
        }
        Method (K0_4, 1, Serialized)
        {
            Name (_T_1, Zero)
            Name (_T_0, Zero)
            OperationRegion (KX_X, SystemMemory, Arg0, 0x10)
            Field (KX_X, ByteAcc, NoLock, Preserve)
            {
                Offset (0x06), 
                SM63,   8, 
                EM63,   8, 
                FUNC,   8, 
                PARA,   8, 
                DATA,   8
            }
            If (LEqual (FUNC, Zero))
            {
                While (One)
                {
                    Store (ToInteger (PARA), _T_0)
                    If (LEqual (_T_0, Zero))
                    {
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0521), DATA)
                    }
                    Else
                    {
                        If (LEqual (_T_0, One))
                        {
                            Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0522), DATA)
                        }
                        Else
                        {
                            If (LEqual (_T_0, 0x02))
                            {
                                Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0523), DATA)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x03))
                                {
                                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0524), DATA)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x04))
                                    {
                                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0518), DATA)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x05))
                                        {
                                            Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0519), DATA)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x06))
                                            {
                                                Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0568), DATA)
                                            }
                                            Else
                                            {
                                                Store (One, EM63)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                    }
                    Break
                }
            }
            Else
            {
                If (LEqual (FUNC, One))
                {
                    While (One)
                    {
                        Store (ToInteger (PARA), _T_1)
                        If (LEqual (_T_1, Zero))
                        {
                            \_SB.PCI0.LPC0.EC0.WR_M (0x0521, DATA)
                        }
                        Else
                        {
                            If (LEqual (_T_1, One))
                            {
                                \_SB.PCI0.LPC0.EC0.WR_M (0x0522, DATA)
                            }
                            Else
                            {
                                If (LEqual (_T_1, 0x02))
                                {
                                    \_SB.PCI0.LPC0.EC0.WR_M (0x0523, DATA)
                                }
                                Else
                                {
                                    If (LEqual (_T_1, 0x03))
                                    {
                                        \_SB.PCI0.LPC0.EC0.WR_M (0x0524, DATA)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_1, 0x04))
                                        {
                                            \_SB.PCI0.LPC0.EC0.WR_M (0x0518, DATA)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_1, 0x05))
                                            {
                                                \_SB.PCI0.LPC0.EC0.WR_M (0x0519, DATA)
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_1, 0x06))
                                                {
                                                    \_SB.PCI0.LPC0.EC0.WR_M (0x0568, DATA)
                                                }
                                                Else
                                                {
                                                    Store (One, EM63)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        Break
                    }
                }
                Else
                {
                    Store (One, EM63)
                }
            }
        }
        Method (K0_5, 1, NotSerialized)
        {
            OperationRegion (KX_X, SystemMemory, Arg0, 0x10)
            Field (KX_X, ByteAcc, NoLock, Preserve)
            {
                Offset (0x06), 
                SM63,   8, 
                EM63,   8, 
                FUNC,   8, 
                ECSD,   8, 
                OSSD,   8, 
                OSPV,   8, 
                THON,   8, 
                THOF,   8, 
                FNER,   8, 
                VGSD,   8
            }
            If (LEqual (FUNC, Zero))
            {
                Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0530), ECSD)
                Store (\_SB.PCI0.LPC0.EC0.RR_M (0x03E4), OSSD)
                Store (\_SB.PCI0.LPC0.EC0.RR_M (0x03E5), OSPV)
                Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0533), THON)
                Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0534), THOF)
                Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0535), FNER)
                Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0536), VGSD)
            }
            Else
            {
                If (LEqual (FUNC, One))
                {
                    \_SB.PCI0.LPC0.EC0.WR_M (0x0530, ECSD)
                    \_SB.PCI0.LPC0.EC0.WR_M (0x03E4, OSSD)
                    \_SB.PCI0.LPC0.EC0.WR_M (0x03E5, OSPV)
                    \_SB.PCI0.LPC0.EC0.WR_M (0x0533, THON)
                    \_SB.PCI0.LPC0.EC0.WR_M (0x0534, THOF)
                    \_SB.PCI0.LPC0.EC0.WR_M (0x0535, FNER)
                    \_SB.PCI0.LPC0.EC0.WR_M (0x0536, VGSD)
                }
                Else
                {
                    Store (One, EM63)
                }
            }
        }
        Method (K0_6, 1, NotSerialized)
        {
            OperationRegion (KX_X, SystemMemory, Arg0, 0x20)
            Field (KX_X, ByteAcc, NoLock, Preserve)
            {
                Offset (0x06), 
                SM63,   8, 
                EM63,   8, 
                FUNC,   8, 
                ALGM,   8, 
                TTS1,   8, 
                TTS2,   8, 
                TTS3,   8, 
                TTS4,   8, 
                TTS5,   8, 
                TTS6,   8, 
                TTS7,   8, 
                TTS8,   8, 
                TFFP,   8
            }
            If (LEqual (FUNC, Zero))
            {
                If (LEqual (ALGM, Zero))
                {
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0537), TTS1)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0538), TTS2)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0539), TTS3)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x053A), TTS4)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x053B), TTS5)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x053C), TTS6)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x053D), TTS7)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x053E), TTS8)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x053F), TFFP)
                }
                Else
                {
                    If (LEqual (ALGM, One))
                    {
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0597), TTS1)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0598), TTS2)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0599), TTS3)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x059A), TTS4)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x059B), TTS5)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x059C), TTS6)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x059D), TTS7)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x059E), TTS8)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x059F), TFFP)
                    }
                    Else
                    {
                        Store (One, EM63)
                    }
                }
            }
            Else
            {
                If (LEqual (FUNC, One))
                {
                    If (LEqual (ALGM, Zero))
                    {
                        \_SB.PCI0.LPC0.EC0.WR_M (0x0537, TTS1)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x0538, TTS2)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x0539, TTS3)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x053A, TTS4)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x053B, TTS5)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x053C, TTS6)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x053D, TTS7)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x053E, TTS8)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x053F, TFFP)
                    }
                    Else
                    {
                        If (LEqual (ALGM, One))
                        {
                            \_SB.PCI0.LPC0.EC0.WR_M (0x0597, TTS1)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x0598, TTS2)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x0599, TTS3)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x059A, TTS4)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x059B, TTS5)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x059C, TTS6)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x059D, TTS7)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x059E, TTS8)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x059F, TFFP)
                        }
                        Else
                        {
                            Store (One, EM63)
                        }
                    }
                }
                Else
                {
                    Store (One, EM63)
                }
            }
        }
        Method (K0_7, 1, NotSerialized)
        {
            OperationRegion (KX_X, SystemMemory, Arg0, 0x20)
            Field (KX_X, ByteAcc, NoLock, Preserve)
            {
                Offset (0x06), 
                SM63,   8, 
                EM63,   8, 
                FUNC,   8, 
                ALGM,   8, 
                TDA1,   8, 
                TDA2,   8, 
                TDA3,   8, 
                TDA4,   8, 
                TDA5,   8, 
                TDA6,   8, 
                TDA7,   8, 
                TDA8,   8
            }
            If (LEqual (FUNC, Zero))
            {
                If (LEqual (ALGM, Zero))
                {
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0548), TDA1)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0549), TDA2)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x054A), TDA3)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x054B), TDA4)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x054C), TDA5)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x054D), TDA6)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x054E), TDA7)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x054F), TDA8)
                }
                Else
                {
                    If (LEqual (ALGM, One))
                    {
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05A8), TDA1)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05A9), TDA2)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05AA), TDA3)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05AB), TDA4)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05AC), TDA5)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05AD), TDA6)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05AE), TDA7)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05AF), TDA8)
                    }
                    Else
                    {
                        Store (One, EM63)
                    }
                }
            }
            Else
            {
                If (LEqual (FUNC, One))
                {
                    If (LEqual (ALGM, Zero))
                    {
                        \_SB.PCI0.LPC0.EC0.WR_M (0x0548, TDA1)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x0549, TDA2)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x054A, TDA3)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x054B, TDA4)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x054C, TDA5)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x054D, TDA6)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x054E, TDA7)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x054F, TDA8)
                    }
                    Else
                    {
                        If (LEqual (ALGM, One))
                        {
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05A8, TDA1)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05A9, TDA2)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05AA, TDA3)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05AB, TDA4)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05AC, TDA5)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05AD, TDA6)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05AE, TDA7)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05AF, TDA8)
                        }
                        Else
                        {
                            Store (One, EM63)
                        }
                    }
                }
                Else
                {
                    Store (One, EM63)
                }
            }
        }
        Method (K0_8, 1, NotSerialized)
        {
            OperationRegion (KX_X, SystemMemory, Arg0, 0x20)
            Field (KX_X, ByteAcc, NoLock, Preserve)
            {
                Offset (0x06), 
                SM63,   8, 
                EM63,   8, 
                FUNC,   8, 
                ALGM,   8, 
                ASC1,   8, 
                ASC2,   8, 
                ASC3,   8, 
                ASC4,   8, 
                ADA1,   8, 
                ADA2,   8, 
                ADA3,   8, 
                ADA4,   8, 
                DSC1,   8, 
                DSC2,   8, 
                DSC3,   8, 
                DSC4,   8, 
                DDA1,   8, 
                DDA2,   8, 
                DDA3,   8, 
                DDA4,   8
            }
            If (LEqual (FUNC, Zero))
            {
                If (LEqual (ALGM, Zero))
                {
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0550), ASC1)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0551), ASC2)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0552), ASC3)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0553), ASC4)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0554), ADA1)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0555), ADA2)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0556), ADA3)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0557), ADA4)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0558), DSC1)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0559), DSC2)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x055A), DSC3)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x055B), DSC4)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x055C), DDA1)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x055D), DDA2)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x055E), DDA3)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x055F), DDA4)
                }
                Else
                {
                    If (LEqual (ALGM, One))
                    {
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05B0), ASC1)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05B1), ASC2)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05B2), ASC3)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05B3), ASC4)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05B4), ADA1)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05B5), ADA2)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05B6), ADA3)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05B7), ADA4)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05B8), DSC1)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05B9), DSC2)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05BA), DSC3)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05BB), DSC4)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05BC), DDA1)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05BD), DDA2)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05BE), DDA3)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05BF), DDA4)
                    }
                    Else
                    {
                        Store (One, EM63)
                    }
                }
            }
            Else
            {
                If (LEqual (FUNC, One))
                {
                    If (LEqual (ALGM, Zero))
                    {
                        \_SB.PCI0.LPC0.EC0.WR_M (0x0550, ASC1)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x0551, ASC2)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x0552, ASC3)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x0553, ASC4)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x0554, ADA1)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x0555, ADA2)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x0556, ADA3)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x0557, ADA4)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x0558, DSC1)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x0559, DSC2)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x055A, DSC3)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x055B, DSC4)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x055C, DDA1)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x055D, DDA2)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x055E, DDA3)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x055F, DDA4)
                    }
                    Else
                    {
                        If (LEqual (ALGM, One))
                        {
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05B0, ASC1)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05B1, ASC2)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05B2, ASC3)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05B3, ASC4)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05B4, ADA1)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05B5, ADA2)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05B6, ADA3)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05B7, ADA4)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05B8, DSC1)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05B9, DSC2)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05BA, DSC3)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05BB, DSC4)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05BC, DDA1)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05BD, DDA2)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05BE, DDA3)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05BF, DDA4)
                        }
                        Else
                        {
                            Store (One, EM63)
                        }
                    }
                }
                Else
                {
                    Store (One, EM63)
                }
            }
        }
        Method (K0_9, 1, NotSerialized)
        {
            OperationRegion (KX_X, SystemMemory, Arg0, 0x20)
            Field (KX_X, ByteAcc, NoLock, Preserve)
            {
                Offset (0x06), 
                SM63,   8, 
                EM63,   8, 
                FUNC,   8, 
                ALGM,   8, 
                HYS1,   8, 
                HYS2,   8, 
                HYS3,   8, 
                HYS4,   8, 
                HYS5,   8, 
                HYS6,   8, 
                HYS7,   8, 
                HYS8,   8
            }
            If (LEqual (FUNC, Zero))
            {
                If (LEqual (ALGM, Zero))
                {
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0540), HYS1)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0541), HYS2)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0542), HYS3)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0543), HYS4)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0544), HYS5)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0545), HYS6)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0546), HYS7)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0547), HYS8)
                }
                Else
                {
                    If (LEqual (ALGM, One))
                    {
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05A0), HYS1)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05A1), HYS2)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05A2), HYS3)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05A3), HYS4)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05A4), HYS5)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05A5), HYS6)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05A6), HYS7)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05A7), HYS8)
                    }
                    Else
                    {
                        Store (One, EM63)
                    }
                }
            }
            Else
            {
                If (LEqual (FUNC, One))
                {
                    If (LEqual (ALGM, Zero))
                    {
                        \_SB.PCI0.LPC0.EC0.WR_M (0x0540, HYS1)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x0541, HYS2)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x0542, HYS3)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x0543, HYS4)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x0544, HYS5)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x0545, HYS6)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x0546, HYS7)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x0547, HYS8)
                    }
                    Else
                    {
                        If (LEqual (ALGM, One))
                        {
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05A0, HYS1)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05A1, HYS2)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05A2, HYS3)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05A3, HYS4)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05A4, HYS5)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05A5, HYS6)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05A6, HYS7)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05A7, HYS8)
                        }
                        Else
                        {
                            Store (One, EM63)
                        }
                    }
                }
                Else
                {
                    Store (One, EM63)
                }
            }
        }
        Method (K0_A, 1, NotSerialized)
        {
            OperationRegion (KX_X, SystemMemory, Arg0, 0x20)
            Field (KX_X, ByteAcc, NoLock, Preserve)
            {
                Offset (0x06), 
                SM63,   8, 
                EM63,   8, 
                FUNC,   8, 
                FANX,   8, 
                TA1L,   8, 
                TA1H,   8, 
                TA2L,   8, 
                TA2H,   8, 
                TA3L,   8, 
                TA3H,   8, 
                TA4L,   8, 
                TA4H,   8, 
                TA5L,   8, 
                TA5H,   8, 
                TA6L,   8, 
                TA6H,   8, 
                TA7L,   8, 
                TA7H,   8, 
                TA8L,   8, 
                TA8H,   8
            }
            If (LEqual (FUNC, Zero))
            {
                If (LEqual (FANX, Zero))
                {
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05C0), TA1L)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05C1), TA1H)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05C2), TA2L)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05C3), TA2H)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05C4), TA3L)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05C5), TA3H)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05C6), TA4L)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05C7), TA4H)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05C8), TA5L)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05C9), TA5H)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05CA), TA6L)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05CB), TA6H)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05CC), TA7L)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05CD), TA7H)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05CE), TA8L)
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05CF), TA8H)
                }
                Else
                {
                    If (LEqual (FANX, One))
                    {
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05D0), TA1L)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05D1), TA1H)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05D2), TA2L)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05D3), TA2H)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05D4), TA3L)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05D5), TA3H)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05D6), TA4L)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05D7), TA4H)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05D8), TA5L)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05D9), TA5H)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05DA), TA6L)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05DB), TA6H)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05DC), TA7L)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05DD), TA7H)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05DE), TA8L)
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x05DF), TA8H)
                    }
                    Else
                    {
                        Store (One, EM63)
                    }
                }
            }
            Else
            {
                If (LEqual (FUNC, One))
                {
                    If (LEqual (FANX, Zero))
                    {
                        \_SB.PCI0.LPC0.EC0.WR_M (0x05C0, TA1L)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x05C1, TA1H)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x05C2, TA2L)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x05C3, TA2H)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x05C4, TA3L)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x05C5, TA3H)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x05C6, TA4L)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x05C7, TA4H)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x05C8, TA5L)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x05C9, TA5H)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x05CA, TA6L)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x05CB, TA6H)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x05CC, TA7L)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x05CD, TA7H)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x05CE, TA8L)
                        \_SB.PCI0.LPC0.EC0.WR_M (0x05CF, TA8H)
                    }
                    Else
                    {
                        If (LEqual (FANX, One))
                        {
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05D0, TA1L)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05D1, TA1H)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05D2, TA2L)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05D3, TA2H)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05D4, TA3L)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05D5, TA3H)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05D6, TA4L)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05D7, TA4H)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05D8, TA5L)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05D9, TA5H)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05DA, TA6L)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05DB, TA6H)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05DC, TA7L)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05DD, TA7H)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05DE, TA8L)
                            \_SB.PCI0.LPC0.EC0.WR_M (0x05DF, TA8H)
                        }
                        Else
                        {
                            Store (One, EM63)
                        }
                    }
                }
                Else
                {
                    Store (One, EM63)
                }
            }
        }
        Method (K0_B, 1, NotSerialized)
        {
            OperationRegion (KX_X, SystemMemory, Arg0, 0x20)
            Field (KX_X, ByteAcc, NoLock, Preserve)
            {
                Offset (0x06), 
                SM63,   8, 
                EM63,   8, 
                FUNC,   8, 
                PARA,   8, 
                DATA,   8
            }
            If (LEqual (FUNC, Zero))
            {
                If (LEqual (PARA, Zero))
                {
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0569), DATA)
                }
                Else
                {
                    If (LEqual (PARA, One))
                    {
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x056A), DATA)
                    }
                    Else
                    {
                        Store (One, EM63)
                    }
                }
            }
            Else
            {
                If (LEqual (FUNC, One))
                {
                    If (LEqual (PARA, Zero))
                    {
                        \_SB.PCI0.LPC0.EC0.WR_M (0x0569, DATA)
                    }
                    Else
                    {
                        If (LEqual (PARA, One))
                        {
                            \_SB.PCI0.LPC0.EC0.WR_M (0x056A, DATA)
                        }
                        Else
                        {
                            Store (One, EM63)
                        }
                    }
                }
                Else
                {
                    Store (One, EM63)
                }
            }
        }
        Method (K0_C, 1, NotSerialized)
        {
            OperationRegion (KX_X, SystemMemory, Arg0, 0x20)
            Field (KX_X, ByteAcc, NoLock, Preserve)
            {
                Offset (0x06), 
                SM63,   8, 
                EM63,   8, 
                FUNC,   8, 
                DATA,   8
            }
            If (LEqual (FUNC, Zero))
            {
                Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0511), DATA)
            }
            Else
            {
                If (LEqual (FUNC, One))
                {
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0512), DATA)
                }
                Else
                {
                    If (LEqual (FUNC, 0x02))
                    {
                        Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0513), DATA)
                    }
                    Else
                    {
                        Store (One, EM63)
                    }
                }
            }
        }
        Method (K0_D, 1, NotSerialized)
        {
            OperationRegion (KX_X, SystemMemory, Arg0, 0x10)
            Field (KX_X, ByteAcc, NoLock, Preserve)
            {
                Offset (0x06), 
                SM63,   8, 
                EM63,   8, 
                FUNC,   8, 
                FREQ,   16
            }
            If (LEqual (FUNC, Zero))
            {
                Store (0x017D7840, Local0)
                Store (\_SB.PCI0.LPC0.EC0.RR_M (0xF4A0), Local1)
                Add (Local1, One, Local1)
                Store (\_SB.PCI0.LPC0.EC0.RR_M (0xF4A2), Local2)
                Add (Local2, One, Local2)
                Multiply (Local2, Local1, Local2)
                Divide (Local0, Local2, Local3, Local1)
                Store (Local1, FREQ)
            }
            Else
            {
                If (LEqual (FUNC, One))
                {
                    Store (Zero, FREQ)
                }
                Else
                {
                    Store (One, EM63)
                }
            }
        }
        Method (K0_E, 1, NotSerialized)
        {
            OperationRegion (KX_X, SystemMemory, Arg0, 0x10)
            Field (KX_X, ByteAcc, NoLock, Preserve)
            {
                Offset (0x06), 
                SM63,   8, 
                EM63,   8, 
                FUNC,   8, 
                FANX,   8, 
                FAND,   8
            }
            If (LEqual (FUNC, Zero))
            {
                If (LEqual (FANX, Zero))
                {
                    Store (\_SB.PCI0.LPC0.EC0.RF_O (Zero), FAND)
                }
                Else
                {
                    If (LEqual (FANX, One))
                    {
                        Store (\_SB.PCI0.LPC0.EC0.RF_O (One), FAND)
                    }
                    Else
                    {
                        Store (One, EM63)
                    }
                }
            }
            Else
            {
                If (LEqual (FUNC, One))
                {
                    If (LEqual (FANX, Zero))
                    {
                        \_SB.PCI0.LPC0.EC0.WF_O (Zero, FAND)
                    }
                    Else
                    {
                        If (LEqual (FANX, One))
                        {
                            \_SB.PCI0.LPC0.EC0.WF_O (One, FAND)
                        }
                        Else
                        {
                            Store (One, EM63)
                        }
                    }
                }
                Else
                {
                    Store (One, EM63)
                }
            }
        }
        Method (K0_F, 1, NotSerialized)
        {
            OperationRegion (KX_X, SystemMemory, Arg0, 0x10)
            Field (KX_X, ByteAcc, NoLock, Preserve)
            {
                Offset (0x06), 
                SM63,   8, 
                EM63,   8, 
                FUNC,   8, 
                FANX,   8, 
                DIFF,   8
            }
            If (LEqual (FUNC, Zero))
            {
                If (LEqual (FANX, Zero))
                {
                    Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0564), DIFF)
                }
                Else
                {
                    If (LEqual (FANX, One))
                    {
                        Store (0xFF, DIFF)
                    }
                    Else
                    {
                        Store (One, EM63)
                    }
                }
            }
            Else
            {
                If (LEqual (FUNC, One))
                {
                    If (LEqual (FANX, Zero))
                    {
                        \_SB.PCI0.LPC0.EC0.WR_M (0x0564, DIFF)
                    }
                    Else
                    {
                        If (LEqual (FANX, One)) {}
                        Else
                        {
                            Store (One, EM63)
                        }
                    }
                }
                Else
                {
                    Store (One, EM63)
                }
            }
        }
    }
    Scope (WMI0)
    {
        Method (LX_X, 5, NotSerialized)
        {
            If (LNotEqual (Arg2, 0x64))
            {
                Return (Zero)
            }
            WSMI (Arg4)
            Return (Zero)
        }
    }
    Scope (WMI0)
    {
        Method (GX_X, 5, NotSerialized)
        {
            If (LNotEqual (Arg2, 0x30))
            {
                Return (Zero)
            }
            OperationRegion (GX_X, SystemMemory, Arg0, 0x08)
            Field (GX_X, DWordAcc, NoLock, Preserve)
            {
                Offset (0x06), 
                SM30,   8, 
                EM30,   8
            }
            If (LEqual (Arg3, One))
            {
                Store (G0_1 (Arg0), EM30)
            }
            Else
            {
                If (LEqual (Arg3, 0x02))
                {
                    Store (G0_2 (Arg0), EM30)
                }
                Else
                {
                    If (LEqual (Arg3, 0x83))
                    {
                        Store (G8_3 (Arg0), EM30)
                    }
                    Else
                    {
                        If (LEqual (Arg3, 0x84))
                        {
                            Store (G8_4 (Arg0), EM30)
                        }
                        Else
                        {
                            If (LEqual (Arg3, 0x80))
                            {
                                G8_0 (Arg0)
                                Store (Zero, EM30)
                            }
                            Else
                            {
                                If (LEqual (Arg3, 0x81))
                                {
                                    G8_1 (Arg0)
                                    Store (Zero, EM30)
                                }
                                Else
                                {
                                    If (LEqual (Arg3, 0x82))
                                    {
                                        G8_2 (Arg0)
                                        Store (Zero, EM30)
                                    }
                                    Else
                                    {
                                        Store (One, EM30)
                                    }
                                }
                            }
                        }
                    }
                }
            }
            If (LEqual (EM30, Zero))
            {
                Store (0x80, SM30)
            }
            Else
            {
                Store (0x82, SM30)
            }
            Return (Zero)
        }
        Method (G0_1, 1, NotSerialized)
        {
            OperationRegion (GX_X, SystemMemory, Arg0, 0x10)
            Field (GX_X, DWordAcc, NoLock, Preserve)
            {
                Offset (0x08), 
                ECMD,   8, 
                EDA1,   8, 
                EDA2,   8, 
                EDA3,   8, 
                EDA4,   8, 
                EDA5,   8
            }
            Store (\_SB.PCI0.LPC0.EC0.EX_T (ECMD, EDA1, EDA2, EDA3, EDA4, EDA5), Local0)
            Store (DerefOf (Index (Local0, One)), EDA1)
            Store (DerefOf (Index (Local0, 0x02)), EDA2)
            Store (DerefOf (Index (Local0, 0x03)), EDA3)
            Store (DerefOf (Index (Local0, 0x04)), EDA4)
            Store (DerefOf (Index (Local0, 0x05)), EDA5)
            Return (DerefOf (Index (Local0, Zero)))
        }
        Method (G0_2, 1, NotSerialized)
        {
            OperationRegion (GX_X, SystemMemory, Arg0, 0x30)
            Field (GX_X, DWordAcc, NoLock, Preserve)
            {
                Offset (0x06), 
                SM30,   8, 
                EM30,   8, 
                BUSN,   8, 
                PROT,   8, 
                DADD,   8, 
                DREG,   8, 
                DAT0,   8, 
                DAT1,   8, 
                BLEN,   8, 
                REVB,   8, 
                BLK1,   32, 
                BLK2,   32, 
                BLK3,   32, 
                BLK4,   32, 
                BLK5,   32, 
                BLK6,   32, 
                BLK7,   32, 
                BLK8,   32
            }
            Store (\_SB.PCI0.LPC0.EC0.ES_M (BUSN, PROT, DADD, DREG, DAT0, DAT1), Local0)
            Store (DerefOf (Index (Local0, One)), DAT0)
            Store (DerefOf (Index (Local0, 0x02)), DAT1)
            Store (DerefOf (Index (Local0, 0x03)), BLEN)
            Name (BKUF, Buffer (0x20) {})
            CreateDWordField (BKUF, Zero, DD01)
            CreateDWordField (BKUF, 0x04, DD02)
            CreateDWordField (BKUF, 0x08, DD03)
            CreateDWordField (BKUF, 0x0C, DD04)
            CreateDWordField (BKUF, 0x10, DD05)
            CreateDWordField (BKUF, 0x14, DD06)
            CreateDWordField (BKUF, 0x18, DD07)
            CreateDWordField (BKUF, 0x1C, DD08)
            Store (DerefOf (Index (Local0, 0x04)), BKUF)
            Store (DD01, BLK1)
            Store (DD02, BLK2)
            Store (DD03, BLK3)
            Store (DD04, BLK4)
            Store (DD05, BLK5)
            Store (DD06, BLK6)
            Store (DD07, BLK7)
            Store (DD08, BLK8)
            Store (DerefOf (Index (Local0, Zero)), Local2)
            And (Local2, 0x3F, Local2)
            Return (Local2)
        }
        Method (G8_4, 1, NotSerialized)
        {
            OperationRegion (GX_X, SystemMemory, Arg0, 0x10)
            Field (GX_X, DWordAcc, NoLock, Preserve)
            {
                Offset (0x08), 
                EVTP,   8, 
                EVID,   8
            }
            \_SB.PCI0.LPC0.EC0.EX_T (0xAE, EVTP, EVID, Zero, Zero, Zero)
            Return (Zero)
        }
        Method (G8_3, 1, NotSerialized)
        {
            OperationRegion (ECGC, SystemMemory, Arg0, 0x10)
            Field (ECGC, DWordAcc, NoLock, Preserve)
            {
                Offset (0x06), 
                SM1X,   8, 
                EM1X,   8, 
                FUNC,   8, 
                PORT,   8, 
                PIND,   8, 
                DATA,   8
            }
            If (LEqual (FUNC, Zero))
            {
                Store (\_SB.PCI0.LPC0.EC0.RP_N (PORT, PIND), DATA)
            }
            Else
            {
                If (LEqual (FUNC, One))
                {
                    \_SB.PCI0.LPC0.EC0.SP_N (PORT, PIND, DATA)
                }
                Else
                {
                    Return (One)
                }
            }
            Return (Zero)
        }
        Method (G8_0, 1, NotSerialized)
        {
            OperationRegion (GX_X, SystemMemory, Arg0, 0x20)
            Field (GX_X, DWordAcc, NoLock, Preserve)
            {
                Offset (0x08), 
                EFUN,   8
            }
            \_SB.PCI0.LPC0.EC0.WE_I ()
            Store (0xA7, \_SB.PCI0.LPC0.EC0.AEIC)
            \_SB.PCI0.LPC0.EC0.WE_I ()
            Store (Zero, \_SB.PCI0.LPC0.EC0.AEID)
            \_SB.PCI0.LPC0.EC0.WE_I ()
            Store (EFUN, \_SB.PCI0.LPC0.EC0.AEID)
        }
        Method (G8_1, 1, NotSerialized)
        {
            OperationRegion (GX_X, SystemMemory, Arg0, 0x20)
            Field (GX_X, DWordAcc, NoLock, Preserve)
            {
                Offset (0x08), 
                EFUN,   8, 
                BATT,   8, 
                WRNT,   8
            }
            Store (Zero, Local0)
            \_SB.PCI0.LPC0.EC0.WE_I ()
            Store (0x80, \_SB.PCI0.LPC0.EC0.AEIC)
            \_SB.PCI0.LPC0.EC0.WE_I ()
            Store (0x06, \_SB.PCI0.LPC0.EC0.AEID)
            \_SB.PCI0.LPC0.EC0.WE_I ()
            Store (0x20, \_SB.PCI0.LPC0.EC0.AEID)
            \_SB.PCI0.LPC0.EC0.WE_O ()
            Store (\_SB.PCI0.LPC0.EC0.AEID, Local0)
            If (LEqual (EFUN, One))
            {
                Or (Local0, 0x80, Local0)
                \_SB.PCI0.LPC0.EC0.WE_I ()
                Store (0x81, \_SB.PCI0.LPC0.EC0.AEIC)
                \_SB.PCI0.LPC0.EC0.WE_I ()
                Store (0x06, \_SB.PCI0.LPC0.EC0.AEID)
                \_SB.PCI0.LPC0.EC0.WE_I ()
                Store (0x20, \_SB.PCI0.LPC0.EC0.AEID)
                \_SB.PCI0.LPC0.EC0.WE_I ()
                Store (Local0, \_SB.PCI0.LPC0.EC0.AEID)
                \_SB.PCI0.LPC0.EC0.WE_O ()
                Store (Local0, WRNT)
            }
            Else
            {
                If (LEqual (EFUN, Zero))
                {
                    And (Local0, 0x7F, Local0)
                    \_SB.PCI0.LPC0.EC0.WE_I ()
                    Store (0x81, \_SB.PCI0.LPC0.EC0.AEIC)
                    \_SB.PCI0.LPC0.EC0.WE_I ()
                    Store (0x06, \_SB.PCI0.LPC0.EC0.AEID)
                    \_SB.PCI0.LPC0.EC0.WE_I ()
                    Store (0x20, \_SB.PCI0.LPC0.EC0.AEID)
                    \_SB.PCI0.LPC0.EC0.WE_I ()
                    Store (Local0, \_SB.PCI0.LPC0.EC0.AEID)
                    \_SB.PCI0.LPC0.EC0.WE_O ()
                    Store (Local0, WRNT)
                }
            }
        }
        Method (G8_2, 1, NotSerialized)
        {
            OperationRegion (GX_X, SystemMemory, Arg0, 0x20)
            Field (GX_X, DWordAcc, NoLock, Preserve)
            {
                Offset (0x08), 
                EFUN,   8, 
                WRNT,   8
            }
            Store (Zero, Local0)
            \_SB.PCI0.LPC0.EC0.WE_I ()
            Store (0x80, \_SB.PCI0.LPC0.EC0.AEIC)
            \_SB.PCI0.LPC0.EC0.WE_I ()
            Store (0x05, \_SB.PCI0.LPC0.EC0.AEID)
            \_SB.PCI0.LPC0.EC0.WE_I ()
            Store (0x20, \_SB.PCI0.LPC0.EC0.AEID)
            \_SB.PCI0.LPC0.EC0.WE_O ()
            Store (\_SB.PCI0.LPC0.EC0.AEID, Local0)
            If (LEqual (EFUN, One))
            {
                Or (Local0, 0x80, Local0)
                \_SB.PCI0.LPC0.EC0.WE_I ()
                Store (0x81, \_SB.PCI0.LPC0.EC0.AEIC)
                \_SB.PCI0.LPC0.EC0.WE_I ()
                Store (0x05, \_SB.PCI0.LPC0.EC0.AEID)
                \_SB.PCI0.LPC0.EC0.WE_I ()
                Store (0x20, \_SB.PCI0.LPC0.EC0.AEID)
                \_SB.PCI0.LPC0.EC0.WE_I ()
                Store (Local0, \_SB.PCI0.LPC0.EC0.AEID)
                \_SB.PCI0.LPC0.EC0.WE_O ()
                Store (Local0, WRNT)
            }
            Else
            {
                If (LEqual (EFUN, Zero))
                {
                    And (Local0, 0x7F, Local0)
                    \_SB.PCI0.LPC0.EC0.WE_I ()
                    Store (0x81, \_SB.PCI0.LPC0.EC0.AEIC)
                    \_SB.PCI0.LPC0.EC0.WE_I ()
                    Store (0x05, \_SB.PCI0.LPC0.EC0.AEID)
                    \_SB.PCI0.LPC0.EC0.WE_I ()
                    Store (0x20, \_SB.PCI0.LPC0.EC0.AEID)
                    \_SB.PCI0.LPC0.EC0.WE_I ()
                    Store (Local0, \_SB.PCI0.LPC0.EC0.AEID)
                    \_SB.PCI0.LPC0.EC0.WE_O ()
                    Store (Local0, WRNT)
                }
            }
        }
    }
    Scope (WMI0)
    {
        Method (AX_X, 5, NotSerialized)
        {
            OperationRegion (AX_X, SystemMemory, Arg0, 0x08)
            Field (AX_X, DWordAcc, NoLock, Preserve)
            {
                Offset (0x06), 
                SM10,   8, 
                EM10,   8
            }
            If (LNotEqual (Arg2, 0x10))
            {
                Return (Zero)
            }
            If (LEqual (Arg3, One))
            {
                A0_1 (Arg0)
                Store (Zero, EM10)
            }
            Else
            {
                Store (One, EM10)
            }
            If (LEqual (EM10, Zero))
            {
                Store (0x80, SM10)
            }
            Else
            {
                Store (0x82, SM10)
            }
            Return (Zero)
        }
        Method (A0_1, 1, NotSerialized)
        {
            OperationRegion (AX_X, SystemMemory, Arg0, 0x10)
            Field (AX_X, DWordAcc, NoLock, Preserve)
            {
                Offset (0x08), 
                DLTM,   16
            }
            Store (DLTM, RT_W)
        }
    }
    Scope (WMI0)
    {
        Method (BX_X, 5, NotSerialized)
        {
            OperationRegion (BX_X, SystemMemory, Arg0, 0x08)
            Field (BX_X, DWordAcc, NoLock, Preserve)
            {
                Offset (0x06), 
                SM11,   8, 
                EM11,   8
            }
            If (LNotEqual (Arg2, 0x11))
            {
                Return (Zero)
            }
            If (LEqual (Arg3, 0x02))
            {
                B0_2 (Arg0, Arg3)
                Store (Zero, EM11)
            }
            Else
            {
                If (LEqual (Arg3, 0x04))
                {
                    B0_4 (Arg0)
                    Store (Zero, EM11)
                }
                Else
                {
                    If (LEqual (Arg3, 0x82))
                    {
                        B8_2 (Arg0)
                    }
                    Else
                    {
                        Store (One, EM11)
                    }
                }
            }
            If (LEqual (EM11, Zero))
            {
                Store (0x80, SM11)
            }
            Else
            {
                Store (0x82, SM11)
            }
            Return (Zero)
        }
        Method (B0_2, 2, NotSerialized)
        {
            OperationRegion (BX_X, SystemMemory, Arg0, 0x30)
            Field (BX_X, DWordAcc, NoLock, Preserve)
            {
                Offset (0x08), 
                BATN,   8, 
                BATA,   8, 
                REGS,   8, 
                BDAT,   16, 
                BLEN,   8, 
                BREV,   16, 
                BLK1,   32, 
                BLK2,   32, 
                BLK3,   32, 
                BLK4,   32, 
                BLK5,   32, 
                BLK6,   32, 
                BLK7,   32, 
                BLK8,   32
            }
            If (LGreaterEqual (BATN, One))
            {
                Return (0x11)
            }
            If (LEqual (BATA, Zero))
            {
                Store (\_SB.PCI0.LPC0.EC0.SR_T (\_SB.PCI0.LPC0.EC0.RDWD, \_SB.PCI0.LPC0.EC0.BADR, REGS), Local0)
                Store (DerefOf (Index (Local0, 0x02)), BDAT)
                Store (DerefOf (Index (Local0, Zero)), Local2)
                And (Local2, 0x1F, Local2)
                If (Local2)
                {
                    Add (Local2, 0x10, Local2)
                }
                Return (Local2)
            }
            If (LEqual (BATA, One))
            {
                Store (\_SB.PCI0.LPC0.EC0.SW_T (\_SB.PCI0.LPC0.EC0.WRWD, \_SB.PCI0.LPC0.EC0.BADR, REGS, 0x02, BDAT), Local0)
                Store (DerefOf (Index (Local0, Zero)), Local2)
                And (Local2, 0x1F, Local2)
                If (Local2)
                {
                    Add (Local2, 0x10, Local2)
                }
                Return (Local2)
            }
            If (LEqual (BATA, 0x02))
            {
                Name (BKUF, Buffer (0x20) {})
                Store (\_SB.PCI0.LPC0.EC0.SR_T (\_SB.PCI0.LPC0.EC0.RDBL, \_SB.PCI0.LPC0.EC0.BADR, REGS), Local0)
                Store (DerefOf (Index (Local0, 0x02)), BKUF)
                Store (DerefOf (Index (Local0, One)), BLEN)
                Store (DerefOf (Index (Local0, Zero)), Local2)
                CreateDWordField (BKUF, One, DAT1)
                CreateDWordField (BKUF, 0x05, DAT2)
                CreateDWordField (BKUF, 0x09, DAT3)
                CreateDWordField (BKUF, 0x0D, DAT4)
                CreateDWordField (BKUF, 0x11, DAT5)
                CreateDWordField (BKUF, 0x15, DAT6)
                CreateDWordField (BKUF, 0x19, DAT7)
                Store (DerefOf (Index (Local0, 0x02)), BKUF)
                Store (DAT1, BLK1)
                Store (DAT2, BLK2)
                Store (DAT3, BLK3)
                Store (DAT4, BLK4)
                Store (DAT5, BLK5)
                Store (DAT6, BLK6)
                Store (DAT7, BLK7)
                Store (Zero, BLK8)
                Store (DerefOf (Index (Local0, One)), BLEN)
                Store (DerefOf (Index (Local0, Zero)), Local2)
                And (Local2, 0x1F, Local2)
                If (Local2)
                {
                    Add (Local2, 0x10, Local2)
                }
                Return (Local2)
            }
            Return (0x10)
        }
        Method (B0_4, 1, NotSerialized)
        {
            OperationRegion (BX_X, SystemMemory, Arg0, 0x10)
            Field (BX_X, DWordAcc, NoLock, Preserve)
            {
                Offset (0x06), 
                SM11,   8, 
                EM11,   8, 
                ENBC,   8
            }
            H0_0 (ENBC)
        }
        Method (B8_2, 1, NotSerialized)
        {
            OperationRegion (BX_X, SystemMemory, Arg0, 0x10)
            Field (BX_X, DWordAcc, NoLock, Preserve)
            {
                Offset (0x06), 
                SM11,   8, 
                EM11,   8, 
                ENDI,   8
            }
            If (LEqual (ENDI, One))
            {
                H0_1 ()
            }
            Else
            {
                Store (One, EM11)
            }
        }
    }
    Scope (WMI0)
    {
        Method (EX_X, 5, NotSerialized)
        {
            OperationRegion (EX_X, SystemMemory, Arg0, 0x08)
            Field (EX_X, DWordAcc, NoLock, Preserve)
            {
                Offset (0x06), 
                SM17,   8, 
                EM17,   8
            }
            If (LNotEqual (Arg2, 0x17))
            {
                Return (Zero)
            }
            If (LEqual (Arg3, 0x03))
            {
                E0_3 (Arg0)
                Store (Zero, EM17)
            }
            Else
            {
                Store (One, EM17)
            }
            If (LEqual (EM17, Zero))
            {
                Store (0x80, SM17)
            }
            Else
            {
                Store (0x82, SM17)
            }
            Return (Zero)
        }
        Method (E0_3, 1, NotSerialized)
        {
            OperationRegion (EX_X, SystemMemory, Arg0, 0x20)
            Field (EX_X, ByteAcc, NoLock, Preserve)
            {
                Offset (0x08), 
                ELEN,   8, 
                ECVR,   128
            }
            \_SB.PCI0.LPC0.EC0.WE_I ()
            Store (0x88, \_SB.PCI0.LPC0.EC0.AEIC)
            Store (Zero, Local0)
            Store (Zero, Local1)
            Store (Zero, Local2)
            Name (ECBF, Buffer (0x10) {})
            While (One)
            {
                \_SB.PCI0.LPC0.EC0.WE_O ()
                Store (\_SB.PCI0.LPC0.EC0.AEID, Local1)
                If (LNotEqual (Local1, Zero))
                {
                    Store (Local1, Index (ECBF, Local0))
                    Add (Local0, One, Local0)
                }
                If (LEqual (Local2, 0x10))
                {
                    Break
                }
                Add (Local2, One, Local2)
            }
            Store (Local0, ELEN)
            Store (ECBF, ECVR)
        }
    }
    Scope (WMI0)
    {
        Method (FX_X, 5, NotSerialized)
        {
            If (LEqual (Arg2, 0x1F))
            {
                OperationRegion (FX_X, SystemMemory, Arg0, 0x08)
                Field (FX_X, DWordAcc, NoLock, Preserve)
                {
                    MFUN,   16, 
                    SFUN,   16, 
                    LEN,    16, 
                    STAS,   8, 
                    EROR,   8
                }
                WSMI (Arg4)
                And (STAS, 0xFE, STAS)
            }
        }
    }
    Scope (WMI0)
    {
        Method (FS_M, 1, NotSerialized)
        {
            Store (Arg0, FS_F)
            Or (Arg0, 0xA0, Local0)
            ISMI (0xDC)
            Return (FS_T)
        }
        Method (WF_S, 5, Serialized)
        {
            If (LEqual (Arg2, 0x66))
            {
                If (LEqual (Arg3, One))
                {
                    OperationRegion (WFLS, SystemMemory, Arg0, 0x0100)
                    Field (WFLS, DWordAcc, NoLock, Preserve)
                    {
                        Offset (0x06), 
                        STAS,   8, 
                        REST,   8, 
                        FS_F,   8, 
                        FS_T,   16, 
                        FA_D,   32, 
                        FS_Z,   16
                    }
                    And (STAS, 0xFE, STAS)
                    Or (STAS, 0x80, STAS)
                    Store (0xDC, TT_P)
                    Store (FS_F, \FS_F)
                    Store (FS_T, \FS_T)
                    Store (FA_D, \FA_D)
                    Store (FS_Z, \FS_Z)
                    If (LEqual (FS_F, One))
                    {
                        Store (Arg1, \FA_D)
                    }
                    Else
                    {
                        If (LEqual (FS_F, 0x80))
                        {
                            Store (Arg1, FA_D)
                            Store (0x012C, Local0)
                            While (LAnd (Local0, TT_P))
                            {
                                Sleep (One)
                                Decrement (Local0)
                            }
                        }
                    }
                    ISMI (0xDC)
                    Store (\FS_F, FS_F)
                    Store (\FS_T, FS_T)
                    Store (\FA_D, FA_D)
                    Store (\FS_Z, FS_Z)
                    And (STAS, 0xFE, STAS)
                    Or (STAS, 0x80, STAS)
                }
            }
        }
    }
    Scope (_SB)
    {
        Device (LID)
        {
            Name (_HID, EisaId ("PNP0C0D"))
            Method (_LID, 0, NotSerialized)
            {
                Store (One, Local0)
                Store (^^PCI0.LPC0.EC0.RP_N (0x04, 0x06), Local0)
                If (LEqual (Local0, Ones))
                {
                    Store (One, Local0)
                }
                Return (Local0)
            }
        }
    }
    Scope (_SB.PCI0.LPC0.EC0)
    {
        Method (_Q81, 0, NotSerialized)
        {
            Notify (LID, 0x80)
        }
    }
    Scope (\)
    {
        Name (TSP, 0x0A)
        Name (TC1, 0x02)
        Name (TC2, 0x0A)
        Name (PSVF, Zero)
        Name (CRTF, Zero)
        Name (TCRT, 0x7F)
        Name (TPSV, 0x7F)
    }
    Scope (_TZ)
    {
        Method (CT_K, 1, NotSerialized)
        {
            And (Arg0, 0xFF, Local0)
            If (LGreaterEqual (Local0, 0x80))
            {
                Subtract (0x0100, Local0, Local0)
                Multiply (Local0, 0x0A, Local0)
                Subtract (0x0AAC, Local0, Local0)
                Return (Local0)
            }
            Multiply (Local0, 0x0A, Local0)
            Add (Local0, 0x0AAC, Local0)
            Return (Local0)
        }
        Method (KT_C, 1, NotSerialized)
        {
            Subtract (Arg0, 0x0AAC, Local0)
            Divide (Local0, 0x0A, Local1, Local0)
            Return (Local0)
        }
        Name (PLCY, Zero)
        ThermalZone (THRM)
        {
            Method (_CRT, 0, NotSerialized)
            {
                Store (\_SB.PCI0.LPC0.EC0.RC_R (), TCRT)
                Return (CT_K (TCRT))
            }
            Method (_TMP, 0, NotSerialized)
            {
                Store (0x05, Local1)
                While (Local1)
                {
                    Store (\_SB.PCI0.LPC0.EC0.RT_M (), Local0)
                    If (LGreater (Local0, TCRT))
                    {
                        Decrement (Local1)
                    }
                    Else
                    {
                        Store (Zero, Local1)
                    }
                }
                Store (TCRT, Local2)
                Decrement (Local2)
                If (LGreater (Local0, Local2))
                {
                    If (LEqual (PSVF, One))
                    {
                        Return (CT_K (Local2))
                    }
                    Else
                    {
                        If (LEqual (CRTF, One))
                        {
                            Return (CT_K (Local0))
                        }
                    }
                    Return (CT_K (Local2))
                }
                Return (CT_K (Local0))
            }
            Method (_PSL, 0, NotSerialized)
            {
                Return (Package (0x01)
                {
                    \_PR.C000
                })
            }
            Method (_TSP, 0, NotSerialized)
            {
                Multiply (TSP, 0x0A, Local0)
                Return (Local0)
            }
            Method (_TC1, 0, NotSerialized)
            {
                Return (TC1)
            }
            Method (_TC2, 0, NotSerialized)
            {
                Return (TC2)
            }
            Method (_PSV, 0, NotSerialized)
            {
                Store (\_SB.PCI0.LPC0.EC0.RS_V (), TPSV)
                Return (CT_K (TPSV))
            }
            Method (_SCP, 1, NotSerialized)
            {
                Store (Zero, PLCY)
                Notify (THRM, 0x81)
            }
        }
    }
    Scope (_SB)
    {
        Device (SLPB)
        {
            Name (_HID, EisaId ("PNP0C0E"))
            Name (_STA, 0x0B)
        }
    }
    Scope (\)
    {
        Method (OE_S, 1, NotSerialized)
        {
            Store (Arg0, ST_P)
            PR_J (Arg0)
        }
        Method (PR_J, 1, Serialized)
        {
        }
        Method (OE_W, 1, NotSerialized)
        {
            PJ_W (Arg0)
        }
        Method (PJ_W, 1, Serialized)
        {
            Store (CTPF, Local0)
            And (Local0, One, Local0)
            If (Local0)
            {
                M010 (0x04, One)
            }
            Else
            {
                M010 (0x04, Zero)
            }
        }
        Method (RP_L, 2, Serialized)
        {
            Return (Zero)
        }
        Scope (_SB.PCI0.LPC0.EC0)
        {
            Method (ST_B, 0, Serialized)
            {
            }
        }
    }
    Scope (\)
    {
        Name (OSFG, Zero)
        Name (OSVT, 0x20)
    }
    Scope (_SB)
    {
        Name (ATKP, One)
    }
    Scope (_SB.PCI0)
    {
        Name (LCDM, 0x0808)
        Name (CRTM, 0x0101)
        Name (TVOM, 0x0202)
        Name (DPBM, 0x0404)
        Name (DPCM, 0x1010)
        Name (DPDM, 0x2020)
        Name (HDMM, 0x0404)
        Name (DVIM, 0x1010)
    }
    Scope (_SB.PCI0.LPC0.EC0)
    {
        Name (FHKM, One)
        Method (FK_W, 0, Serialized)
        {
            While (LNot (FHKM))
            {
                Sleep (0x0A)
            }
            Store (Zero, FHKM)
        }
        Method (FK_S, 0, Serialized)
        {
            Store (One, FHKM)
        }
        Method (SE_C, 1, NotSerialized)
        {
        }
        Method (WE_C, 1, NotSerialized)
        {
            If (LLessEqual (Arg0, 0x04))
            {
                Store (AC_F, Local0)
                Store (AC_P (), AC_F)
                Store (DC_P (Zero), DC_F)
                If (LNotEqual (Local0, AC_F)) {}
            }
        }
        Method (_Q0C, 0, NotSerialized)
        {
            If (LLess (OSYS, 0x07DC))
            {
                If (^^^WMID.LMST)
                {
                    Store (One, Index (^^^WMID.FEBC, Zero))
                    Store (One, Index (^^^WMID.FEBC, One))
                    Notify (WMID, 0xBC)
                }
                Else
                {
                    Store (Zero, Local0)
                    Store (Zero, Local1)
                    If (WLDP)
                    {
                        Store (WRST, Local0)
                        Store (One, Local1)
                    }
                    If (BTDP)
                    {
                        Or (ShiftLeft (BRST, One), Local0, Local0)
                        Store (0x02, Local1)
                    }
                    If (LEqual (Local1, One))
                    {
                        If (LEqual (WRST, One))
                        {
                            M010 (0x28, Zero)
                            Store (Zero, WRST)
                        }
                        Else
                        {
                            M010 (0x28, One)
                            Store (One, WRST)
                        }
                        Return (Zero)
                    }
                    If (LNotEqual (Local1, Zero))
                    {
                        If (LEqual (Local0, 0x03))
                        {
                            M010 (0x28, Zero)
                            Store (Zero, WRST)
                            M010 (0x45, Zero)
                            Store (Zero, BRST)
                        }
                        Else
                        {
                            If (LEqual (Local0, Zero))
                            {
                                M010 (0x28, One)
                                Store (One, WRST)
                                M010 (0x45, One)
                                Store (One, BRST)
                            }
                            Else
                            {
                                M010 (0x28, One)
                                Store (One, WRST)
                                M010 (0x45, Zero)
                                Store (One, BRST)
                            }
                        }
                    }
                }
            }
            Else
            {
                Notify (ARFB, 0x80)
            }
        }
        Method (_Q0D, 0, NotSerialized)
        {
            Notify (SLPB, 0x80)
        }
        Name (SGAS, Buffer (0x0A)
        {
            /* 0000 */   0x01, 0x11, 0x03, 0x10, 0x02, 0x01, 0x11, 0x03,
            /* 0008 */   0x10, 0x02
        })
        Method (SW_G, 2, NotSerialized)
        {
            Store (Arg0, Local1)
            Store (Arg1, Local2)
            Name (NXTD, 0x0100)
            Name (CIDX, 0x0100)
            Store (Zero, Local0)
            While (LLess (Local0, SizeOf (SGAS)))
            {
                Store (DerefOf (Index (SGAS, Local0)), Local3)
                If (LEqual (Local3, Local1))
                {
                    Store (Local0, CIDX)
                    Store (SizeOf (SGAS), Local0)
                }
                Else
                {
                    Increment (Local0)
                }
            }
            Store (CIDX, Local0)
            While (LLess (Local0, SizeOf (SGAS)))
            {
                Increment (Local0)
                Store (DerefOf (Index (SGAS, Local0)), Local3)
                If (LEqual (And (Local3, Local2), Local3))
                {
                    Store (Local0, NXTD)
                    Store (SizeOf (SGAS), Local0)
                }
            }
            If (LGreaterEqual (NXTD, SizeOf (SGAS)))
            {
                Store (One, Local3)
            }
            Else
            {
                Store (NXTD, Local0)
                Store (DerefOf (Index (SGAS, Local0)), Local3)
            }
            Return (Local3)
        }
        Method (_Q0E, 0, NotSerialized)
        {
            If (^^^WMID.LMST)
            {
                Store (One, Index (^^^WMID.FEBC, Zero))
                Store (0x61, Index (^^^WMID.FEBC, One))
                Notify (WMID, 0xBC)
            }
            Else
            {
            }
        }
        Method (_Q0F, 0, NotSerialized)
        {
            If (^^^WMID.LMST)
            {
                Store (One, Index (^^^WMID.FEBC, Zero))
                Store (0x64, Index (^^^WMID.FEBC, One))
                Notify (WMID, 0xBC)
            }
            Store (One, Local0)
        }
        Method (_Q10, 0, NotSerialized)
        {
            Store (CTPF, Local0)
            XOr (Local0, One, Local0)
            Store (Local0, CTPF)
            M010 (0x04, Local0)
            If (^^^WMID.LMST)
            {
                Store (One, Index (^^^WMID.FEBC, Zero))
                Store (0x83, Index (^^^WMID.FEBC, One))
                Notify (WMID, 0xBC)
            }
            If (LOr (LNotEqual (^^^WMID.TOPT, Zero), LGreaterEqual (OSYS, 0x07DD)))
            {
                If (LEqual (TCTP, One))
                {
                    Notify (^^^^I2CD.TPDE, One)
                }
                Else
                {
                    Notify (^^^^I2CD.TPDS, One)
                }
            }
        }
        Name (KBCM, Zero)
        Method (_Q12, 0, NotSerialized)
        {
            Store (One, KBCM)
            EX_T (0xC8, Zero, Zero, Zero, Zero, Zero)
            Store (KBLS, Local0)
            And (Local0, 0x03, Local0)
            If (LGreater (Local0, Zero))
            {
                Decrement (Local0)
            }
            Store (Local0, KBLS)
            Store (One, KBST)
            If (^^^WMID.LMST)
            {
                Store (One, Index (^^^WMID.FEBC, Zero))
                Store (0x84, Index (^^^WMID.FEBC, One))
                Notify (WMID, 0xBC)
            }
        }
        Method (_Q13, 0, NotSerialized)
        {
            Store (One, KBCM)
            EX_T (0xC8, Zero, One, Zero, Zero, Zero)
            Store (KBLS, Local0)
            And (Local0, 0x03, Local0)
            If (LLess (Local0, 0x02))
            {
                Increment (Local0)
            }
            Store (Local0, KBLS)
            Store (One, KBST)
            If (^^^WMID.LMST)
            {
                Store (One, Index (^^^WMID.FEBC, Zero))
                Store (0x84, Index (^^^WMID.FEBC, One))
                Notify (WMID, 0xBC)
            }
        }
        Method (_Q71, 0, NotSerialized)
        {
            If (^^^WMID.LMST)
            {
                Store (One, Index (^^^WMID.FEBC, Zero))
                Store (0x63, Index (^^^WMID.FEBC, One))
                Notify (WMID, 0xBC)
            }
            If (LGreaterEqual (OSYS, 0x07D6))
            {
                Notify (^^^GP17.VGA.LCD, 0x87)
            }
        }
        Method (_Q70, 0, NotSerialized)
        {
            If (^^^WMID.LMST)
            {
                Store (One, Index (^^^WMID.FEBC, Zero))
                Store (0x62, Index (^^^WMID.FEBC, One))
                Notify (WMID, 0xBC)
            }
            If (LGreaterEqual (OSYS, 0x07D6))
            {
                Notify (^^^GP17.VGA.LCD, 0x86)
            }
        }
        Method (_QD9, 0, NotSerialized)
        {
            If (^^^WMID.LMST)
            {
                Store (0x02, Index (^^^WMID.FEBC, Zero))
                Notify (WMID, 0xBC)
            }
        }
        Method (_QB0, 0, NotSerialized)
        {
            Store (Zero, PSVF)
            Store (Zero, CRTF)
            Store (RR_M (0x051C), Local0)
            And (Local0, 0x02, Local1)
            If (LEqual (Local1, 0x02))
            {
                Store (One, CRTF)
            }
            Else
            {
                And (Local0, One, Local1)
                If (LEqual (Local1, One))
                {
                    Store (One, PSVF)
                }
            }
            Notify (\_TZ.THRM, 0x80)
        }
        Method (_Q60, 0, NotSerialized)
        {
            Store (0x60, P80H)
            If (^^^WMID.LMST)
            {
                Store (One, Index (^^^WMID.FEBC, Zero))
                Store (0x87, Index (^^^WMID.FEBC, One))
                Notify (WMID, 0xBC)
            }
            Else
            {
                Notify (PWRB, 0x80)
            }
        }
        Method (_Q68, 0, NotSerialized)
        {
        }
        Method (_QA0, 0, NotSerialized)
        {
            If (AC_P ())
            {
                Store (One, AC_F)
                Store (0x58, Local0)
            }
            Else
            {
                Store (Zero, AC_F)
                Store (0x57, Local0)
            }
            Store (AC_F, PWRS)
            If (^^^WMID.LMST)
            {
                Store (0x08, Index (^^^WMID.FEBC, Zero))
                Notify (WMID, 0xBC)
            }
            If (LLess (OSFG, OSVT))
            {
                ST_B ()
            }
            Notify (AC0, 0x80)
            Sleep (0x14)
            Sleep (0x0A)
            NB_T (0x80)
        }
        Method (_QA3, 0, NotSerialized)
        {
            Notify (BAT0, 0x80)
        }
        Method (_QA5, 0, NotSerialized)
        {
            Notify (BAT0, 0x80)
        }
    }
    Scope (\)
    {
        Method (H0_0, 1, NotSerialized)
        {
            Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0288), Local0)
            Store (\_SB.PCI0.LPC0.EC0.RR_M (0x0298), Local1)
            If (LOr (LEqual (Local0, 0x10), LOr (LEqual (Local0, 0x12), LEqual (
                Local0, 0x30))))
            {
                If (LEqual (Arg0, One))
                {
                    Or (Local1, 0x20, Local1)
                }
                Else
                {
                    And (Local1, 0xDF, Local1)
                }
                \_SB.PCI0.LPC0.EC0.WR_M (0x0298, Local1)
            }
            Else
            {
                If (LEqual (Local0, 0x0B))
                {
                    If (LEqual (Arg0, One))
                    {
                        Or (Local1, 0x40, Local1)
                    }
                    Else
                    {
                        And (Local1, 0xBF, Local1)
                    }
                    \_SB.PCI0.LPC0.EC0.WR_M (0x0298, Local1)
                }
            }
        }
        Method (H0_1, 0, NotSerialized)
        {
            Store (\_SB.PCI0.LPC0.EC0.RR_M (0x07FE), Local0)
            Or (Local0, 0x80, Local0)
            \_SB.PCI0.LPC0.EC0.WR_M (0x07FE, Local0)
            \_SB.PCI0.LPC0.EC0.SW_T (0x08, 0x0B, 0x3A, Zero, 0xC574)
            \_SB.PCI0.LPC0.EC0.SW_T (0x08, 0x0B, 0x3A, Zero, 0xC574)
        }
        Method (H0_2, 0, NotSerialized)
        {
            Store (\_SB.PCI0.LPC0.EC0.RR_M (0x04A0), Local1)
            Or (Local1, 0x88, Local1)
            And (Local1, 0xFE, Local1)
            \_SB.PCI0.LPC0.EC0.WR_M (0x04A0, Local1)
        }
    }
    Name (APST, Zero)
    Scope (_SB.PCI0.LPC0.EC0)
    {
        Method (H2OP, 1, Serialized)
        {
            Store (Arg0, P80H)
        }
        Method (_Q99, 0, NotSerialized)
        {
            H2OP (0x99)
            Store (RR_M (0x0CC6), Local0)
            ACSP (Local0)
        }
        Method (_Q9A, 0, NotSerialized)
        {
            H2OP (0x9A)
            Store (RR_M (0x0CC6), Local0)
            DCSP (Local0)
        }
        Method (ACSP, 1, Serialized)
        {
            Name (_T_1, Zero)
            Name (_T_0, Zero)
            If (LEqual (M009, 0x8B))
            {
                Noop
                If (LAnd (LGreaterEqual (Arg0, Zero), LLessEqual (Arg0, 0x06)))
                {
                    While (One)
                    {
                        Store (ToInteger (Arg0), _T_0)
                        If (LEqual (_T_0, Zero))
                        {
                            Store (Zero, Local0)
                            H2OP (0xA0)
                        }
                        Else
                        {
                            If (LEqual (_T_0, One))
                            {
                                Store (One, Local0)
                                H2OP (0xA1)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x02))
                                {
                                    Store (0x02, Local0)
                                    H2OP (0xA2)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x03))
                                    {
                                        Store (0x02, Local0)
                                        H2OP (0xA3)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x04))
                                        {
                                            Store (0x02, Local0)
                                            H2OP (0xA4)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x05))
                                            {
                                                Store (0x02, Local0)
                                                H2OP (0xA5)
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x06))
                                                {
                                                    Store (0x02, Local0)
                                                    H2OP (0xA6)
                                                }
                                                Else
                                                {
                                                    Store (Zero, Local0)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        Break
                    }
                    If (Ones)
                    {
                        If (LNotEqual (Local0, \_PR.C000.PPCV))
                        {
                            Store (Local0, \_PR.C000.PPCV)
                            Store (Local0, \_PR.C001.PPCV)
                            Store (Local0, \_PR.C002.PPCV)
                            Store (Local0, \_PR.C003.PPCV)
                            Store (Local0, \_PR.C004.PPCV)
                            Store (Local0, \_PR.C005.PPCV)
                            Store (Local0, \_PR.C006.PPCV)
                            Store (Local0, \_PR.C007.PPCV)
                            Notify (\_PR.C000, 0x80)
                            Notify (\_PR.C001, 0x80)
                            Notify (\_PR.C002, 0x80)
                            Notify (\_PR.C003, 0x80)
                            Notify (\_PR.C004, 0x80)
                            Notify (\_PR.C005, 0x80)
                            Notify (\_PR.C006, 0x80)
                            Notify (\_PR.C007, 0x80)
                        }
                    }
                }
            }
            Else
            {
                If (LAnd (LGreaterEqual (Arg0, Zero), LLessEqual (Arg0, 0x06)))
                {
                    While (One)
                    {
                        Store (ToInteger (Arg0), _T_1)
                        If (LEqual (_T_1, Zero))
                        {
                            Store (Zero, Local0)
                            Store (Zero, Local2)
                            H2OP (0xA0)
                        }
                        Else
                        {
                            If (LEqual (_T_1, One))
                            {
                                Store (One, Local0)
                                Store (Zero, Local2)
                                H2OP (0xA1)
                            }
                            Else
                            {
                                If (LEqual (_T_1, 0x02))
                                {
                                    Store (0x02, Local0)
                                    Store (Zero, Local2)
                                    H2OP (0xA2)
                                }
                                Else
                                {
                                    If (LEqual (_T_1, 0x03))
                                    {
                                        Store (0x02, Local0)
                                        Store (Zero, Local2)
                                        H2OP (0xA3)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_1, 0x04))
                                        {
                                            Store (0x02, Local0)
                                            Store (One, Local2)
                                            H2OP (0xA4)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_1, 0x05))
                                            {
                                                Store (0x02, Local0)
                                                Store (One, Local2)
                                                H2OP (0xA5)
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_1, 0x06))
                                                {
                                                    Store (0x02, Local0)
                                                    Store (One, Local2)
                                                    H2OP (0xA6)
                                                }
                                                Else
                                                {
                                                    Store (Zero, Local0)
                                                    Store (Zero, Local2)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        Break
                    }
                    If (Ones)
                    {
                        If (LEqual (Local2, One))
                        {
                            M010 (0x82, Zero)
                        }
                        Else
                        {
                            M010 (0x82, One)
                        }
                        If (LNotEqual (Local0, \_PR.C000.PPCV))
                        {
                            Store (Local0, \_PR.C000.PPCV)
                            Store (Local0, \_PR.C001.PPCV)
                            Store (Local0, \_PR.C002.PPCV)
                            Store (Local0, \_PR.C003.PPCV)
                            Store (Local0, \_PR.C004.PPCV)
                            Store (Local0, \_PR.C005.PPCV)
                            Store (Local0, \_PR.C006.PPCV)
                            Store (Local0, \_PR.C007.PPCV)
                            Notify (\_PR.C000, 0x80)
                            Notify (\_PR.C001, 0x80)
                            Notify (\_PR.C002, 0x80)
                            Notify (\_PR.C003, 0x80)
                            Notify (\_PR.C004, 0x80)
                            Notify (\_PR.C005, 0x80)
                            Notify (\_PR.C006, 0x80)
                            Notify (\_PR.C007, 0x80)
                        }
                    }
                }
            }
        }
        Method (DCSP, 1, Serialized)
        {
            Name (_T_1, Zero)
            Name (_T_0, Zero)
            If (LEqual (M009, 0x8B))
            {
                Noop
                If (LAnd (LGreaterEqual (Arg0, Zero), LLessEqual (Arg0, 0x06)))
                {
                    While (One)
                    {
                        Store (ToInteger (Arg0), _T_0)
                        If (LEqual (_T_0, Zero))
                        {
                            Store (Zero, Local0)
                            H2OP (0xA0)
                        }
                        Else
                        {
                            If (LEqual (_T_0, One))
                            {
                                Store (One, Local0)
                                H2OP (0xA1)
                            }
                            Else
                            {
                                If (LEqual (_T_0, 0x02))
                                {
                                    Store (0x02, Local0)
                                    H2OP (0xA2)
                                }
                                Else
                                {
                                    If (LEqual (_T_0, 0x03))
                                    {
                                        Store (0x02, Local0)
                                        H2OP (0xA3)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_0, 0x04))
                                        {
                                            Store (0x02, Local0)
                                            H2OP (0xA4)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_0, 0x05))
                                            {
                                                Store (0x02, Local0)
                                                H2OP (0xA5)
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_0, 0x06))
                                                {
                                                    Store (0x02, Local0)
                                                    H2OP (0xA6)
                                                }
                                                Else
                                                {
                                                    Store (Zero, Local0)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        Break
                    }
                    If (Ones)
                    {
                        If (LNotEqual (Local0, \_PR.C000.PPCV))
                        {
                            Store (Local0, \_PR.C000.PPCV)
                            Store (Local0, \_PR.C001.PPCV)
                            Store (Local0, \_PR.C002.PPCV)
                            Store (Local0, \_PR.C003.PPCV)
                            Store (Local0, \_PR.C004.PPCV)
                            Store (Local0, \_PR.C005.PPCV)
                            Store (Local0, \_PR.C006.PPCV)
                            Store (Local0, \_PR.C007.PPCV)
                            Notify (\_PR.C000, 0x80)
                            Notify (\_PR.C001, 0x80)
                            Notify (\_PR.C002, 0x80)
                            Notify (\_PR.C003, 0x80)
                            Notify (\_PR.C004, 0x80)
                            Notify (\_PR.C005, 0x80)
                            Notify (\_PR.C006, 0x80)
                            Notify (\_PR.C007, 0x80)
                        }
                    }
                }
            }
            Else
            {
                If (LAnd (LGreaterEqual (Arg0, Zero), LLessEqual (Arg0, 0x06)))
                {
                    While (One)
                    {
                        Store (ToInteger (Arg0), _T_1)
                        If (LEqual (_T_1, Zero))
                        {
                            Store (Zero, Local0)
                            Store (Zero, Local2)
                            H2OP (0xA0)
                        }
                        Else
                        {
                            If (LEqual (_T_1, One))
                            {
                                Store (Zero, Local0)
                                Store (Zero, Local2)
                                H2OP (0xA1)
                            }
                            Else
                            {
                                If (LEqual (_T_1, 0x02))
                                {
                                    Store (One, Local0)
                                    Store (Zero, Local2)
                                    H2OP (0xA2)
                                }
                                Else
                                {
                                    If (LEqual (_T_1, 0x03))
                                    {
                                        Store (0x02, Local0)
                                        Store (Zero, Local2)
                                        H2OP (0xA3)
                                    }
                                    Else
                                    {
                                        If (LEqual (_T_1, 0x04))
                                        {
                                            Store (0x02, Local0)
                                            Store (Zero, Local2)
                                            H2OP (0xA4)
                                        }
                                        Else
                                        {
                                            If (LEqual (_T_1, 0x05))
                                            {
                                                Store (0x02, Local0)
                                                Store (One, Local2)
                                                H2OP (0xA5)
                                            }
                                            Else
                                            {
                                                If (LEqual (_T_1, 0x06))
                                                {
                                                    Store (0x02, Local0)
                                                    Store (One, Local2)
                                                    H2OP (0xA6)
                                                }
                                                Else
                                                {
                                                    Store (Zero, Local0)
                                                    Store (Zero, Local2)
                                                }
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        Break
                    }
                    If (Ones)
                    {
                        If (LEqual (Local2, One))
                        {
                            M010 (0x82, Zero)
                        }
                        Else
                        {
                            M010 (0x82, One)
                        }
                        If (LNotEqual (Local0, \_PR.C000.PPCV))
                        {
                            Store (Local0, \_PR.C000.PPCV)
                            Store (Local0, \_PR.C001.PPCV)
                            Store (Local0, \_PR.C002.PPCV)
                            Store (Local0, \_PR.C003.PPCV)
                            Store (Local0, \_PR.C004.PPCV)
                            Store (Local0, \_PR.C005.PPCV)
                            Store (Local0, \_PR.C006.PPCV)
                            Store (Local0, \_PR.C007.PPCV)
                            Notify (\_PR.C000, 0x80)
                            Notify (\_PR.C001, 0x80)
                            Notify (\_PR.C002, 0x80)
                            Notify (\_PR.C003, 0x80)
                            Notify (\_PR.C004, 0x80)
                            Notify (\_PR.C005, 0x80)
                            Notify (\_PR.C006, 0x80)
                            Notify (\_PR.C007, 0x80)
                        }
                    }
                }
            }
        }
        Method (_QC2, 0, NotSerialized)
        {
            H2OP (0xC2)
            If (Ones)
            {
                If (LEqual (M009, 0x8B))
                {
                    Noop
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x05, 0x20, 0x4E, 0x00, 0x00
                        })
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x07, 0x20, 0x4E, 0x00, 0x00
                        })
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x06, 0x20, 0x4E, 0x00, 0x00
                        })
                }
                Else
                {
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x05, 0xE0, 0x2E, 0x00, 0x00
                        })
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x07, 0xE0, 0x2E, 0x00, 0x00
                        })
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x06, 0x98, 0x3A, 0x00, 0x00
                        })
                }
            }
        }
        Method (_QC3, 0, NotSerialized)
        {
            H2OP (0xC3)
            If (Ones)
            {
                If (LEqual (M009, 0x8B))
                {
                    Noop
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x05, 0xE0, 0x2E, 0x00, 0x00
                        })
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x07, 0xE0, 0x2E, 0x00, 0x00
                        })
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x06, 0xE0, 0x2E, 0x00, 0x00
                        })
                }
                Else
                {
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x05, 0xE0, 0x2E, 0x00, 0x00
                        })
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x07, 0xE0, 0x2E, 0x00, 0x00
                        })
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x06, 0xE0, 0x2E, 0x00, 0x00
                        })
                }
            }
        }
        Method (_QC4, 0, NotSerialized)
        {
            H2OP (0xC4)
            If (Ones)
            {
                If (LEqual (M009, 0x8B))
                {
                    Noop
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x05, 0xA8, 0x61, 0x00, 0x00
                        })
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x07, 0xA8, 0x61, 0x00, 0x00
                        })
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x06, 0x30, 0x75, 0x00, 0x00
                        })
                }
                Else
                {
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x05, 0x98, 0x3A, 0x00, 0x00
                        })
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x07, 0xA8, 0x61, 0x00, 0x00
                        })
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x06, 0x30, 0x75, 0x00, 0x00
                        })
                }
            }
        }
        Method (_QCC, 0, NotSerialized)
        {
            H2OP (0xCC)
            If (Ones)
            {
                If (LEqual (M009, 0x8B))
                {
                    Noop
                }
                Else
                {
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x05, 0x98, 0x3A, 0x00, 0x00
                        })
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x07, 0xA8, 0x61, 0x00, 0x00
                        })
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x06, 0x30, 0x75, 0x00, 0x00
                        })
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x03, 0x50, 0x00, 0x00, 0x00
                        })
                }
            }
        }
        Method (_QCD, 0, NotSerialized)
        {
            H2OP (0xCD)
            If (Ones)
            {
                If (LEqual (M009, 0x8B))
                {
                    Noop
                }
                Else
                {
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x05, 0x98, 0x3A, 0x00, 0x00
                        })
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x07, 0x98, 0x3A, 0x00, 0x00
                        })
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x06, 0x98, 0x3A, 0x00, 0x00
                        })
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x03, 0x4A, 0x00, 0x00, 0x00
                        })
                }
            }
        }
        Method (_QCE, 0, NotSerialized)
        {
            H2OP (0xCE)
            If (Ones)
            {
                If (LEqual (M009, 0x8B))
                {
                    Noop
                }
                Else
                {
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x05, 0x98, 0x3A, 0x00, 0x00
                        })
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x07, 0xA8, 0x61, 0x00, 0x00
                        })
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x06, 0x30, 0x75, 0x00, 0x00
                        })
                    ALIB (0x0C, Buffer (0x07)
                        {
                             0x07, 0x00, 0x03, 0x5A, 0x00, 0x00, 0x00
                        })
                }
            }
        }
    }
}
