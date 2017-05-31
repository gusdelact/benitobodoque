(*
UCRPEDEF.INC
Seagate Crystal Reports VCL Component - Compiler Directives & Conditional Defines
Copyright(c) 1999 Seagate Software
*)

{******************************************************************************}
{  Compiler Directives                                                         }
{******************************************************************************}
{=== Code Generation Directives ===}
{$A-}   {Align Fields off: required to get proper values from
         PEGetJobStatus, PEExportOptions, etc.}
{$W-}   {StackFrames off: only for Win 3.0, not required}
{$U-}   {Pentium-Safe FDIV off}

{$O+}   {Optimizations on}
{$IFDEF VER90} {Delphi 2}
  {$O-} {Optimizations off: needed for Ucrpe32 and Delphi2}
{$ENDIF VER90}
{$IFDEF VER93} {C++Builder 1}
  {$O-} {Optimizations off: needed for Ucrpe32 and C++Builder1}
{$ENDIF VER93}

{=== Runtime Error Checking ===}
{$S+}   {Stack Checking on: for Stack overflows}
{$I+}   {I/O Checking on}
{$Q-}   {Overflow Checking off}
{$IFOPT D+}
  {$R+} {Range-Checking on: for development debugging}
{$ELSE}
  {$R-} {Range-Checking off: for distribution}
{$ENDIF}

{=== Syntax Options ===}
{$B-}   {Complete Boolean Evaluation off}
{$X+}   {Extended Syntax on: for Pchar types, etc.}
{$H+}   {Huge Strings on}
{$V-}   {Strict Var Strings off}
{$P+}   {Open Parameters on}


{******************************************************************************}
{  Conditional Defines                                                         }
{******************************************************************************}
{ Delphi 5.0 }
{$IFDEF VER130}
  {$DEFINE CR_DELPHI5}
  {$DEFINE CR_ALL5}
  {$DEFINE CR_5UP}
  {$DEFINE CR_4UP}
  {$DEFINE CR_3UP}
  {$DEFINE CR_2UP}
  {$DEFINE CR_D5UP}
  {$DEFINE CR_D4UP}
  {$DEFINE CR_D3UP}
  {$DEFINE CR_D2UP}
  {$DEFINE CR_D5DOWN}
{$ENDIF VER130}

{ Delphi 4.0 }
{$IFDEF VER120}
  {$DEFINE CR_DELPHI4}
  {$DEFINE CR_ALL4}
  {$DEFINE CR_4UP}
  {$DEFINE CR_3UP}
  {$DEFINE CR_2UP}
  {$DEFINE CR_D4UP}
  {$DEFINE CR_D3UP}
  {$DEFINE CR_D2UP}
  {$DEFINE CR_D5DOWN}
  {$DEFINE CR_D4DOWN}
{$ENDIF VER120}

{ Delphi 3.0 }
{$IFDEF VER100}
  {$DEFINE CR_DELPHI3}
  {$DEFINE CR_ALL3}
  {$DEFINE CR_3UP}
  {$DEFINE CR_2UP}
  {$DEFINE CR_D3UP}
  {$DEFINE CR_D2UP}
  {$DEFINE CR_D5DOWN}
  {$DEFINE CR_D4DOWN}
  {$DEFINE CR_D3DOWN}
{$ENDIF VER100}

{ Delphi 2.0 }
{$IFDEF VER90}
  {$DEFINE CR_DELPHI2}
  {$DEFINE CR_ALL2}
  {$DEFINE CR_2UP}
  {$DEFINE CR_D2UP}
  {$DEFINE CR_D5DOWN}
  {$DEFINE CR_D4DOWN}
  {$DEFINE CR_D3DOWN}
  {$DEFINE CR_D2DOWN}
{$ENDIF VER90}

{ C++Builder 4.0 }
{$IFDEF VER125}
  {$DEFINE CR_BUILDER4}
  {$DEFINE CR_ALL4}
  {$DEFINE CR_4UP}
  {$DEFINE CR_3UP}
  {$DEFINE CR_2UP}
  {$DEFINE CR_B4UP}
  {$DEFINE CR_B3UP}
  {$DEFINE CR_B1UP}
  {$DEFINE CR_B4DOWN}
{$ENDIF VER125}

{ C++Builder 3.0 }
{$IFDEF VER110}
  {$DEFINE CR_BUILDER3}
  {$DEFINE CR_ALL3}
  {$DEFINE CR_3UP}
  {$DEFINE CR_2UP}
  {$DEFINE CR_B3UP}
  {$DEFINE CR_B1UP}
  {$DEFINE CR_B4DOWN}
  {$DEFINE CR_B3DOWN}
{$ENDIF VER110}

{ C++Builder 1.0 }
{$IFDEF VER93}
  {$DEFINE CR_BUILDER1}
  {$DEFINE CR_ALL2}
  {$DEFINE CR_2UP}
  {$DEFINE CR_B1UP}
  {$DEFINE CR_B4DOWN}
  {$DEFINE CR_B3DOWN}
  {$DEFINE CR_B1DOWN}
{$ENDIF VER93}

{If it isn't any recognized version, set unknown flag}
{$IFNDEF CR_2UP}
  {$DEFINE CR_3UP}
  {$DEFINE CR_UNKNOWN}
{$ENDIF CR_2UP}

