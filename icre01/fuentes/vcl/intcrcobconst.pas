unit IntCrCobConst;

interface

uses
  Windows, Messages, SysUtils, Classes,  Graphics, Controls;




const
   coCR              = #13;                                                // Retorno de carro
   cRowColor         = TColor( 195 or  ( 230 shl 8 ) or ( 200 shl 16 ) );  // Color del GRID
   cRowWColor        = clRed;                                              // Color de warning para cobranza anticipadas
   cDescRowWColor    = 'clRed';                                            // Color de warning para cobranza anticipadas
   coPagoGF          = 'GF';                                               // Tiene pago con garantía FEGA
   cID_CONTRATO      = 'ID_CONTRATO';                                      // Campo para el id contrato
   cID_CONTROL_EXT   = 'ID_CONTROL_EXT';                                   // Campo para el id control externo
   cID_CRED_EXTERNO  = 'ID_CRED_EXTERNO';                                  // Campo para el credito externo
   cCVE_EMISOR_NAFIN = 'CVE_EMISOR_NAFIN';                                 // Campo para la clave de emisor NAFIN
   cID_ACREDITADO    = 'ID_ACREDITADO';                                    // Campo para la clave de emisor NAFIN
   //
   coComis       = 'CN';
   coInteres     = 'IN';
   coFinAdic     = 'FN';
   coCapital     = 'CP';
   coTodos       = 'TD';
   // Claves de los tipos de búsqueda
   cobpGpoProd   = '1';
   cobpAcred     = '2';
   cobpAutor     = '3';
   cobpDisp      = '4';
   cobpProv      = '5';
   cobpEmNaf     = '6';
   cobpIdFIRA    = '7';
   cobpNoCtrl    = '8';
   cobpIdNafin   = '9';
   // Descripción de los tipos de búsqueda
   coDescPGpo    = 'Gpo Producto';
   coDescAcred   = 'Acreditado';
   coDescAutor   = 'Autorización';
   coDescProv    = 'Proveedor';
   coDescDisp    = 'Disposición';
   coDescNoCtrl  = 'No. Control';
   coDescIdFIRA  = 'ID-FIRA';
   coDescEmNaf   = 'Emisor Nafín';
   coDescProcrea = 'Procrea';
   coDescIdNafin = 'ID-Nafín';
   // Tipo de Cobranza
   coCobAN       = '1';
   coCobMD       = '2';
   coCobIM       = '3';
   coCobGN       = '4';
   // Tipo de Cobranza Anticipada
   coTD          = 'TD';  // Tradicional
   coPA          = 'PA';  // Pago Anticipado
   coMA          = 'MA';  // Mensualidad Anticipada
   // Sub Tipo de Cobranza Anticipada
   coAP          = 'AP';  // Acortar Plazo
   coDM          = 'DM';  // Disminuir Monto
   //
   coAutorizacion = 'AUTORIZACION';
   coCveAutoriza  = 'AR';
   coDevolucion   = 'DEVOLUCION';
   coCveDevol     = 'DF';


   
implementation

end.
