{ Options }
{.$DEFINE TEETRIAL}  { <-- remove the dot to compile with evaluation code }
{.$DEFINE NOUSE_BDE} { <-- remove the dot to avoid using BDE (in QRChart,etc) }
{.$DEFINE TEEOCX}    { <-- remove the dot to compile the ActiveX version }


{ TeeChart Pro 4.0 & TeeTree 1.0 Include file: TeeDefs.Inc }
{$IFNDEF WIN32}
  {$DEFINE D1}
{$ELSE}
  {$H+}
  {$IFDEF VER125}
    {$DEFINE D3}
    {$DEFINE D4}
    {$DEFINE C4}
  {$ENDIF}
  {$IFDEF VER120}
    {$DEFINE D3}
    {$DEFINE D4}
    {$DEFINE C3D4}
  {$ENDIF}
  {$IFDEF VER110}
    {$DEFINE D3}
    {$IFDEF BCB}
      {$DEFINE C3}
      {$DEFINE C3D4}
      {$ObjExportAll On}
    {$ELSE}
      {$DEFINE D4}
      {$DEFINE C3D4}
    {$ENDIF}
  {$ENDIF}
  {$IFDEF VER100}
    {$DEFINE D3}
  {$ENDIF}
  {$IFDEF VER90}
    {$DEFINE D2}
    {$DEFINE D2C1}
  {$ENDIF}
  {$IFDEF VER93}
    {$DEFINE C1}
    {$DEFINE D2C1}
  {$ENDIF}
{$ENDIF}

{$IFDEF TEEOCX}
{$DEFINE TEEJPEG}  { always }
{$ENDIF}

{$IFNDEF D1}
{$IFNDEF D2}
{$IFNDEF C1}
{$DEFINE TEEHELPEDITOR}   { <-- Show Help at TeeChart editor dialog }
{$ENDIF}
{$ENDIF}
{$ENDIF}


